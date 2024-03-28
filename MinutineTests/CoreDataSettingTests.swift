//
//  CoreDataSettingTests.swift
//  MinutineTests
//
//  Created by Perveaux Nicolas on 28/03/2024.
//

import XCTest
@testable import Minutine


final class CoreDataSettingTests: XCTestCase {
    // MARK: - Properties
    var coreDataStack: MockCoreDataStack!
    var coreDataSetting: CoreDataSetting!

    // MARK: - Tests Life Cycle

    override func setUp() {
        super.setUp()
        coreDataStack = MockCoreDataStack()
        coreDataSetting = CoreDataSetting(coreDataStack: coreDataStack)
    }
    override func tearDown() {
        super.tearDown()
        coreDataSetting = nil
        coreDataStack = nil
    }

    // MARK: - Tests
    func testAddRecipeMethods_WhenAnEntityIsCreated_ThenShouldBeCorrectlySaved() {
        coreDataSetting.createRoutine(day: "jour 1", validEatRoutineAM: "Validé", validWashRoutineAM: "Validé", validGetDressedRoutineAM: "Validé", validEatRoutinePM: "Validé", validWashRoutinePM: "Validé", validGetDressedRoutinePM: "Validé")
        XCTAssertTrue(!coreDataSetting.routines.isEmpty)
        XCTAssertTrue(coreDataSetting.routines.count == 1)
        XCTAssertTrue(coreDataSetting.routines[0].day == "jour 1")
        XCTAssertTrue(coreDataSetting.routines[0].validWashRoutineAM == "Validé")
        XCTAssertTrue(coreDataSetting.routines.count > 0)
        
    }
    
  
    func testDeleteAllRecipesMethod_WhenAnEntityIsCreated_ThenShouldBeCorrectlyAllDeleted() {
        coreDataSetting.createRoutine(day: "jour 1", validEatRoutineAM: "Validé", validWashRoutineAM: "Validé", validGetDressedRoutineAM: "Validé", validEatRoutinePM: "Validé", validWashRoutinePM: "Validé", validGetDressedRoutinePM: "Validé")
        coreDataSetting.deleteRoutine()
        XCTAssertTrue(coreDataSetting.routines.isEmpty)
        
  //      let recipeIsFavorite = coreDataSetting.checkIfRecipeIsFavorite(recipeTitle: "My Recipe", url: "http://www.seriouseats.com/recipes/2009/09/adult-brownie-chocolate-salt-coffee-andronicos-supermarket-san-francisco-recipe.html")
  //      XCTAssertFalse(recipeIsFavorite)
    }
}
