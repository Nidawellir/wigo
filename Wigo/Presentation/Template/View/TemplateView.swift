//
//  TemplateView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class TemplateView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {}
    
    private func configureLayouts() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension TemplateView {}
