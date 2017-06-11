//
//  AppDelegate.swift
//  ViewLifecycleSample
//
//  Created by Shota Nakagami on 2017/06/11.
//  Copyright © 2017年 Shota Nakagami. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
    }
}

