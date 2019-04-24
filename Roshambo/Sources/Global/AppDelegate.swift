//
//  AppDelegate.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let rootViewController = GameBoardWireframe.makeViewController(delegate: nil)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
        
        return true
    }
}
