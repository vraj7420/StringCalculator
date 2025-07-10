//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Vraj on 10/07/25.
//

import XCTest
@testable import  StringCalculator

final class StringCalculatorTests: XCTestCase {
    var calculator: StringCalculator!
    
    override func setUp() {
        super.setUp()
        calculator = StringCalculator()
    }
    
    func testEmptyInputReturnsZero() throws {
        XCTAssertEqual(try calculator.add(""), 0)
    }
}
