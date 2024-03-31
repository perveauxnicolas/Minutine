//
//  MinutineTests.swift
//  MinutineTests
//
//  Created by Perveaux Nicolas on 14/03/2024.
//

import XCTest
@testable import Minutine

final class MinutineTests: XCTestCase {
    // MARK: - Properties
    var timerSetting: TimerSetting!
    var mockDelegate: MockTimerSettingDelegate!
    
    // MARK: - Methods
    override func setUp() {
        super.setUp()
        timerSetting = TimerSetting()
        mockDelegate = MockTimerSettingDelegate()
        timerSetting.timerSettingDelegate = mockDelegate
    }
    
    override func tearDown() {
        timerSetting = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testReturnSuccess_WashButtonGreenAM() {
        let buttonTag = 0
        let expectedImage = UIImage(named: "washV")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnSucces(buttonTag: buttonTag)
        
        XCTAssertTrue(mockDelegate.didCallUpdateWashButton)
        XCTAssertFalse(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertFalse(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnSuccess_GetDressedButtonGreenAM() {
        let buttonTag = 1
        let expectedImage = UIImage(named: "getDressedV")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnSucces(buttonTag: buttonTag)
        
        XCTAssertFalse(mockDelegate.didCallUpdateWashButton)
        XCTAssertTrue(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertFalse(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnSuccess_EatButtonGreenAM() {
        let buttonTag = 2
        let expectedImage = UIImage(named: "eatV")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnSucces(buttonTag: buttonTag)
        
        XCTAssertFalse(mockDelegate.didCallUpdateWashButton)
        XCTAssertFalse(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertTrue(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnSuccess_WashButtonGreenPM() {
        let buttonTag = 3
        let expectedImage = UIImage(named: "washV")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnSucces(buttonTag: buttonTag)
        
        XCTAssertTrue(mockDelegate.didCallUpdateWashButton)
        XCTAssertFalse(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertFalse(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnSuccess_GetDressedButtonGreenPM() {
        let buttonTag = 4
        let expectedImage = UIImage(named: "getDressedV")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnSucces(buttonTag: buttonTag)
        
        XCTAssertFalse(mockDelegate.didCallUpdateWashButton)
        XCTAssertTrue(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertFalse(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnSuccess_EatButtonGreenPM() {
        let buttonTag = 5
        let expectedImage = UIImage(named: "eatV")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnSucces(buttonTag: buttonTag)
        
        XCTAssertFalse(mockDelegate.didCallUpdateWashButton)
        XCTAssertFalse(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertTrue(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnFailed_WashButtonRedAM() {
        let buttonTag = 0
        let expectedImage = UIImage(named: "washR")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnFailed(buttonTag: buttonTag)
        
        XCTAssertTrue(mockDelegate.didCallUpdateWashButton)
        XCTAssertFalse(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertFalse(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnFailed_GetDressedButtonRedAM() {
        let buttonTag = 1
        let expectedImage = UIImage(named: "getDressedR")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnFailed(buttonTag: buttonTag)

        XCTAssertFalse(mockDelegate.didCallUpdateWashButton)
        XCTAssertTrue(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertFalse(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnFailed_EatButtonRedAM() {
        let buttonTag = 2
        let expectedImage = UIImage(named: "eatR")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnFailed(buttonTag: buttonTag)

        XCTAssertFalse(mockDelegate.didCallUpdateWashButton)
        XCTAssertFalse(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertTrue(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnFailed_WashButtonRedPM() {
        let buttonTag = 3
        let expectedImage = UIImage(named: "washR")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnFailed(buttonTag: buttonTag)

        XCTAssertTrue(mockDelegate.didCallUpdateWashButton)
        XCTAssertFalse(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertFalse(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnFailed_GetDressedButtonRedPM() {
        let buttonTag = 4
        let expectedImage = UIImage(named: "getDressedR")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnFailed(buttonTag: buttonTag)

        XCTAssertFalse(mockDelegate.didCallUpdateWashButton)
        XCTAssertTrue(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertFalse(mockDelegate.didCallUpdateEatButton)
    }
    
    func testReturnFailed_EatButtonRedPM() {
        let buttonTag = 5
        let expectedImage = UIImage(named: "eatR")
        mockDelegate.expectedImage = expectedImage
        
        timerSetting.returnFailed(buttonTag: buttonTag)

        XCTAssertFalse(mockDelegate.didCallUpdateWashButton)
        XCTAssertFalse(mockDelegate.didCallUpdateGetDressedButton)
        XCTAssertTrue(mockDelegate.didCallUpdateEatButton)
    }
 
    func testDayChoose() {
        XCTAssertEqual(TimerSetting.routine.day, "")
        XCTAssertEqual(TimerSetting.dayCounter, 1)
        
        timerSetting.dayChoose()

        XCTAssertEqual(TimerSetting.routine.day, "jour 1")
        XCTAssertEqual(TimerSetting.dayCounter, 2)
    }
    
    func testDayChooseResetAfterSevenDays() {
        // Arrange
           TimerSetting.routine.day = ""
           TimerSetting.dayCounter = 7
           
           timerSetting.dayChoose()
           
           XCTAssertEqual(TimerSetting.routine.day, "jour 7")
           XCTAssertEqual(TimerSetting.dayCounter, 1)
       }
    
}
