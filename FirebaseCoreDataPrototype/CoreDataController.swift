//
//  CoreDataController.swift
//  Learning_FireBase&CoreData
//
//  Created by Evan Cranney on 30/8/17.
//  Copyright © 2017 OpenCache. All rights reserved.
//

import Foundation
import CoreData

class CoreDataController {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FirebaseCoreDataPrototype")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
