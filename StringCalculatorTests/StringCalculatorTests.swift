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
    
    func testSingleNumberReturnsItself() throws {
        XCTAssertEqual(try calculator.add("4"), 4)
    }
    
    func testCommaSeparatedReturnsSum() throws {
        XCTAssertEqual(try calculator.add("1,2,3"), 6)
    }
    
    func testSupportsNewlineDelimiter() throws {
        XCTAssertEqual(try calculator.add("1\n2,3"), 6)
    }
    
    func testCustomDelimiter() throws {
        XCTAssertEqual(try calculator.add("//;\n1;2"), 3)
        XCTAssertEqual(try calculator.add("//.\n1.2.3"), 6)

    }
    
    func testNegativeThrowsError() {
        XCTAssertThrowsError(try calculator.add("-1,2,-3")) { error in
            XCTAssertEqual(error.localizedDescription, "negative numbers not allowed: -1, -3")
        }
    }
}
