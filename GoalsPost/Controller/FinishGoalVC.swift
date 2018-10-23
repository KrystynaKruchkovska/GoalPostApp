//
//  FinishGoalVC.swift
//  GoalsPost
//
//  Created by Mac on 10/23/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit


class FinishGoalVC: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var createGoalBtn: UIButton!
    
    @IBOutlet weak var pointsTxtField: UITextField!
    
    var goalDescription:String!
    var goalType:GoalType!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTxtField.delegate = self
        
    }
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTxtField.text != ""{
            self.save { (complete) in
                if complete{
                    dismiss(animated: true, completion: nil)
                }
            }
        }
        // pass data into CORE Data Goal Model
        
        
    }
    
    func initdata(description:String,type:GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    func save(completion:(_ finished:Bool)->()){
        guard let manegedContext = appDelegate?.persistentContainer.viewContext else{return}
        let goal = Goal(context: manegedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalProgress = Int32(0)
        goal.goalCompletion = Int32(pointsTxtField.text!)!
        
        do{
           try manegedContext.save()
            print("Successfuly saved data")
            completion(true)
            
        }catch{
            debugPrint("Could not save:\(error.localizedDescription)")
            completion(false)
        }
    }
    
}
