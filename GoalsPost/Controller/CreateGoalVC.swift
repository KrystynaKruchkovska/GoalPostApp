//
//  CreateGoalVC.swift
//  GoalsPost
//
//  Created by Mac on 10/22/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController,UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType:GoalType = .shortTerm
    var goalViewModel:GoalViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpVC()
    }
    
    func setUpVC() {
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTextView.delegate = self
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
        if goalTextView.text != "" && goalTextView.text != "What is your goal?"{
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishVC") as? FinishGoalVC else { return }
            
            guard let goalDescription = goalTextView.text else { return }
            
            finishGoalVC.goalViewModel = self.goalViewModel
            finishGoalVC.initdata(description: goalDescription, type: goalType)
            
            
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
            
        }
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
