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

    public private(set) var goals:[Goal] = []
    
}

extension GoalViewModel{
    
    func removeGoal(atIndexPath indexPath:IndexPath){
        guard let manegedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        manegedContext.delete(goals[indexPath.row])
        
        do{
            try manegedContext.save()
            print("Successflly remove data")
        }catch{
            debugPrint("Could not remove\(error.localizedDescription)")
        }
        
    }
    
    func fetchGoals( completion:(_ complete:Bool)->() ){
        guard  let manegedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            goals = try manegedContext.fetch(fetchRequest)
            print("Successflly fetch data")
            completion(true)
        }catch {
            debugPrint("Could not catch \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func setProgress(atIndexPath indexPath:IndexPath){
        guard let manegedContext = appDelegate?.persistentContainer.viewContext else {return}
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgress < chosenGoal.goalCompletion{
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        }else {return}
        
        do{
            try manegedContext.save()
            print("successfully set progress")
        }catch{
            debugPrint("Could not catch progress \(error.localizedDescription)")
            
        }
    }
}
