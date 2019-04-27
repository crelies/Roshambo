//
//  PlayerView.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

protocol PlayerViewProtocol {
    var delegate: PlayerViewDelegateProtocol? { get set }
    func setPlayerName(_ playerName: String)
    func updateUI(withViewModel viewModel: PlayerViewViewModel)
}

final class PlayerView: UIView {
    private lazy var playerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = MetricConstants.PlayerView.PlayerNameLabel.font
        return label
    }()
    
    /*
        Vertical stack view containing information label and
        horizontal action button stack view
    */
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = MetricConstants.PlayerView.InformationLabel.font
        return label
    }()
    
    private lazy var actionButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = MetricConstants.PlayerView.Spacing.actionButtonStackView
        return stackView
    }()
    
    private lazy var scissorsButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✌️", for: .normal)
        button.titleLabel?.font = MetricConstants.PlayerView.ActionButton.font
        button.addTarget(self, action: #selector(didPressScissorsButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var rockButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✊", for: .normal)
        button.titleLabel?.font = MetricConstants.PlayerView.ActionButton.font
        button.addTarget(self, action: #selector(didPressRockButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var paperButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("🤚", for: .normal)
        button.titleLabel?.font = MetricConstants.PlayerView.ActionButton.font
        button.addTarget(self, action: #selector(didPressPaperButton(_:)), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: PlayerViewDelegateProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(frame:) instead")
    }
}

extension PlayerView: PlayerViewProtocol {
    func setPlayerName(_ playerName: String) {
        playerNameLabel.text = playerName
    }
    
    func updateUI(withViewModel viewModel: PlayerViewViewModel) {
        informationLabel.isHidden = viewModel.isInformationLabelHidden
        informationLabel.text = viewModel.informationLabelText
        let updatedFont = informationLabel.font.withSize(viewModel.informationLabelFontSize)
        informationLabel.font = updatedFont
        
        if viewModel.areActionButtonsHidden {
            actionButtonStackView.removeArrangedSubview(scissorsButton)
            scissorsButton.removeFromSuperview()
            
            actionButtonStackView.removeArrangedSubview(rockButton)
            rockButton.removeFromSuperview()
            
            actionButtonStackView.removeArrangedSubview(paperButton)
            paperButton.removeFromSuperview()
            
            verticalStackView.removeArrangedSubview(actionButtonStackView)
            actionButtonStackView.removeFromSuperview()
        } else {
            actionButtonStackView.addArrangedSubview(scissorsButton)
            actionButtonStackView.addArrangedSubview(rockButton)
            actionButtonStackView.addArrangedSubview(paperButton)
            
            verticalStackView.addArrangedSubview(actionButtonStackView)
        }
    }
}

extension PlayerView {
    @objc private func didPressScissorsButton(_ sender: UIButton) {
        delegate?.didPressScissorsButton(self)
    }
    
    @objc private func didPressRockButton(_ sender: UIButton) {
        delegate?.didPressRockButton(self)
    }
    
    @objc private func didPressPaperButton(_ sender: UIButton) {
        delegate?.didPressPaperButton(self)
    }
}

extension PlayerView {
    private func setupView() {
        backgroundColor = .white
        roundCorners(cornerMask: .AllCorners, cornerRadius: MetricConstants.cornerRadius)
        
        addInitialSubviews()
        setupConstraints()
    }
    
    private func addInitialSubviews() {
        addSubview(playerNameLabel)
        
        verticalStackView.addArrangedSubview(informationLabel)
        
        addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        heightAnchor.constraint(greaterThanOrEqualToConstant: MetricConstants.PlayerView.minHeight).isActive = true
        
        setupPlayerNameLabelConstraints()
        setupVerticalStackViewConstraints()
    }
    
    private func setupPlayerNameLabelConstraints() {
        playerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: MetricConstants.PlayerView.PlayerNameLabel.insets.top).isActive = true
        playerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: MetricConstants.PlayerView.PlayerNameLabel.insets.left).isActive = true
    }
    
    private func setupVerticalStackViewConstraints() {
        verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: MetricConstants.PlayerView.VerticalStackView.insets.left).isActive = true
        verticalStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -MetricConstants.PlayerView.VerticalStackView.insets.right).isActive = true
        verticalStackView.topAnchor.constraint(greaterThanOrEqualTo: playerNameLabel.bottomAnchor, constant: MetricConstants.PlayerView.VerticalStackView.insets.top).isActive = true
        verticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -MetricConstants.PlayerView.VerticalStackView.insets.bottom).isActive = true
    }
}
