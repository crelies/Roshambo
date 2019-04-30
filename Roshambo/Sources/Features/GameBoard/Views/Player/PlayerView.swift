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
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var imageViewWidthConstraint: NSLayoutConstraint?
    private var imageViewHeightConstraint: NSLayoutConstraint?
    
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
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = AccessibilityConstants.Identifier.GameBoard.PlayerView.ActionButton.scissors
        let image = UIImage(named: "icon_scissors")
        button.setImage(image, for: .normal)
        button.imageEdgeInsets = MetricConstants.PlayerView.ActionButton.imageEdgeInsets
        button.layer.borderColor = MetricConstants.PlayerView.ActionButton.borderColor
        button.layer.borderWidth = MetricConstants.PlayerView.ActionButton.borderWidth
        button.addTarget(self, action: #selector(didPressScissorsButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private var scissorsButtonWidthConstraint: NSLayoutConstraint?
    private var scissorsButtonHeightConstraint: NSLayoutConstraint?
    
    private lazy var rockButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = AccessibilityConstants.Identifier.GameBoard.PlayerView.ActionButton.rock
        let image = UIImage(named: "icon_rock")
        button.setImage(image, for: .normal)
        button.imageEdgeInsets = MetricConstants.PlayerView.ActionButton.imageEdgeInsets
        button.layer.borderColor = MetricConstants.PlayerView.ActionButton.borderColor
        button.layer.borderWidth = MetricConstants.PlayerView.ActionButton.borderWidth
        button.addTarget(self, action: #selector(didPressRockButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var paperButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = AccessibilityConstants.Identifier.GameBoard.PlayerView.ActionButton.paper
        let image = UIImage(named: "icon_paper")
        button.setImage(image, for: .normal)
        button.imageEdgeInsets = MetricConstants.PlayerView.ActionButton.imageEdgeInsets
        button.layer.borderColor = MetricConstants.PlayerView.ActionButton.borderColor
        button.layer.borderWidth = MetricConstants.PlayerView.ActionButton.borderWidth
        button.addTarget(self, action: #selector(didPressPaperButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private var currentSizeMultiplier: Float?
    
    weak var delegate: PlayerViewDelegateProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(frame:) instead")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let isPortrait = UIScreen.main.isPortrait
        let isLandscape = UIScreen.main.isLandscape
        
        var relativeWidth: CGFloat?
        if isPortrait {
            relativeWidth = MetricConstants.winnerSizePortraitMultiplier * bounds.width
        } else if isLandscape {
            relativeWidth = MetricConstants.winnerSizeLandscapeMultiplier * bounds.height
        }
        
        if let relativeWidth = relativeWidth {
            let remainder = relativeWidth.truncatingRemainder(dividingBy: 2)
            let newWidth = (relativeWidth - remainder) * CGFloat(currentSizeMultiplier ?? 1)
            
            scissorsButtonWidthConstraint?.constant = newWidth
            scissorsButtonHeightConstraint?.constant = newWidth
            
            imageViewWidthConstraint?.constant = newWidth
            imageViewHeightConstraint?.constant = newWidth
            
            verticalStackView.setNeedsLayout()
            verticalStackView.layoutIfNeeded()
            
            styleActionButtons()
        }
    }
}

extension PlayerView: PlayerViewProtocol {
    func setPlayerName(_ playerName: String) {
        playerNameLabel.text = playerName
    }
    
    func updateUI(withViewModel viewModel: PlayerViewViewModel) {
        self.currentSizeMultiplier = viewModel.sizeMultiplier
        
        imageView.isHidden = viewModel.isImageViewHidden
        imageView.image = viewModel.image
        
        if !viewModel.isImageViewHidden || !viewModel.areActionButtonsHidden {
            addSubview(verticalStackView)
            setupVerticalStackViewConstraints()
        } else {
            verticalStackView.removeFromSuperview()
        }
        
        if imageView.isHidden {
            verticalStackView.removeArrangedSubview(imageView)
            imageView.removeFromSuperview()
        } else {
            verticalStackView.addArrangedSubview(imageView)
        }
        
        if viewModel.areActionButtonsHidden {
            removeActionButtons()
        } else {
            actionButtonStackView.addArrangedSubview(scissorsButton)
            actionButtonStackView.addArrangedSubview(rockButton)
            actionButtonStackView.addArrangedSubview(paperButton)
            
            setupActionButtonConstraints()
            
            verticalStackView.addArrangedSubview(actionButtonStackView)
            
            verticalStackView.setNeedsLayout()
            verticalStackView.layoutIfNeeded()
            
            styleActionButtons()
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
    }
    
    private func setupConstraints() {
        setupPlayerNameLabelConstraints()
        setupImageViewConstraints()
    }
    
    private func setupPlayerNameLabelConstraints() {
        playerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: MetricConstants.PlayerView.PlayerNameLabel.insets.top).isActive = true
        playerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: MetricConstants.PlayerView.PlayerNameLabel.insets.left).isActive = true
    }
    
    private func setupVerticalStackViewConstraints() {
        verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(greaterThanOrEqualTo: playerNameLabel.trailingAnchor, constant: MetricConstants.PlayerView.VerticalStackView.insets.left).isActive = true
        verticalStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -MetricConstants.PlayerView.VerticalStackView.insets.right).isActive = true
        verticalStackView.topAnchor.constraint(greaterThanOrEqualTo: playerNameLabel.bottomAnchor, constant: MetricConstants.PlayerView.VerticalStackView.insets.top).isActive = true
        verticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -MetricConstants.PlayerView.VerticalStackView.insets.bottom).isActive = true
    }
    
    private func setupImageViewConstraints() {
        let imageViewWidthConstraint = imageView.widthAnchor.constraint(equalToConstant: 0)
        imageViewWidthConstraint.isActive = true
        self.imageViewWidthConstraint = imageViewWidthConstraint
        
        let imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 0)
        imageViewHeightConstraint.isActive = true
        self.imageViewHeightConstraint = imageViewHeightConstraint
    }
    
    private func removeActionButtons() {
        actionButtonStackView.removeArrangedSubview(scissorsButton)
        scissorsButton.removeFromSuperview()
        
        actionButtonStackView.removeArrangedSubview(rockButton)
        rockButton.removeFromSuperview()
        
        actionButtonStackView.removeArrangedSubview(paperButton)
        paperButton.removeFromSuperview()
        
        verticalStackView.removeArrangedSubview(actionButtonStackView)
        actionButtonStackView.removeFromSuperview()
    }
    
    private func setupActionButtonConstraints() {
        if scissorsButtonWidthConstraint == nil {
            let scissorsButtonWidthConstraint = scissorsButton.widthAnchor.constraint(equalToConstant: 0) // MetricConstants.PlayerView.ActionButton.initialPortraitWidth
            self.scissorsButtonWidthConstraint = scissorsButtonWidthConstraint
            scissorsButtonWidthConstraint.isActive = true
        }
        
        if scissorsButtonHeightConstraint == nil {
            let scissorsButtonHeightConstraint = scissorsButton.heightAnchor.constraint(equalToConstant: 0) // MetricConstants.PlayerView.ActionButton.initialPortraitHeight
            self.scissorsButtonHeightConstraint = scissorsButtonHeightConstraint
            scissorsButtonHeightConstraint.isActive = true
        }
        
        rockButton.widthAnchor.constraint(equalTo: scissorsButton.widthAnchor, multiplier: 1).isActive = true
        rockButton.heightAnchor.constraint(equalTo: scissorsButton.heightAnchor, multiplier: 1).isActive = true
        paperButton.widthAnchor.constraint(equalTo: scissorsButton.widthAnchor, multiplier: 1).isActive = true
        paperButton.heightAnchor.constraint(equalTo: scissorsButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func styleActionButtons() {
        let cornerRadius: CGFloat = scissorsButton.frame.width / 2
        scissorsButton.roundCorners(cornerMask: .AllCorners, cornerRadius: cornerRadius)
        rockButton.roundCorners(cornerMask: .AllCorners, cornerRadius: cornerRadius)
        paperButton.roundCorners(cornerMask: .AllCorners, cornerRadius: cornerRadius)
    }
}
