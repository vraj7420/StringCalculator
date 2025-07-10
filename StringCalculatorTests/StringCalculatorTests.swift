//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Vraj on 10/07/25.
//

import XCTest
@testable import  StringCalculator

final class StringCalculatorTests: XCTestCase {
    var calculator: StringCalculatorService!
    
    override func setUp() {
        super.setUp()
        calculator = StringCalculatorService()
    }
    
    func testEmptyInputReturnsZero() throws {
        XCTAssertEqual(try calculator.add(""), 0)
    }
}
