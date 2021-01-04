//
//  Realms.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 28.12.2020.
//

import RealmSwift

var realm: Realm!
var array: Results<Test>!

func setupRealm() {
    let realmPath = Bundle.main.url(forResource: "compact", withExtension: "realm")!
    let realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: true, schemaVersion: 4)
    realm = try! Realm(configuration: realmConfiguration)
    array = realm.objects(Test.self)
}

func updateSchemaVersion() {
            let config = Realm.Configuration(
                 schemaVersion: 4,
                    migrationBlock: { migration, oldSchemaVersion in
                    if (oldSchemaVersion < 3) {
                        // Nothing to do!
                        // Realm will automatically detect new properties and removed properties
                        // And will update the schema on disk automatically
                    }
            })
            Realm.Configuration.defaultConfiguration = config
    _ = try! Realm()
}

func compactRealm() {
                if let realmPath = Realm.Configuration.defaultConfiguration.fileURL {
                    let destination = realmPath.deletingLastPathComponent().appendingPathComponent("compact.realm")
                    if FileManager.default.fileExists(atPath: realmPath.path) {
                        do {
                            let config = Realm.Configuration(
                                schemaVersion: 4,
                                migrationBlock: { migration, oldSchemaVersion in
                                    if (oldSchemaVersion < 3) {
                                        // Nothing to do!
                                        // Realm will automatically detect new properties and removed properties
                                        // And will update the schema on disk automatically
                                    }
                                })
                            Realm.Configuration.defaultConfiguration = config
        //                    let encryption = Constants.key.data(using: String.Encoding.utf8)
                            try Realm().writeCopy(toFile: destination)
                            print("File normally compressed!")

                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    } else {
                        print("Realm file does not exist")
        //                fatalError()
                    }

                }

            }




