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
    func testAddRoutine_WhenAnEntityIsCreated_ThenShouldBeCorrectlySaved() {
        // Given
        let routine = Routine(day: "jour 1", validWashRoutineAM: "Validé", validGetDressedRoutineAM: "Validé", validEatRoutineAM: "Validé", validWashRoutinePM: "Validé", validGetDressedRoutinePM: "Validé", validEatRoutinePM: "Validé")
        let routineDay = RoutineDay(routine: routine)
        let routineResult = RoutineResult(routineDays: [routineDay])
        // When : Save the routine to Core Data
        coreDataSetting.saveToCoreData(routineResult: routineResult)
        // Then
        XCTAssertTrue(!coreDataSetting.routines.isEmpty)
        XCTAssertTrue(coreDataSetting.routines.count == 1)
        XCTAssertTrue(coreDataSetting.routines[0].day == "jour 1")
        XCTAssertTrue(coreDataSetting.routines[0].validWashRoutineAM == "Validé")
        XCTAssertTrue(coreDataSetting.routines.count > 0)
    }
    
    func testDeleteAllRoutines_WhenAnEntityIsCreated_ThenShouldBeAllCorrectlyDeleted() {
        let routine = Routine(day: "jour 1", validWashRoutineAM: "Validé", validGetDressedRoutineAM: "Validé", validEatRoutineAM: "Validé", validWashRoutinePM: "Validé", validGetDressedRoutinePM: "Validé", validEatRoutinePM: "Validé")
        
        let routineDay = RoutineDay(routine: routine)
        _ = RoutineResult(routineDays: [routineDay])
        
        coreDataSetting.deleteRoutines()
        
        XCTAssertTrue(coreDataSetting.routines.isEmpty)
    }
    
}
