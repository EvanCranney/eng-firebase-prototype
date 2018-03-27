//
//  ModelController.swift
//  Learning_FireBase&CoreData
//
//  Created by Evan Cranney on 30/8/17.
//  Copyright © 2017 OpenCache. All rights reserved.
//

import Foundation
import CoreData
import Firebase

class ModelController {

    let CDController:CoreDataController = CoreDataController()
    
    var collectionName: String?
    var collectionPassword: String?
    
    // Firebase database reference - for pushing
    var ref: DatabaseReference?
    
    // Firebase database handle - for pulling
    var dbhandle: DatabaseHandle?
    
    func addCollection(name: String, psw: String) {
        
        // (1) all the Firebase business
        // establish firebase reference
        ref = Database.database().reference()
        ref?.child("Collections").child("collection1").child("name").setValue(name)
        ref?.child("Collections").child("collection1").child("password").setValue(psw)

        // (2) all the Core Data business
        let collection: SampleCollection = SampleCollection(context : CDController.fetchContext())
        collection.name = name
        collection.password = psw
        CDController.saveContext()
        
        collectionName = name
        collectionPassword = psw
    }
    
    func fetchUnits(name: String, psw: String) -> [SampleUnit] {
        
        // retrieve units from firebase
        ref = Database.database().reference()
        dbhandle = ref?.child("Units").observe(.childAdded, with: {(snapshot) in
            if let item = snapshot.value as? String
            {
                print("adding")
                self.addUnit(name: item, miscData1: "meh", miscData2: "meh2")
            }
        })
        
        // retreive from core data
        do {
            let collectionList = try CDController.fetchContext().fetch(SampleUnit.fetchRequest())
            return collectionList as! [SampleUnit]
        } catch {
            return []
            // print error
        }
    }
    
    func addUnit(name: String, miscData1: String, miscData2: String) {
        let unit: SampleUnit = SampleUnit(context: CDController.fetchContext())
        unit.name = name
        unit.miscOne = miscData1
        unit.miscTwo = miscData2
        
        do {
            let collectionList = try CDController.fetchContext().fetch(SampleCollection.fetchRequest()) as! [SampleCollection]
            for collection in collectionList {
                if collection.name == collectionName && collection.password == collectionPassword {
                    collection.units?.adding(unit)
                }
            }
            CDController.saveContext()
        } catch {
            // print error
        }
    }
}
