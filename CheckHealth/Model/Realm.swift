//
//  Realms.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 28.12.2020.
//

import RealmSwift

var realm: Realm!
var array: Results<Test>!

func compactRealm() {
    if let defaultURL = Realm.Configuration.defaultConfiguration.fileURL {
        let compactedURL = defaultURL.deletingLastPathComponent().appendingPathComponent("compact.realm")
        
        let config = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 2) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
            })
        Realm.Configuration.defaultConfiguration = config
        
        if FileManager.default.fileExists(atPath: compactedURL.path) {
            do {
                try Realm().writeCopy(toFile: compactedURL)
                print("File normally compressed!")
                //     try! FileManager.default.removeItem(at: defaultURL)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}

func setupRealm() {
    let realmPath = Bundle.main.url(forResource: "compact", withExtension: "realm")!
    let realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: true, schemaVersion: 3)
    realm = try! Realm(configuration: realmConfiguration)
    array = realm.objects(Test.self)
}


//func updateSchemaVersion() {
    //        let config = Realm.Configuration(
    //             schemaVersion: 3,
    //                migrationBlock: { migration, oldSchemaVersion in
    //                if (oldSchemaVersion < 2) {
    //                    // Nothing to do!
    //                    // Realm will automatically detect new properties and removed properties
    //                    // And will update the schema on disk automatically
    //                }
    //        })
    //        Realm.Configuration.defaultConfiguration = config
    //        var realm = try! Realm()
//}



