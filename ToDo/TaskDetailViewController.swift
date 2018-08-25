//
//  TaskDetailViewController.swift
//  ToDo
//
//  Created by Kamil Wrobel on 8/25/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var isCompleteSwitch: UISwitch!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var CompleteLabel: UILabel!
    
    var task: Task?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let task = task {
            updateViews(task: task)
        } else {
            isCompleteSwitch.isHidden = true
            CompleteLabel.isHidden = true
            
        }
       
    }

    
    

    @IBAction func switchToggled(_ sender: Any) {
        print("switch toggled")
        print(isCompleteSwitch.isOn)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        print("clear button tapped")
        taskNameTextField.text = ""
        descriptionTextView.text = ""
        isCompleteSwitch.isOn = false
      
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("save buton tapped")
        let isComplete = isCompleteSwitch.isOn
        guard let taskName = taskNameTextField.text, let description = descriptionTextView.text else {return}
        guard taskName != "" else {return}
        
        if let taskThatsBeingUpdated = task {
            // Update Logic
            TaskController.shared.update(existingTask: taskThatsBeingUpdated, newName: taskName, NewDescription: description, isComplete: isComplete)
            
            
        } else {
            //Create Logic
            TaskController.shared.createTask(name: taskName, description: description)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
   
    // MARK: - Navigation

    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            
        
    }
    
    func updateViews(task: Task){
        taskNameTextField.text = task.name
        descriptionTextView.text = task.description
        isCompleteSwitch.isOn = task.isComplete
        //update the view for the background color
    }
    

}



















