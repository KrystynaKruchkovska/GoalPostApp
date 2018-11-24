//
//  FinishGoalVC.swift
//  GoalsPost
//
//  Created by Mac on 10/23/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit


class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    var goalViewModel:GoalViewModel!
    var goalDescription:String!
    var goalType:GoalType!

    @IBOutlet weak var createGoalBtn: UIButton!
    
    @IBOutlet weak var pointsTxtField: UITextField!
    
    
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
            
            guard let text = pointsTxtField.text else { return }
            guard let goalPoints = Int(text) else { return }
            
            guard let goalType = self.goalType else { return }
            
            self.goalViewModel.save(goalCompletion: goalPoints, goalDescription: self.goalDescription, goalType: goalType)
            { (complete) in
                if complete{
                    dismiss(animated: true, completion: nil)
                }
            }
        }

    }
    func initdata(description:String,type:GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
}
