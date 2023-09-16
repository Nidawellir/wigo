//
//  MatchingFiltersView.swift
//  Wigo
//
//  Created by Apple User on 9/15/23.
//

import UIKit

final class MatchingFiltersView: UIView {
    
    // MARK: - Private properties
    
    private var matchingFiltersModels: [MatchingFiltersCollectionViewCell.ViewModel] = []
    
    // MARK: - Identifier
    
    private let matchingFiltersCollectionViewCellIdentifier = "MatchingFiltersCollectionViewCellIdentifier"
    
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
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.register(
            MatchingFiltersCollectionViewCell.self,
            forCellWithReuseIdentifier: matchingFiltersCollectionViewCellIdentifier
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
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension MatchingFiltersView {
    func set(viewModels: [MatchingFiltersCollectionViewCell.ViewModel]) {
        matchingFiltersModels = viewModels
    }
}

// MARK: - UICollectionViewDataSource

extension MatchingFiltersView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matchingFiltersModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: matchingFiltersCollectionViewCellIdentifier,
            for: indexPath
        ) as? MatchingFiltersCollectionViewCell

        cell?.set(
            viewModel: .init(
                title: matchingFiltersModels[indexPath.row].title
            )
        )
        
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MatchingFiltersView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: matchingFiltersModels[indexPath.item].title.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11)]).width + 20, height: 30)
    }
}
