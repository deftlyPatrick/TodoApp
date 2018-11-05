//
//  ViewController.swift
//  TodoApp
//
//  Created by Patrick Wong on 11/4/18.
//  Copyright © 2018 Patrick Wong. All rights reserved.
//

import UIKit
import CoreData

public protocol TodoProtocol: UITableViewDataSource{
    
    var managedObjectContext: NSManagedObjectContext? {
        get
    }
    
    var tableView: UITableView! {
        get set
    }
    
    func fetch()
}
