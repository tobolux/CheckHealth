//
//  AppDelegate.swift
//  CheckHealth
//

//  Created by Ilya Bolotov on 08.12.2020.
//
import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        
//        func compactRealm() {
//            if let defaultURL = Realm.Configuration.defaultConfiguration.fileURL {
//                let compactedURL = defaultURL.deletingLastPathComponent().appendingPathComponent("compact.realm")
//
//                let config = Realm.Configuration(
//                    schemaVersion: 3,
//                    migrationBlock: { migration, oldSchemaVersion in
//                        if (oldSchemaVersion < 2) {
//                            // Nothing to do!
//                            // Realm will automatically detect new properties and removed properties
//                            // And will update the schema on disk automatically
//                        }
//                    })
//                Realm.Configuration.defaultConfiguration = config
//
//                if FileManager.default.fileExists(atPath: compactedURL.path) {
//                    do {
//                        try Realm().writeCopy(toFile: compactedURL)
//                        print("File normally compressed!")
//                        //     try! FileManager.default.removeItem(at: defaultURL)
//                    } catch {
//                        fatalError(error.localizedDescription)
//                    }
//                }
//            }
//        }

        //   compactRealm()
        // print(Realm.Configuration.defaultConfiguration.fileURL ?? "error")
        
        setupRealm()

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

