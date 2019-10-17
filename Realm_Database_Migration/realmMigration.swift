// import RealmSwift
// use this code in AppDelegate file in didFinishLaunchingWithOptions function
 
 let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    migration.enumerateObjects(ofType: Cart.className(), { (oldObject, newObject) in
                        newObject!["screenScource"] = ""
                    })
                }
        })
