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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    

    @IBAction func switchToggled(_ sender: Any) {
        print("switch toggled")
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        print("clear button tapped")
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("save buton tapped")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
