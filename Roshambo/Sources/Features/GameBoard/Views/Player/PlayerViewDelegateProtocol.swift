//
//  PlayerViewDelegateProtocol.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import Foundation

protocol PlayerViewDelegateProtocol: class {
    func didPressScissorsButton(_ view: PlayerViewProtocol)
    func didPressRockButton(_ view: PlayerViewProtocol)
    func didPressPaperButton(_ view: PlayerViewProtocol)
}
