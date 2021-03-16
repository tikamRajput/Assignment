//
//  AppDelegate.swift
//  Assignment
//
//  Created by AK on 15/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let nextController = MainCategoryController()
        let rootController = UINavigationController(rootViewController: nextController)
        rootController.navigationBar.isHidden = true
        window?.rootViewController = rootController
        return true
    }
    

}

