//
//  CreateGoalVC.swift
//  GoalsPost
//
//  Created by Mac on 10/22/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTextVC: UITextView!
    
    @IBOutlet weak var shortTermBtn: UIButton!
    
    @IBOutlet weak var longTermBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType:GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()

     
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        
        dismissDetail()
    }
    
}
