//
//  TasksTableViewCell.swift
//  ToDo List
//
//  Created by Vinayak Sharma on 01/10/20.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tasksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
