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
        label.font = MetricConstants.GameResultView.ResultLabel.defaultFont
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
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
    private func setupView() {
        backgroundColor = .clear
        addSubview(resultLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        resultLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: MetricConstants.GameResultView.ResultLabel.insets.left).isActive = true
        resultLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -MetricConstants.GameResultView.ResultLabel.insets.right).isActive = true
    }
}
