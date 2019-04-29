//
//  String+localized.swift
//  Roshambo
//
//  Created by Elies, Christian on 29.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
