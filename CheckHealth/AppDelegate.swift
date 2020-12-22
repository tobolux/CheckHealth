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
        
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL ?? "error")
//
//        do {
//            let realm = try Realm()
//        } catch {
//            print(error)
//        }

//
//        func compactRealm() {
//                if let realmPath = Realm.Configuration.defaultConfiguration.fileURL {
//                    let destination = realmPath.deletingLastPathComponent().appendingPathComponent("compact.realm")
//                    if FileManager.default.fileExists(atPath: realmPath.path) {
//                        do {
//        //                    let encryption = Constants.key.data(using: String.Encoding.utf8)
//                            try Realm().writeCopy(toFile: destination)
//                            print("File normally compressed!")
//
//                        } catch {
//                            fatalError(error.localizedDescription)
//                        }
//                    } else {
//                        print("Realm file does not exist")
//        //                fatalError()
//                    }
//
//                }
//
//            }
//
//        compactRealm()
        
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

