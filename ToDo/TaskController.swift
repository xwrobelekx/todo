//
//  TaskController.swift
//  ToDo
//
//  Created by Kamil Wrobel on 8/25/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation


class TaskController {
    
    // Singelton
    static let shared = TaskController()
    
    
    //Source of truth
    var tasks : [Task] = []
    
    
    //CRUD
    

    //Create
    func createTask(name: String, description: String) {
        let createdTask = Task(name: name, description: description)
        tasks.append(createdTask)
        
    }
    //Read
    
    //Update
    func update(existingTask: Task, newName: String, NewDescription: String, newTimeStamp: Date = Date(), isComplete: Bool){
        existingTask.name = newName
        existingTask.description = NewDescription
        existingTask.timeStamp = newTimeStamp
        existingTask.isComplete = isComplete
        
        
        
    }
    
    //Delete
    func delete(task: Task){
        if let indexOfTaskBeingDeleted = tasks.index(of: task) {
            tasks.remove(at: indexOfTaskBeingDeleted)
        }
        
        
    }
    
    
    
    
    
    
    
    // Persistance
    
    func save(){

    }
    
    func loadTask(){
        
    }
    
//    func fileURL() -> URL {
//
//
//    }
//
    
    
    
    
    
    
    
}
