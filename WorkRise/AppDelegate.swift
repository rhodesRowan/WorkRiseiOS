//
//  AppDelegate.swift
//  WorkRise
//
//  Created by Rowan Rhodes on 25/01/2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureFirebase()
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

    func configureFirebase() {
        
        var filePath:String!
        #if DEBUG
            print("[FIREBASE] Development mode.")
            filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist", inDirectory: "Development")
        #else
            print("[FIREBASE] Production mode.")
            filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist", inDirectory: "Release")
        #endif
        
        let options = FirebaseOptions.init(contentsOfFile: filePath)
        FirebaseApp.configure(options: options!)
    }

}

