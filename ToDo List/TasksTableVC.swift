//
//  TasksTableVC.swift
//  ToDo List
//
//  Created by Vinayak Sharma on 01/10/20.
//

import UIKit
import CoreData

class TasksTableVC: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [Todo]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasks", for: indexPath)

        

        return cell
    }
    

}
