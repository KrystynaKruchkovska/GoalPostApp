
//
//  File.swift
//  GoalsPost
//
//  Created by Mac on 11/24/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

protocol DBServiceProtocol {
    func removeGoal(atIndexPath indexPath:IndexPath)
    func fetchGoals( completion:(_ complete:Bool)->() )
    func setProgress(atIndexPath indexPath:IndexPath)
    func addGoal(goalCompletion:Int, goalDescription:String, goalType:GoalType, completion:(_ finished:Bool)->())
    func getGoals() -> [Goal]
}
