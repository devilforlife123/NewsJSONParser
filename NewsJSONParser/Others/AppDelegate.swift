//
//  AppDelegate.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 27/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: NewsViewController())
        setAppearances()
        window?.makeKeyAndVisible()
        return true
    }
    
    func setAppearances(){
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 244.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0),
            NSAttributedString.Key.shadow: shadow,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 21.0)!
        ]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.75, green:0.0/255.0, blue: 0.0/255.0, alpha: 1.0);
        UINavigationBar.appearance().tintColor = UIColor.init(red: 0.75, green: 0.0, blue: 0.0, alpha: 1.0)
        
    }
}

