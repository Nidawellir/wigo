//
//  MainScreanView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol MainScreanViewDelegate: AnyObject {}

final class MainScreanView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: MainScreanViewDelegate?
    
    // MARK: - UI properties
    
    private let customNavigationBarView: CustomNavigationBarView = .init()
    private let filterView: FilterView = .init()
    private let userFeedView: UserFeedView = .init()
    

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
        
        userFeedView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(customNavigationBarView)
        addSubview(filterView)
        addSubview(userFeedView)
        
        NSLayoutConstraint.activate([
            customNavigationBarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            customNavigationBarView.leftAnchor.constraint(equalTo: leftAnchor),
            customNavigationBarView.rightAnchor.constraint(equalTo: rightAnchor),
            
            filterView.topAnchor.constraint(equalTo: customNavigationBarView.bottomAnchor),
            filterView.leftAnchor.constraint(equalTo: leftAnchor),
            filterView.rightAnchor.constraint(equalTo: rightAnchor),
            
            userFeedView.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: 16),
            userFeedView.leftAnchor.constraint(equalTo: leftAnchor),
            userFeedView.rightAnchor.constraint(equalTo: rightAnchor),
            userFeedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
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
        print("11111\(viewModels)")
    }
    
    func setMatchingFilters(viewModel: [MatchingFiltersCollectionViewCell.ViewModel]) {
        userFeedView.setMatchingFiltersModel(viewModel: viewModel)
        print("11112\(viewModel)")
    }
}

// MARK: - CustomNavigationBarDelegate

extension MainScreanView: CustomNavigationBarDelegate {
    func didTapAvatarButton() {
        print("didTapAvatar")
    }
    
    func didTapEventButton() {
        print("didTapEvent")
    }
    
    func didTapFilterButton() {
        print("didTapFilter")
    }
}
