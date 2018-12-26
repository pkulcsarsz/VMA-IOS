//
//  Exam.swift
//  Exam Planner
//
//  Created by Péter Kulcsár Szabó on 17/12/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//
import Foundation

class Exam : Codable
{
    //MARK: Properties
    
    var name: String
    var state: ExamState
    var date: Date
    
    //MARK: Initialization
    
    init?(name: String, state: ExamState, date: Date) {
        
        // Initialize stored properties.
        self.name = name
        self.state = state
        self.date = date
    }
}


public enum ExamState : Int, Codable
{
    case pending = 0
    case passed = 1
}
