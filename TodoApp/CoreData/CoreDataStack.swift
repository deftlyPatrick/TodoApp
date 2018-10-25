//
//  CoreDataStack.swift
//  TodoApp
//
//  Created by Patrick Wong on 10/25/18.
//  Copyright © 2018 Patrick Wong. All rights reserved.
//

import Foundation
import CoreData


class CoreDataStack{
    var container: NSPersistentContainer{
        let container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores{ (description, error) in
            guard error == nil else{
                print ("Error: \(error!)")
               return
            }
        }
        return container
    }


    var managedContext: NSManagedObjectContext {
        return container.viewContext
    }

}




