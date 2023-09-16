//
//  UserFeedView.swift
//  Wigo
//
//  Created by Apple User on 9/13/23.
//

import UIKit

final class UserFeedView: UIView {
    
    // MARK: - Private properties
    
//    private var filterModels: [FilterCollectionViewCell.ViewModel] = []
    private var matchingFiltersModel: [MatchingFiltersCollectionViewCell.ViewModel] = []
    
    // MARK: - Identifier
    
    private let userFeedCollectionViewCellIdentifier = "UserFeedCollectionViewCellIdentifier"
    
    // MARK: - UI properties
    
    private var collectionView: UICollectionView
    private var collectionViewFlowLayout: UICollectionViewFlowLayout
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: collectionViewFlowLayout
        )
        
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
        
        collectionView.reloadData()
    }
    
    private func configureViews() {
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 5
        collectionViewFlowLayout.minimumInteritemSpacing = 5
        
        collectionView.isPagingEnabled = true
        collectionView.clipsToBounds = false
        collectionView.layer.masksToBounds = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.register(
            UserFeedCollectionViewCell.self,
            forCellWithReuseIdentifier: userFeedCollectionViewCellIdentifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Publick methods

extension UserFeedView {
    func setMatchingFiltersModel(viewModel: [MatchingFiltersCollectionViewCell.ViewModel]) {
        matchingFiltersModel = viewModel
    }
}

// MARK: - UICollectionViewDataSource

extension UserFeedView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: userFeedCollectionViewCellIdentifier,
            for: indexPath
        ) as? UserFeedCollectionViewCell

//        cell?.set(
//            viewModel: .init(
//                title: filterModels[indexPath.row].title
//            )
//        )
        
        cell?.setMatchingFilters(matchingFilers: matchingFiltersModel)
        
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension UserFeedView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
