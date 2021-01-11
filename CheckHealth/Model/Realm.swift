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
