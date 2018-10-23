//
//  ViewController.swift
//  GoalsPost
//
//  Created by Mac on 10/22/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate



class GoalVC: UIViewController {
    
    var goals:[Goal] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1{
                    tableView.isHidden = false
                    tableView.reloadData()
                }else{
                    tableView.isHidden = true
                }
                
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        
        
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {
            return
        }
        presentDetail(createGoalVC)
    }
    
}
extension GoalVC : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()}
        
        let goal = goals[indexPath.row]
        
        cell.configureCell(goal: goal)
        return cell
    }
    
    
    
}

extension GoalVC{
    func fetch(completion:(_ complete:Bool)->()){
        guard  let manegedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            goals = try manegedContext.fetch(fetchRequest)
            print("Successfly fetch data")
            completion(true)
        }catch {
            debugPrint("Could not catch \(error.localizedDescription)")
            completion(false)
        }
    }
}

