//
//  GoalViewModel.swift
//  GoalsPost
//
//  Created by Mac on 11/24/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class GoalViewModel: NSObject {
    
    private var dbService:DBServiceProtocol
    
    var goals:[Goal] {
        get{
            return self.dbService.getGoals()
        }
    }
    
    init(dbService:DBServiceProtocol) {
        self.dbService = dbService
    }
    
    func removeGoal(atIndexPath indexPath:IndexPath){
        self.dbService.removeGoal(atIndexPath: indexPath)
    }

    func fetchGoals( completion:(_ complete:Bool)->() ){
        self.dbService.fetchGoals(completion: completion)
    }
    
    func setProgress(atIndexPath indexPath:IndexPath){
        self.dbService.setProgress(atIndexPath: indexPath)
    }
    
    func save(goalCompletion:Int,goalDescription:String,goalType:GoalType, completion:(_ finished:Bool)->()){
        self.dbService.addGoal(goalCompletion: goalCompletion, goalDescription: goalDescription, goalType: goalType, completion: completion)
    }
    
    func pointsCompleted()->Int32 {
        var completed:Int32 = 0
        
        for goal in self.goals {
            completed += goal.goalProgress
        }
        
        return completed
    }
    
}
