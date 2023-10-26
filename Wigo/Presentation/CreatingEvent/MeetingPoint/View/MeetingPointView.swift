//
//  MeetingPointView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit
import YandexMapsMobile
import CoreLocation

protocol MeetingPointViewDelegate: AnyObject {
    func closeMeetingPoint()
    func didTapSendLocation(longitude: Double, latitude: Double, address: String)
}

final class MeetingPointView: UIView, YMKMapCameraListener {
    
    struct Address {
        let name: String
    }
    
    struct CurrentLocation {
        var longitude: Double?
        var latitude: Double?
    }
    
    // MARK: - Public properties
    
    weak var delegate: MeetingPointViewDelegate?
    
    // MARK: - Private properties
    
    private let locationManager: CLLocationManager = .init()
    private var isFetchedUserCoordinate: Bool = false
    private var currentLocation: CurrentLocation? {
        didSet {
            print("1111\(String(describing: currentLocation))")
        }
    }
    private var locationModel: [LocationPanelTableViewCell.LocationModel] = []
    private var address: [Address] = []
    
    private var searchManager: YMKSearchManager?
    private var searchSession: YMKSearchSession?
    private var point: YMKPoint?
    
    // MARK: - UI properties
    
    private let mapView: YMKMapView = .init()
    private let customNavigationBar: CustomNavigationBar = .init()
    private let locationPanelView: UIView = .init()
    private let stackView: UIStackView = .init()
    private let sendLocationView: LocationView = .init(text: Localizations.MeetingPoint.sendGeolocation, image: Images.Map.location.image)
    private let changeLocationView: UIView = .init()
    private let changeLocationLabel: UILabel = .init()
    private let tableView: UITableView = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    func onCameraPositionChanged(with map: YMKMap,
                                 cameraPosition: YMKCameraPosition,
                                 cameraUpdateReason: YMKCameraUpdateReason,
                                 finished: Bool) {
        
        if finished {
            let responseHandler = {(searchResponse: YMKSearchResponse?, error: Error?) -> Void in
                if let response = searchResponse {
                    self.onSearchResponse(response)
                } else {
                    self.onSearchError(error!)
                }
            }

            searchSession = searchManager!.submit(
                withText: "",
                geometry: YMKVisibleRegionUtils.toPolygon(with: map.visibleRegion),
                searchOptions: YMKSearchOptions(
                    searchTypes: .biz,
                    resultPageSize: 15,
                    userPosition: nil,
                    origin: nil,
                    geometry: true,
                    disableSpellingCorrection: false,
                    filters: nil
                ),
                responseHandler: responseHandler)
        }
        
        guard finished else { return }
        
        self.currentLocation = .init(longitude: cameraPosition.target.longitude, latitude: cameraPosition.target.latitude)
        
    }
    
    func onSearchResponse(_ response: YMKSearchResponse) {
        let mapObjects = mapView.mapWindow.map.mapObjects
        mapObjects.clear()
        
        print("error \(response.collection.children)")
        
        locationModel = response.collection.children.map { children in
            return LocationPanelTableViewCell.LocationModel(
                name: children.obj?.name ?? "",
                description: children.obj?.descriptionText ?? "",
                latitude: children.obj?.geometry.first?.point?.latitude,
                longitude: children.obj?.geometry.first?.point?.longitude
            )
        }
        tableView.reloadData()
    }
    
    func onSearchError(_ error: Error) {
        let searchError = (error as NSError).userInfo[YRTUnderlyingErrorKey] as! YRTError
        var errorMessage = "Unknown error"
        if searchError.isKind(of: YRTNetworkError.self) {
            errorMessage = "Network error"
        } else if searchError.isKind(of: YRTRemoteError.self) {
            errorMessage = "Remote server error"
        }
        
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
    
    func createSearchManager() {
        searchManager = YMKSearch.sharedInstance().createSearchManager(with: .combined)
        
        mapView.mapWindow.map.addCameraListener(with: self)
    }
    
    private func configureViews() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        let mapKit = YMKMapKit.sharedInstance()
        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)
        userLocationLayer.setVisibleWithOn(true)
        userLocationLayer.setObjectListenerWith(self)
        userLocationLayer.isHeadingEnabled = false
        
