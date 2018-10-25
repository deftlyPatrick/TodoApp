//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Patrick Wong on 10/25/18.
//  Copyright © 2018 Patrick Wong. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController {

    // MARK: - Properties
    
    var resultsController: NSFetchedResultsController<Todo>!
    let CDS = CoreDataStack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        let sortDescriptos = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptos]
        resultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: CDS.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        resultsController.delegate = self
        
        // Fetch
        do {
            try resultsController.performFetch()
        } catch {
            print("Perform fetch error: \(error)")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //searching for objects if not return 0 
        return resultsController.sections?[section].numberOfObjects ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)

        // Configure the cell...
        let todo = resultsController.object(at: indexPath)
        cell.textLabel?.text = todo.title
    
        return cell
    }
    
        //Mark: - Table view delegate
        
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive, title: "Delete"){
                (action,view, completion) in
                // TODO: Delete todo
                let todo = self.resultsController.object(at: indexPath)
                self.resultsController.managedObjectContext.delete(todo)
                //saves the new data when it deletes
                do {
                    try self.resultsController.managedObjectContext.save()
                    completion(true)
                }
                catch{
                    print("Delete failed: \(error)")
                    completion(false)
                }
                
                
                completion(true)
            }
            action.image = #imageLiteral(resourceName: "trash")
            action.backgroundColor = .red
            return UISwipeActionsConfiguration(actions: [action])
        }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive, title: "Delete"){
                (action,view, completion) in
                let todo = self.resultsController.object(at: indexPath)
                self.resultsController.managedObjectContext.delete(todo)
                //saves the new data when it deletes
                do {
                    try self.resultsController.managedObjectContext.save()
                    completion(true)
                }
                catch{
                    print("Delete failed: \(error)")
                    completion(false)
                }
            }
            action.image = #imageLiteral(resourceName: "check")
            action.backgroundColor = .green
            return UISwipeActionsConfiguration(actions: [action])
            
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowAdd", sender: tableView.cellForRow(at: indexPath))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let _ = sender as? UIBarButtonItem, let vc = segue.destination as? AddTodoVC {
            vc.managedContext = resultsController.managedObjectContext
        }
        
        if let cell = sender as? UITableViewCell, let vc = segue.destination as? AddTodoVC{
            vc.managedContext = resultsController.managedObjectContext
            
            if let indexPath = tableView.indexPath(for: cell){
                let todo = resultsController.object(at: indexPath)
                vc.todo = todo
            }
        }
    }
}


extension TodoTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        //when Done is clicked it forms a new data to the next formed index
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath, let cell = tableView.cellForRow(at: indexPath){
                let todo = resultsController.object(at: indexPath)
                cell.textLabel?.text = todo.title
            }
        default:
            break
        }
    }
}
