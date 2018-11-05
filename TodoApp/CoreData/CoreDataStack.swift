//
//  CoreDataStack.swift
//  TodoApp
//
//  Created by Patrick Wong on 10/25/18.
//  Copyright © 2018 Patrick Wong. All rights reserved.
//

import Foundation
import CoreData




// contains all of the saved records
class CoreDataStack{
    
    static let shared = CoreDataStack()
    
    
  /* var persistentContainer: NSPersistentContainer{
        let container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores(completionHandler: { (description, error) in
            guard error == nil else{
                print ("Error: \(error!)")
               return
            }
        })
        return container
    }
 */

    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    

    
// provides a scratch pad for managed objects 
    var managedContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

}




