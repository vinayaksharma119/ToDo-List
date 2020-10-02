//
//  TasksTableVC.swift
//  ToDo List
//
//  Created by Vinayak Sharma on 01/10/20.
//

import UIKit
import CoreData

class DataManager{
    static let shared = DataManager()
    var tasksTableVC = TasksTableVC()
}

class TasksTableVC: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [Todo]?

    let trashImage = UIImage(systemName: "trash")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTodo()
        DataManager.shared.tasksTableVC = self
        
    }
    
    
    func fetchTodo(){
        do{
            self.items = try context.fetch(Todo.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            print(error)
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasks", for: indexPath) as! TasksTableViewCell
        let tasks = self.items![indexPath.row]
        
        cell.tasksLabel.text = tasks.title

        return cell
    }

    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            let itemToRemove = self.items![indexPath.row]
            self.items?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.context.delete(itemToRemove)


            do{
            try self.context.save()
            } catch {
                print(error)
            }

            self.fetchTodo()
        }
        
        let action2 = UIContextualAction(style: .normal, title: "Edit") { (action2, view, completion) in
            let itemToEdit = self.items![indexPath.row]
            print(itemToEdit)
            
        }
        
        
        action.image = trashImage
        action.backgroundColor = .systemRed
        
        action2.backgroundColor = .systemYellow
        
        return UISwipeActionsConfiguration(actions: [action, action2])
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }

}
