//
//  MockTimerSettingDelegate.swift
//  MinutineTests
//
//  Created by Perveaux Nicolas on 31/03/2024.
//

import XCTest
@testable import Minutine

class MockTimerSettingDelegate: TimerSettingDelegate {
    var didCallUpdateWashButton = false
    var didCallUpdateGetDressedButton = false
    var didCallUpdateEatButton = false
    var expectedImage: UIImage?
    
    func didUpdateWashButton(image: UIImage?) {
        didCallUpdateWashButton = true
        XCTAssertEqual(image, expectedImage)
    }
    
    func didUpdateGetDressedButton(image: UIImage?) {
        didCallUpdateGetDressedButton = true
        XCTAssertEqual(image, expectedImage)
    }
    
    func didUpdateEatButton(image: UIImage?) {
        didCallUpdateEatButton = true
        XCTAssertEqual(image, expectedImage)
    }
}
