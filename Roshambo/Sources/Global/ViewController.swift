//
//  ViewController.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ViewController {
    private func setupView() {
        setColors()
    }
    
    private func setColors() {
        view.backgroundColor = .white
    }
}
