//
//  GoalViewModelTest.swift
//  GoalsPostTests
//
//  Created by Mac on 11/24/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import XCTest

class DBServiceMock:DBServiceProtocol{
    func removeGoal(atIndexPath indexPath: IndexPath) {
    
    }
    
    func fetchGoals(completion: (Bool) -> ()) {
    
    }
    
    func setProgress(atIndexPath indexPath: IndexPath) {
    
    }
    
    func save(goalCompletion: Int, goalDescription: String, goalType: GoalType, completion: (Bool) -> ()) {
    
    }
    
    func getGoals() -> [Goal] {
        return []
    }
    
    
}

class GoalViewModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testPointsCompletedEqualsZero() {
        let dbService = DBServiceMock()
        var goalViewModel = GoalViewModel(dbService: dbService)
        XCTAssertEqual(0, goalViewModel.pointsCompleted())
    }

}
