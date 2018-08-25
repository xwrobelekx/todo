//
//  TasksTableViewController.swift
//  ToDo
//
//  Created by Kamil Wrobel on 8/25/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.shared.tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToBeDeleted = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.delete(task: taskToBeDeleted)
            //insetd of reloading data(which is choppy), use this
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = TaskController.shared.tasks[indexPath.row]
        cell.textLabel?.text = task.name
        //formats the time and date to shorter version
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        dateFormater.timeStyle = .short
        
        
        cell.detailTextLabel?.text = dateFormater.string(from: task.timeStamp)
        if task.isComplete == false {
        cell.backgroundColor = #colorLiteral(red: 0.9685913706, green: 0.7028418626, blue: 0.2781286133, alpha: 0.5208154966)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.4972932198, green: 0.7693527919, blue: 0.5704015337, alpha: 1)
        }
        return cell
    }
    
    /*
     I
     I
     D
     O
     O
     */

   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailView" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? TaskDetailViewController else {return}
            let taskThatsBeingPased = TaskController.shared.tasks[indexPath.row]
            destinationVC.task = taskThatsBeingPased
        }

}
}
