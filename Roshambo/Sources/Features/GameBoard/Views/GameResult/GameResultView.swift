//
//  GameResultView.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

protocol GameResultViewProtocol {
    func updateUI(withViewModel viewModel: GameResultViewViewModel)
}

final class GameResultView: UIView {
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(resultLabel)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(frame:) instead")
    }
}

extension GameResultView: GameResultViewProtocol {
    func updateUI(withViewModel viewModel: GameResultViewViewModel) {
        resultLabel.text = viewModel.result
    }
}

extension GameResultView {
    private func setupConstraints() {
        heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
        resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        resultLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16).isActive = true
        resultLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16).isActive = true
    }
}
