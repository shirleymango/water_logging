//
//  VisualizeWaterIntakeViewControllerTests.swift
//  WaterLoggingTests
//
//  Created by ZhuMacPro on 11/9/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import XCTest
@testable import WaterLogging

class VisualizeWaterIntakeViewControllerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialValues() {
        let sut = VisualizeWaterIntakeViewController()
        _ = sut.view
        XCTAssertEqual(sut.waterGoal, 64)
        XCTAssertEqual(sut.waterIntake, 0)
    }

}
