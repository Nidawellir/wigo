//
//  EventFilters.swift
//  Wigo
//
//  Created by Apple User on 10/23/23.
//

import UIKit

final class EventFilters: UIView {
    
    // MARK: - Private properties
    
    private var eventFiltersModels: [EventFiltersCollectionViewCell.ViewModel] = []
    
    // MARK: - Identifier
    
    private let eventFiltersViewCollectionViewCellIdentifier = "EventFiltersViewCollectionViewCellIdentifier"
    
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
//        collectionView.layer.masksToBounds = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.register(
            EventFiltersCollectionViewCell.self,
            forCellWithReuseIdentifier: eventFiltersViewCollectionViewCellIdentifier
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

extension EventFilters {
    func set(viewModels: [EventFiltersCollectionViewCell.ViewModel]) {
        eventFiltersModels = viewModels
    }
}

// MARK: - UICollectionViewDataSource

extension EventFilters: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventFiltersModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: eventFiltersViewCollectionViewCellIdentifier,
            for: indexPath
        ) as? EventFiltersCollectionViewCell

        cell?.set(
            viewModel: .init(
                title: eventFiltersModels[indexPath.row].title
            )
        )
        
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension EventFilters: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: eventFiltersModels[indexPath.item].title.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Этот метод вызывается при нажатии на ячейку коллекции
        let selectedItem = eventFiltersModels[indexPath.item]
        print("Выбран элемент:")
    
        
        
        // Ваша логика обработки нажатия на ячейку
    }
}
