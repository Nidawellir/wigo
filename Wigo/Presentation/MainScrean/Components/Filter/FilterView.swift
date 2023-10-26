//
//  FilterView.swift
//  Wigo
//
//  Created by Apple User on 9/13/23.
//

import UIKit

final class FilterView: UIView {
    
    // MARK: - Private properties
    
    private var filterModels: [FilterCollectionViewCell.ViewModel] = []
    
    // MARK: - Identifier
    
    private let filterViewCollectionViewCellIdentifier = "FilterViewCollectionViewCellIdentifier"
    
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
        collectionView.allowsMultipleSelection = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.register(
            FilterCollectionViewCell.self,
            forCellWithReuseIdentifier: filterViewCollectionViewCellIdentifier
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
            collectionView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension FilterView {
    func set(viewModels: [FilterCollectionViewCell.ViewModel]) {
        filterModels = viewModels
    }
}

// MARK: - UICollectionViewDataSource

extension FilterView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: filterViewCollectionViewCellIdentifier,
            for: indexPath
        ) as? FilterCollectionViewCell

        cell?.set(
            viewModel: .init(
                title: filterModels[indexPath.row].title
            )
        )
        
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FilterView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: filterModels[indexPath.item].title.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: 30)
    }
}
