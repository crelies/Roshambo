//
//  MetricConstants.swift
//  Roshambo
//
//  Created by Christian Elies on 27.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

struct MetricConstants {
    static let backgroundColor: UIColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
    static let cornerRadius: CGFloat = 8
    static let defaultFontSize: CGFloat = 17
    static let winnerFontSize: CGFloat = UIScreen.main.bounds.height < GameBoardView.maxHeight ? UIScreen.main.bounds.height * 0.08 : UIScreen.main.bounds.height * 0.05
}

extension MetricConstants {
    struct GameBoardViewContainer {
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
        static let height: CGFloat = winnerFontSize
        
        struct ResultLabel {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
            
            static let winnerFont: UIFont = .systemFont(ofSize: winnerFontSize)
            static let defaultFont: UIFont = .systemFont(ofSize: defaultFontSize, weight: .semibold)
        }
    }
}

extension MetricConstants {
    struct PlayerView {
        static let minHeight: CGFloat = PlayerView.PlayerNameLabel.insets.top + PlayerNameLabel.fontSize + VerticalStackView.insets.top + winnerFontSize + VerticalStackView.insets.bottom
        static let emojiFontSize: CGFloat = UIScreen.main.bounds.height < GameBoardView.maxHeight ? UIScreen.main.bounds.height * 0.05 : UIScreen.main.bounds.height * 0.03
        
        struct ActionButton {
            static let width: CGFloat = MetricConstants.winnerFontSize + 6
            static let height: CGFloat = ActionButton.width
            static let font: UIFont = UIFont.systemFont(ofSize: emojiFontSize)
            static let borderColor: CGColor = UIColor(red: 12/255, green: 23/255, blue: 40/255, alpha: 1).cgColor
            static let borderWidth: CGFloat = 2
        }
        
        struct InformationLabel {
            static let font: UIFont = UIFont.systemFont(ofSize: defaultFontSize, weight: .regular)
            static let resultFontSize: CGFloat = emojiFontSize
        }
        
        struct PlayerNameLabel {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 6, left: 8, bottom: 0, right: 0)
            static let fontSize: CGFloat = 11
            static let font: UIFont = UIFont.systemFont(ofSize: PlayerNameLabel.fontSize, weight: .semibold)
        }
        
        struct Spacing {
            static let actionButtonStackView: CGFloat = 16
        }
        
        struct VerticalStackView {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    }
}
