//
//  AppDelegate.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/22.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let config = Realm.Configuration(

                schemaVersion: 6,


                migrationBlock: { migration, oldSchemaVersion in

                if (oldSchemaVersion < 1) {

                }
        })

                   Realm.Configuration.defaultConfiguration = config
        
        // アプリで使用するdefault.realmのパスを取得
        let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL!

        // 初期データが入ったRealmファイルのパスを取得
        let bundleRealmPath = Bundle.main.url(forResource: "soreseikai", withExtension: "realm")

        // アプリで使用するRealmファイルが存在しない（= 初回利用）場合は、シードファイルをコピーする
        if !FileManager.default.fileExists(atPath: defaultRealmPath.path) {
            do {
                try FileManager.default.copyItem(at: bundleRealmPath!, to: defaultRealmPath)
            } catch let error {
                print("error: \(error)")
              }
          }
        
        
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

