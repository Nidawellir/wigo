//
//  VideoCardsContainerView.swift
//  Wigo
//
//  Created by Apple User on 9/22/23.
//

import UIKit

final class VideoCardsContainerView: UIView {
    
    // MARK: - ViewModel
    
    // MARK: - Private properties
    
    private var videoCardModels: [VideoCardView.ViewModel] = []
    private var matchingFiltersModel: [MatchingFiltersCollectionViewCell.ViewModel] = []
    private var currentViewModelIndex: Int?
    private var isLayoutSubviewsCalled: Bool = false
    
    // MARK: - UI properties
    
    private var currentVideoCardView: VideoCardView?
    private let findEventView: FindEventsView = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayout()
    }
    
    private func configureViews() {
        findEventView.isHidden = true
        findEventView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        addSubview(findEventView)
        
        NSLayoutConstraint.activate([
            findEventView.topAnchor.constraint(equalTo: topAnchor),
            findEventView.leftAnchor.constraint(equalTo: leftAnchor),
            findEventView.rightAnchor.constraint(equalTo: rightAnchor),
            findEventView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !isLayoutSubviewsCalled, frame.width != 0, frame.height != 0 else { return }
        layoutCurrentVideoCardView()
        isLayoutSubviewsCalled = true
    }
}

// MARK: - Public methods

extension VideoCardsContainerView {
    func setVideoCardModel(viewModels: [VideoCardView.ViewModel]) {
        guard !viewModels.isEmpty else { return }
        
        self.videoCardModels = viewModels
        
        if currentVideoCardView == nil {
            showNextVideoCardView()
        } else {
            
        }
    }
    
    private func showNextVideoCardView() {
        let index: Int
        if let currentViewModelIndex = self.currentViewModelIndex {
            index = currentViewModelIndex + 1
        } else {
            index = 0
        }
        
        print("2222222222 \(videoCardModels)")
        
        currentVideoCardView?.removeFromSuperview()
        currentVideoCardView = nil
        
        let videoCardView = VideoCardView()
        videoCardView.set(videoCardModel: videoCardModels[index])
        
        videoCardView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(didPanVideoCardView)))
        addSubview(videoCardView)
        
        self.currentViewModelIndex = index
        self.currentVideoCardView = videoCardView
        
        layoutCurrentVideoCardView()
    }
    
    @objc
    private func didPanVideoCardView(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let translation = panGestureRecognizer.translation(in: self)
        let pointForAction = frame.width / 2
    
        switch panGestureRecognizer.state {
        case .began:
            break
        case .changed:
            currentVideoCardView?.transform = CGAffineTransform(translationX: translation.x, y: .zero)
            if translation.x > pointForAction {
                currentVideoCardView?.rightSwipe()
            } else if translation.x < -pointForAction {
                currentVideoCardView?.leftSwipe()
            }
        case .ended:
            if translation.x > pointForAction {
                UIView.animate(withDuration: CATransaction.animationDuration(), animations: {() -> Void in
                    self.currentVideoCardView?.transform = CGAffineTransform(translationX: self.frame.width - 16, y: .zero)
                }, completion: {(_ complete: Bool) -> Void in
                    self.showNextVideoCardView()
                })
            } else if translation.x < -pointForAction {
                guard let translationX = currentVideoCardView?.frame.width else { return }
                UIView.animate(withDuration: CATransaction.animationDuration(), animations: {() -> Void in
                    self.currentVideoCardView?.transform = CGAffineTransform(translationX: -(translationX + 16), y: .zero)
                }, completion: {(_ complete: Bool) -> Void in
                    self.showNextVideoCardView()
                })
            } else {
                UIView.animate(withDuration: CATransaction.animationDuration(), animations: {() -> Void in
                    self.currentVideoCardView?.transform = .identity
                })
            }
        default:
            break
        }
    }
    
    private func layoutCurrentVideoCardView() {
        let totalWidth = frame.width
        let totalHeight = frame.height
        let horizontalSpace: CGFloat = 16.0

        currentVideoCardView?.frame = .init(x: horizontalSpace, y: .zero, width: totalWidth - 2 * horizontalSpace, height: totalHeight)
    }
}

