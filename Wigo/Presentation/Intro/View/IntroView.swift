//
//  IntroView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol IntroViewDelegate: AnyObject {
    func didTapContinueButton()
}

final class IntroView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: IntroViewDelegate?
    
    // MARK: - Private properties
    
    private var introModels: [IntroCollectionViewCell.ViewModel] = []
    
    // MARK: - Identifier
    
    private let introViewCollectionViewCellIdentifier = "IntroViewCollectionViewCellIdentifier"
    
    // MARK: - UI properties
    
    private let logoImage: UIImageView = .init()
    private let skipButton: UIButton = .init()
    private var collectionView: UICollectionView
    private var collectionViewFlowLayout: UICollectionViewFlowLayout
    private let pageControl: UIPageControl = .init()
    private var continueButton: ContinueButton = .init(title: "далее")
    
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
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        logoImage.image = Images.Intro.logo.image
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        skipButton.backgroundColor = .clear
        skipButton.setTitle("Пропустить", for: .normal)
        skipButton.titleLabel?.textAlignment = .center
        skipButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        skipButton.setTitleColor(Colors.CreateAccount.lightGrayTetxColor.color, for: .normal)
        skipButton.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        
        collectionView.isPagingEnabled = true
        collectionView.clipsToBounds = false
        collectionView.layer.masksToBounds = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.register(
            IntroCollectionViewCell.self,
            forCellWithReuseIdentifier: introViewCollectionViewCellIdentifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        pageControl.numberOfPages = 4
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        continueButton.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapContinueButton() {
        let nextPage = pageControl.currentPage + 1
        
        if nextPage != pageControl.numberOfPages {
            skipButton.isEnabled = false
            collectionView.scrollToItem(at: .init(row: nextPage, section: 0), at: .right, animated: true)
        }
        
        if pageControl.currentPage == 3 {
            delegate?.didTapContinueButton()
        }
    }
    
    @objc
    private func didTapSkipButton() {
        delegate?.didTapContinueButton()
    }
    
    private func configureLayouts() {
        addSubview(logoImage)
        addSubview(skipButton)
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 12),
            
            skipButton.leftAnchor.constraint(equalTo: logoImage.rightAnchor, constant: 44),
            skipButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -33),
            skipButton.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            skipButton.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 48),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            continueButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 24),
            continueButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            continueButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            continueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            continueButton.heightAnchor.constraint(equalToConstant: 58),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    
}

// MARK: - Public methods

extension IntroView {
    func set(viewModels: [IntroCollectionViewCell.ViewModel]) {
        introModels = viewModels
    }
}

// MARK: - UICollectionViewDataSource

extension IntroView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return introModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: introViewCollectionViewCellIdentifier,
            for: indexPath
        ) as? IntroCollectionViewCell

        cell?.set(
            viewModel: .init(
                title: introModels[indexPath.row].title,
                description: introModels[indexPath.row].description,
                image: introModels[indexPath.row].image
            )
        )
        
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension IntroView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        
        guard width != 0 else { return }
        
        pageControl.currentPage = Int(contentOffsetX + horizontalCenter) / Int(width)
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        skipButton.isEnabled = true
    }
}
