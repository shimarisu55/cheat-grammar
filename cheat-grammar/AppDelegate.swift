//
//  AppDelegate.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/08/21.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        // テストデバイスidの登録
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [
            "kGADSimulatorID", // シミュレータ
            "75870411202bbe69f1ebd808dd93d9ea", // ios14
            "091ae5f5e0d9133873624c43756723cf" // ios13
        ]
        // インタースティシャル広告の準備
        AdManager.sharedInstance.createAndLoadInterstitial()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

