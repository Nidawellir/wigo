//
//  FiltersView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol FiltersViewDelegate: AnyObject {
    func didTapView()
}

final class FiltersView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: FiltersViewDelegate?
    
    // MARK: - Private properties
    
    private var sexCurrentFilters: [CurrentFilter] = []
    
    // MARK: - UI properties
    
    private let shadowView: UIView = .init()
    private let filtersContainerView: UIView = .init()
    private let stackView: UIStackView = .init()
    private let sexStackView: UIStackView = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        shadowView.backgroundColor = Colors.CreateAccount.darkBackground.color
        shadowView.alpha = 0.7
        shadowView.clipsToBounds = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTapScene))
        shadowView.addGestureRecognizer(tap)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        filtersContainerView.backgroundColor = Colors.MainScrean.cellBackground.color
        filtersContainerView.layer.cornerRadius = 12
        filtersContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        sexStackView.axis = .vertical
        sexStackView.spacing = 12
    }
    
    @objc
    private func didTapScene() {
        delegate?.didTapView()
    }
    
    private func configureLayouts() {
        addSubview(shadowView)
        
        addSubview(filtersContainerView)
        
        filtersContainerView.addSubview(stackView)
        
        stackView.addArrangedSubview(sexStackView)
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.leftAnchor.constraint(equalTo: leftAnchor),
            shadowView.rightAnchor.constraint(equalTo: rightAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            filtersContainerView.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 50),
            filtersContainerView.leftAnchor.constraint(equalTo: shadowView.leftAnchor, constant: 16),
            filtersContainerView.rightAnchor.constraint(equalTo: shadowView.rightAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: filtersContainerView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: filtersContainerView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: filtersContainerView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: filtersContainerView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension FiltersView {
    func set(allSexes: [Sex]) {
        sexCurrentFilters.removeAll()
        sexStackView.removeArrangedSubviews()
        
        for sex in allSexes {
            let currentFilter = CurrentFilter(text: sex.title)
            
            sexCurrentFilters.append(currentFilter)
            sexStackView.addArrangedSubview(currentFilter)
            
            currentFilter.addTarget(self, action: #selector(didTapCurrentFilter), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapCurrentFilter(_ sender: CurrentFilter) {
        sexCurrentFilters.forEach { $0.isOn = false }
        
        sender.isOn = true
    }
}
