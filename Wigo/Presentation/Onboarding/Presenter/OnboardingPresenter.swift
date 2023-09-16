//
//  OnboardingPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class OnboardingPresenter {
    
    // MARK: - Public properties
    
    weak var output: OnboardingPresenterOutput?
    
    // MARK: - Private properties
    
    var index = 0
    let onboardingImages: [String] = [
        Images.CreateAccountOnboarding.first.name,
        Images.CreateAccountOnboarding.second.name,
        Images.CreateAccountOnboarding.third.name,
        Images.CreateAccountOnboarding.four.name,
        Images.CreateAccountOnboarding.five.name,
        Images.CreateAccountOnboarding.six.name,
        Images.CreateAccountOnboarding.seven.name,
        Images.CreateAccountOnboarding.eight.name,
        Images.CreateAccountOnboarding.nine.name,
        Images.CreateAccountOnboarding.ten.name,
    ]
}

// MARK: - OnboardingPresenterInput

extension OnboardingPresenter: OnboardingPresenterInput {
    func fetchFirstImage() {
        index = 0
        output?.change(image: onboardingImages[index])
    }
    
    func fetchNextImage() {
        index += 1
        if index < onboardingImages.count {
            output?.change(image: onboardingImages[index])
        } else {
            output?.closeOnboarding()
        }
    }
}
