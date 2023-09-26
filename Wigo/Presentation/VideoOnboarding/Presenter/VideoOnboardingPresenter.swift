//
//  VideoOnboardingPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class VideoOnboardingPresenter {
    
    // MARK: - Public properties
    
    weak var output: VideoOnboardingPresenterOutput?
    
    // MARK: - Private properties
    
    var index = 0
    let onboardingImages: [String] = [
        Images.VideoOnboarding.first.name,
        Images.VideoOnboarding.second.name,
        Images.VideoOnboarding.third.name,
        Images.VideoOnboarding.four.name,
    ]
}

// MARK: - VideoOnboardingPresenterInput

extension VideoOnboardingPresenter: VideoOnboardingPresenterInput {
    func fetchFirstImage() {
        index = 0
        output?.change(image: onboardingImages[index])
    }
    
    func fetchNextImage() {
        index += 1
        if index < onboardingImages.count {
            output?.change(image: onboardingImages[index])
        } else {
            output?.closeVideoOnboarding()
        }
    }
}
