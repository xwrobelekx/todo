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
        save()
    }
    //Read
    
    //Update
    func update(existingTask: Task, newName: String, NewDescription: String, newTimeStamp: Date = Date(), isComplete: Bool){
        existingTask.name = newName
        existingTask.description = NewDescription
        existingTask.timeStamp = newTimeStamp
        existingTask.isComplete = isComplete
        save()
        
        
    }
    
    //Delete
    func delete(task: Task){
        if let indexOfTaskBeingDeleted = tasks.index(of: task) {
            tasks.remove(at: indexOfTaskBeingDeleted)
        }
        save()
        
        
    }
    
    
    
    
    
    
    
    // Persistance
    
    func save(){
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(tasks)
            try data.write(to: fileURL())
        } catch {
            print("Error Saving to Persistance: \(error.localizedDescription)")
        }

    }
    
    func loadTask(){
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedTasks = try decoder.decode([Task].self, from: data)
            self.tasks = decodedTasks
            
            
        } catch {
            print("Error Loding Data fromPesistance: \(error.localizedDescription)")
        }
        
        
    }
    
    //Get URL From FileMAnager
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "Task.json"
        let documentDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentDirectoryURL

    }

    
    
    
    
    
    
    
}
