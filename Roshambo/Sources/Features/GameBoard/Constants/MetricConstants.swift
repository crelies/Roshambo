//
//  MetricConstants.swift
//  Roshambo
//
//  Created by Christian Elies on 27.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

struct MetricConstants {
    static let minimumScreenWidth: CGFloat = 320
    static let minimumScreenHeight: CGFloat = 568
    static let minimumLandscapeNavigationBarHeight: CGFloat = 32
    
    static let backgroundColor: UIColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
    static let tintColor: UIColor = UIColor(red: 12/255, green: 23/255, blue: 40/255, alpha: 1)
    static let cornerRadius: CGFloat = 8
    static let defaultFontSize: CGFloat = 17
    static let winnerSizePortraitMultiplier: CGFloat = (56 / (minimumScreenWidth - GameBoardViewContainer.insets.left - GameBoardViewContainer.insets.right))
    static let winnerSizeLandscapeMultiplier: CGFloat = (36 / PlayerView.minimumLandscapeHeight)
    static let initialWinnerPortraitWidth: CGFloat = winnerSizePortraitMultiplier * GameBoardViewContainer.minimumPortraitWidth
}

extension MetricConstants {
    struct GameBoardViewContainer {
        static let minimumPortraitWidth: CGFloat = minimumScreenWidth - GameBoardViewContainer.insets.left - GameBoardViewContainer.insets.right
        static let minimumLandscapeHeight: CGFloat = minimumScreenWidth - minimumLandscapeNavigationBarHeight - GameBoardViewContainer.insets.top - GameBoardViewContainer.insets.bottom
        static let insets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        static let minimumInsets: UIEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
}

extension MetricConstants {
    struct GameBoardView {
        static let width: CGFloat = 280
        static let maxWidth: CGFloat = 414
        static let height: CGFloat = 480
        static let maxHeight: CGFloat = 667
        static let minimumInsets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        static let maximumInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        struct Spacing {
            static let mainStackView: CGFloat = 4
        }
    }
}

extension MetricConstants {
    struct GameResultView {
        static let portraitHeightMultiplier: CGFloat = (50 / minimumScreenWidth)
        static let landscapeHeightMultiplier: CGFloat = (50 / minimumScreenHeight)
        static let minimumLandscapeHeight: CGFloat = (GameResultView.landscapeHeightMultiplier * GameBoardViewContainer.minimumLandscapeHeight) - ((GameResultView.landscapeHeightMultiplier * GameBoardViewContainer.minimumLandscapeHeight).truncatingRemainder(dividingBy: 2))
        
        struct ResultLabel {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
            static let defaultFont: UIFont = .systemFont(ofSize: defaultFontSize, weight: .semibold)
        }
    }
}

extension MetricConstants {
    struct PlayerView {
        static let minimumLandscapeHeight: CGFloat = (GameBoardViewContainer.minimumLandscapeHeight - GameBoardView.Spacing.mainStackView - GameResultView.minimumLandscapeHeight - GameBoardView.Spacing.mainStackView) / 2
        
        struct ActionButton {
            static let imageEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            static let borderColor: CGColor = MetricConstants.tintColor.cgColor
            static let borderWidth: CGFloat = 2
        }
        
        struct PlayerNameLabel {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 6, left: 8, bottom: 0, right: 0)
            static let font: UIFont = UIFont.systemFont(ofSize: defaultFontSize, weight: .semibold)
        }
        
        struct Spacing {
            static let actionButtonStackView: CGFloat = 16
        }
        
        struct VerticalStackView {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    }
}
