//
//  MetricConstants.swift
//  Roshambo
//
//  Created by Christian Elies on 27.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

struct MetricConstants {
    static let safeAreaInsets: UIEdgeInsets = UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
    static let navigationBarHeight: CGFloat = (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.navigationBar.frame.height ?? 0
    static let cornerRadius: CGFloat = 8
}

extension MetricConstants {
    struct GameBoardView {
        static let minWidth: CGFloat = 320 - GameBoardView.insets.left - GameBoardView.insets.right
        static let maxWidth: CGFloat = 414
        static let minHeight: CGFloat = 568 - GameBoardView.insets.top - GameBoardView.insets.bottom - MetricConstants.safeAreaInsets.top - MetricConstants.navigationBarHeight
        static let maxHeight: CGFloat = 667
        static let insets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        struct Spacing {
            static let mainStackView: CGFloat = 8
        }
    }
}

extension MetricConstants {
    struct GameResultView {
        static let height: CGFloat = ResultLabel.winnerFontSize
        
        struct ResultLabel {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            
            static let winnerFontSize: CGFloat = 56
            static let winnerFont: UIFont = .systemFont(ofSize: ResultLabel.winnerFontSize)
            static let defaultFont: UIFont = .systemFont(ofSize: 17, weight: .semibold)
        }
    }
}

extension MetricConstants {
    struct PlayerView {
        static let minHeight: CGFloat = PlayerView.PlayerNameLabel.insets.top + PlayerNameLabel.fontSize + VerticalStackView.insets.top + InformationLabel.winnerFontSize
        
        struct ActionButton {
            static let fontSize: CGFloat = 28
            static let font: UIFont = UIFont.systemFont(ofSize: ActionButton.fontSize)
        }
        
        struct InformationLabel {
            static let font: UIFont = UIFont.systemFont(ofSize: 17, weight: .regular)
            static let defaultFontSize: CGFloat = 17
            static let resultFontSize: CGFloat = 28
            static let winnerFontSize: CGFloat = 56
        }
        
        struct PlayerNameLabel {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0)
            static let fontSize: CGFloat = 13
            static let font: UIFont = UIFont.systemFont(ofSize: PlayerNameLabel.fontSize, weight: .regular)
        }
        
        struct Spacing {
            static let actionButtonStackView: CGFloat = 8
        }
        
        struct VerticalStackView {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        }
    }
}
