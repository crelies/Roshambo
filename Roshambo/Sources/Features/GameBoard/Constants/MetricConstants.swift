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
    static let tintColor: UIColor = UIColor(red: 12/255, green: 23/255, blue: 40/255, alpha: 1)
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
        static let minHeight: CGFloat = PlayerNameLabel.insets.top + PlayerNameLabel.fontSize + VerticalStackView.insets.top + winnerFontSize + VerticalStackView.insets.bottom
        
        struct ActionButton {
            static let width: CGFloat = winnerFontSize
            static let height: CGFloat = width
            static let imageEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            static let borderColor: CGColor = MetricConstants.tintColor.cgColor
            static let borderWidth: CGFloat = 2
        }
        
        struct ImageView {
            static let defaultImageSize: CGSize = CGSize(width: winnerFontSize * 0.7, height: winnerFontSize * 0.7)
            static let winnerImageSize: CGSize = CGSize(width: winnerFontSize, height: winnerFontSize)
        }
        
        struct PlayerNameLabel {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 6, left: 8, bottom: 0, right: 0)
            static let fontSize: CGFloat = 14
            static let font: UIFont = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        }
        
        struct Spacing {
            static let actionButtonStackView: CGFloat = 16
        }
        
        struct VerticalStackView {
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    }
}
