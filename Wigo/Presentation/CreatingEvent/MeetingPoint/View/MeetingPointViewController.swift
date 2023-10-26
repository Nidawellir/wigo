//
//  MeetingPointViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class MeetingPointViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: MeetingPointModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: MeetingPointPresenterInput
    
    // MARK: - UI properties
    
    private let meetingPointView: MeetingPointView = .init()
    
    // MARK: - Initialization
    
    init(presenter: MeetingPointPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = meetingPointView
        
        meetingPointView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meetingPointView.createSearchManager()
    }
}

// MARK: - MeetingPointModuleInput

extension MeetingPointViewController: MeetingPointModuleInput {}

// MARK: - Public methods

extension MeetingPointViewController {}

// MARK: - MeetingPointPresenterOutput

extension MeetingPointViewController: MeetingPointPresenterOutput {}


// MARK: - MeetingPointViewDelegate

extension MeetingPointViewController: MeetingPointViewDelegate {
    func didTapSendLocation(longitude: Double, latitude: Double, address: String) {
        output?.sendGeolocation(longitude: longitude, latitude: latitude, address: address)
    }
    
    func closeMeetingPoint() {
        output?.closeMeetingPoint()
    }
}
