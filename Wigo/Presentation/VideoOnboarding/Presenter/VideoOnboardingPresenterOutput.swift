//
//  VideoOnboardingPresenterOutput.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol VideoOnboardingPresenterOutput: AnyObject {
    func change(image: String)
    func closeVideoOnboarding()
}
