//
//  GameBoardView.swift
//  Roshambo
//
//  Created Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//
//  Template generated by Christian Elies @crelies
//  https://www.christianelies.de
//

import UIKit

protocol GameBoardViewViewProtocol {
    var delegate: PlayerViewDelegateProtocol? { get set }
    func setPlayerName(_ playerName: String)
    func setComputerPlayerName(_ playerName: String)
    func updateUI(withViewModel viewModel: GameBoardViewViewModel)
}

final class GameBoardView: UIView {
    /*
        Vertical stack view containing all sub views
    */
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = MetricConstants.GameBoardView.Spacing.mainStackView
        return stackView
    }()
    
    private lazy var playerView: PlayerView = {
        let playerView = PlayerView()
        playerView.translatesAutoresizingMaskIntoConstraints = false
        return playerView
    }()
    
    private lazy var gameResultView: GameResultView = {
        let gameResultView = GameResultView()
        gameResultView.translatesAutoresizingMaskIntoConstraints = false
        return gameResultView
    }()
    
    private var gameResultViewHeightConstraint: NSLayoutConstraint?
    
    private lazy var computerView: PlayerView = {
        let computerView = PlayerView()
        computerView.translatesAutoresizingMaskIntoConstraints = false
        return computerView
    }()
    
    weak var delegate: PlayerViewDelegateProtocol? {
        didSet {
            playerView.delegate = delegate
        }
    }
    
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
        
        var relativeHeight: CGFloat?
        if isPortrait {
            relativeHeight = MetricConstants.GameResultView.portraitHeightMultiplier * bounds.width
        } else if isLandscape {
            relativeHeight = MetricConstants.GameResultView.landscapeHeightMultiplier * bounds.height
        }
        
        if let relativeHeight = relativeHeight {
            let remainder = relativeHeight.truncatingRemainder(dividingBy: 2)
            let newHeight = relativeHeight - remainder
            
            gameResultViewHeightConstraint?.constant = newHeight
            
            mainStackView.setNeedsLayout()
            mainStackView.layoutIfNeeded()
        }
    }
}

extension GameBoardView: GameBoardViewViewProtocol {
    func setPlayerName(_ playerName: String) {
        playerView.setPlayerName(playerName)
    }
    
    func setComputerPlayerName(_ playerName: String) {
        computerView.setPlayerName(playerName)
    }
    
    func updateUI(withViewModel viewModel: GameBoardViewViewModel) {
        playerView.updateUI(withViewModel: viewModel.playerViewViewModel)
        gameResultView.updateUI(withViewModel: viewModel.gameResultViewViewModel)
        computerView.updateUI(withViewModel: viewModel.computerViewViewModel)
    }
}

extension GameBoardView {
  	private func setupView() {
        addSubviews()
        setupConstraints()
        
        backgroundColor = .clear
  	}

    private func addSubviews() {
        mainStackView.addArrangedSubview(playerView)
        mainStackView.addArrangedSubview(gameResultView)
        mainStackView.addArrangedSubview(computerView)
        addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        setupMainStackViewConstraints()
        
        playerView.heightAnchor.constraint(equalTo: computerView.heightAnchor, multiplier: 1).isActive = true
        
        let gameResultViewHeightConstraint = gameResultView.heightAnchor.constraint(equalToConstant: 0) // MetricConstants.GameResultView.initialPortraitHeight
        self.gameResultViewHeightConstraint = gameResultViewHeightConstraint
        gameResultViewHeightConstraint.isActive = true
    }
    
    private func setupMainStackViewConstraints() {
        mainStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
}
