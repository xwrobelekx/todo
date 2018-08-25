//
//  Task.swift
//  ToDo
//
//  Created by Kamil Wrobel on 8/25/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation

class Task: Codable, Equatable {
    var name:        String
    var description: String
    var isComplete:  Bool
    var timeStamp:   Date
    
    init(name: String, description: String, isComplete: Bool = false, timeStamp: Date = Date()){
        self.name        = name
        self.description = description
        self.isComplete  = isComplete
        self.timeStamp   = timeStamp
    }
    
    static func ==(lhs: Task, rhs: Task) -> Bool{
        if lhs.name        != rhs.name {return false}
        if lhs.description != rhs.description {return false}
        return true
        
    }
}


