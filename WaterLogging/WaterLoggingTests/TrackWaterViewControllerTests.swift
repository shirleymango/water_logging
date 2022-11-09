//
//  VisualizeWaterIntakeViewControllerTests.swift
//  WaterLoggingTests
//
//  Created by ZhuMacPro on 11/9/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import XCTest
@testable import WaterLogging

class TrackWaterViewControllerTests: XCTestCase {
    var sut = TrackWaterViewController()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = TrackWaterViewController()
    }
    
    func testInitialValues() {
        XCTAssertEqual(sut.defaults.integer(forKey: "waterGoal"), 64)
        XCTAssertEqual(sut.defaults.integer(forKey: "waterIntake"), 0)
    }
    
    func testUpdateIntakeValue() {
        sut.addWaterButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.defaults.integer(forKey: "waterIntake"), 8)
    }

}
