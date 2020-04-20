//
//  AppDelegate.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 3/31/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /*
        if #available(iOS 13, *) {
          let appearance = UINavigationBarAppearance()

          // title color
          appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

          // large title color
          appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

          // background color
          appearance.backgroundColor = .blue

          // bar button styling
          let barButtonItemApperance = UIBarButtonItemAppearance()
          barButtonItemApperance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]

          appearance.backButtonAppearance = barButtonItemApperance

          // set the navigation bar appearance to the color we have set above
          UINavigationBar.appearance().standardAppearance = appearance

          // when the navigation bar has a neighbouring scroll view item (eg: scroll view, table view etc)
          // the "scrollEdgeAppearance" will be used
          // by default, scrollEdgeAppearance will have a transparent background
          UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }

        // the back icon color
        UINavigationBar.appearance().tintColor = .white
        */
        // Override point for customization after application launch.
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