        customNavigationBar.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        locationPanelView.backgroundColor = Colors.Map.locationBackground.color
        locationPanelView.layer.cornerRadius = 16
        locationPanelView.clipsToBounds = true
        locationPanelView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        sendLocationView.setDescription(text: Localizations.MeetingPoint.accuracy)
        let sendLocationGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSendLocationGesture))
        sendLocationView.addGestureRecognizer(sendLocationGesture)
        sendLocationView.translatesAutoresizingMaskIntoConstraints = false
        
        changeLocationView.backgroundColor = .darkGray
        changeLocationView.layer.masksToBounds = true
        changeLocationView.layer.shadowOpacity = 10
        changeLocationView.translatesAutoresizingMaskIntoConstraints = false
        
        changeLocationLabel.text = Localizations.MeetingPoint.changeLocation.uppercased()
        changeLocationLabel.font = .systemFont(ofSize: 12, weight: .bold)
        changeLocationLabel.textColor = .lightGray
        changeLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(
            LocationPanelTableViewCell.self,
            forCellReuseIdentifier: LocationPanelTableViewCell.locationPanelTableViewCellIdentifire
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapSendLocationGesture() {
        guard let longitude = currentLocation?.longitude else { return }
        guard let latitude = currentLocation?.latitude else { return }
        
        let address = CLGeocoder.init()
        address.reverseGeocodeLocation(CLLocation.init(latitude: latitude, longitude: longitude)) { (places, error) in
            if error == nil{
                if let place = places{
                    self.address = place.map { id in
                        return Address(name: id.name ?? "")
                    }
                    guard let currentAddress = (self.address.first) else { return }
                    let cleanString = currentAddress.name
                    
                    self.delegate?.didTapSendLocation(longitude: longitude, latitude: latitude, address: "\(cleanString)")
                }
            }
        }
    }
    
    @objc
    private func didTapBackButton() {
        delegate?.closeMeetingPoint()
    }
    
    private func configureLayouts() {
        addSubview(mapView)
        addSubview(customNavigationBar)
        addSubview(locationPanelView)
        
        locationPanelView.addSubview(stackView)
        stackView.addArrangedSubview(sendLocationView)
        
        locationPanelView.addSubview(changeLocationView)
        changeLocationView.addSubview(changeLocationLabel)
        
        locationPanelView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: topAnchor),
            customNavigationBar.leftAnchor.constraint(equalTo: leftAnchor),
            customNavigationBar.rightAnchor.constraint(equalTo: rightAnchor),
            
            mapView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            mapView.leftAnchor.constraint(equalTo: leftAnchor),
            mapView.rightAnchor.constraint(equalTo: rightAnchor),
            
            locationPanelView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -32),
            locationPanelView.leftAnchor.constraint(equalTo: leftAnchor),
            locationPanelView.rightAnchor.constraint(equalTo: rightAnchor),
            locationPanelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            
            stackView.topAnchor.constraint(equalTo: locationPanelView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: locationPanelView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: locationPanelView.rightAnchor),
            
            changeLocationView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            changeLocationView.leftAnchor.constraint(equalTo: locationPanelView.leftAnchor),
            changeLocationView.rightAnchor.constraint(equalTo: locationPanelView.rightAnchor),
            
            changeLocationLabel.topAnchor.constraint(equalTo: changeLocationView.topAnchor, constant: 6),
            changeLocationLabel.leftAnchor.constraint(equalTo: changeLocationView.leftAnchor, constant: 40),
            changeLocationLabel.rightAnchor.constraint(equalTo: locationPanelView.rightAnchor),
            changeLocationLabel.bottomAnchor.constraint(equalTo: changeLocationView.bottomAnchor, constant: -6),
            
            tableView.topAnchor.constraint(equalTo: changeLocationView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: locationPanelView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: locationPanelView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: locationPanelView.bottomAnchor,constant: -40),
            tableView.heightAnchor.constraint(equalToConstant: 190)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension MeetingPointView {}

// MARK: - UITableViewDataSource

extension MeetingPointView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: LocationPanelTableViewCell.locationPanelTableViewCellIdentifire,
            for: indexPath
        ) as? LocationPanelTableViewCell
        
        cell?.set(
            title: locationModel[indexPath.row].name,
            description: locationModel[indexPath.row].description
        )
        
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension MeetingPointView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let latitude = locationModel[indexPath.row].latitude,
            let longitude = locationModel[indexPath.row].longitude
        else { return }
        
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(
                target: .init(
                    latitude: latitude,
                    longitude: longitude
                ),
                zoom: 18,
                azimuth: 0,
                tilt: 0
            )
        )
        
        let addressName = locationModel[indexPath.row].name
        
        guard let jsonDataName = try? JSONEncoder().encode(addressName) else { return }
        let jsonStringName = String(data: jsonDataName, encoding: .utf8)!
        
        let stringName = jsonStringName
        let unsafeMutablePointerCCharName = strdup(stringName)
        let unsafePointerName = UnsafePointer(unsafeMutablePointerCCharName)
        
        let lat = String(describing: latitude)
        let long = String(describing: longitude)
        
        guard let jsonData = try? JSONEncoder().encode(lat + "," + long) else { return }
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        print(jsonString)
        
        let string = jsonString
        let unsafeMutablePointerCChar = strdup(string)
        let unsafePointer = UnsafePointer(unsafeMutablePointerCChar)
    }
}

// MARK: - CLLocationManagerDelegate

extension MeetingPointView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }

//        self.currentLocation = .init(longitude: coordinate.longitude, latitude: coordinate.latitude)

        guard !isFetchedUserCoordinate else { return }

        mapView.mapWindow.map.move(
            with: YMKCameraPosition(
                target: .init(
                    latitude: coordinate.latitude,
                    longitude: coordinate.longitude
                ),
                zoom: 14,
                azimuth: 0,
                tilt: 0
            )
        )

        isFetchedUserCoordinate = true
        
        let address = CLGeocoder.init()
        address.reverseGeocodeLocation(CLLocation.init(latitude: coordinate.latitude, longitude: coordinate.longitude)) { (places, error) in
            if error == nil{
                if let place = places{
                    self.address = place.map { id in
                        return Address(name: id.name ?? "")
                    }
                }
            }
        }
    }
}

// MARK: - YMKUserLocationObjectListener

extension MeetingPointView: YMKUserLocationObjectListener {
    func onObjectAdded(with view: YMKUserLocationView) {}
    
    func onObjectRemoved(with view: YMKUserLocationView) {}
    
    func onObjectUpdated(with view: YMKUserLocationView, event: YMKObjectEvent) {
        let pinPlacemark = view.pin.useCompositeIcon()
        
        pinPlacemark.setIconWithName(
            "location",
            image: Images.Map.location.image,
            style:YMKIconStyle(
                anchor: CGPoint(x: 0.5, y: 0.5) as NSValue,
                rotationType:YMKRotationType.rotate.rawValue as NSNumber,
                zIndex: 1,
                flat: true,
                visible: true,
                scale: 1,
                tappableArea: nil
            )
        )
        
        view.accuracyCircle.fillColor = UIColor.clear
    }
}
