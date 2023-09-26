//
//  MainScreanView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol MainScreanViewDelegate: AnyObject {
    func didTapEventButton()
}

final class MainScreanView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: MainScreanViewDelegate?
    
    // MARK: - UI properties
    
    private let customNavigationBarView: CustomNavigationBarView = .init()
    private let filterView: FilterView = .init()
    private let videoCardsContainerView: VideoCardsContainerView = .init()
//    private let findEventsView: FindEventsView = .init()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        customNavigationBarView.setName(name: "Adam")
        customNavigationBarView.delegate = self
        customNavigationBarView.translatesAutoresizingMaskIntoConstraints = false
        
        filterView.translatesAutoresizingMaskIntoConstraints = false
        
        videoCardsContainerView.isHidden = false
        videoCardsContainerView.translatesAutoresizingMaskIntoConstraints = false
        
//        findEventsView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(customNavigationBarView)
        addSubview(filterView)
        addSubview(videoCardsContainerView)
//        addSubview(findEventsView)
        
        NSLayoutConstraint.activate([
            customNavigationBarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            customNavigationBarView.leftAnchor.constraint(equalTo: leftAnchor),
            customNavigationBarView.rightAnchor.constraint(equalTo: rightAnchor),
            
            filterView.topAnchor.constraint(equalTo: customNavigationBarView.bottomAnchor),
            filterView.leftAnchor.constraint(equalTo: leftAnchor),
            filterView.rightAnchor.constraint(equalTo: rightAnchor),
            
            videoCardsContainerView.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: 16),
            videoCardsContainerView.leftAnchor.constraint(equalTo: leftAnchor),
            videoCardsContainerView.rightAnchor.constraint(equalTo: rightAnchor),
            videoCardsContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
//            findEventsView.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: 16),
//            findEventsView.leftAnchor.constraint(equalTo: leftAnchor),
//            findEventsView.rightAnchor.constraint(equalTo: rightAnchor),
//            findEventsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension MainScreanView {
    func setFilters(viewModels: [FilterCollectionViewCell.ViewModel]) {
        filterView.set(viewModels: viewModels)
    }
    
    func setVideoCards(viewModel: [VideoCardView.ViewModel]) {
        videoCardsContainerView.setVideoCardModel(viewModels: viewModel)
    }
}

// MARK: - CustomNavigationBarDelegate

extension MainScreanView: CustomNavigationBarDelegate {
    func didTapAvatarButton() {
        print("didTapAvatar")
    }
    
    func didTapEventButton() {
        delegate?.didTapEventButton()
        print("didTapEvent")
    }
    
    func didTapFilterButton() {
        print("didTapFilter")
    }
}
