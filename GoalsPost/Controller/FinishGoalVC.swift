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
    
    

    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        // pass data into CORE Data Goal Model
    }
    
    func initdata(description:String,type:GoalType){
        self.goalDescription = description
        self.goalType = type
    }
}
