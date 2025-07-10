//
//  StringCalculatorService.swift
//  StringCalculator
//
//  Created by Vraj on 10/07/25.
//

import Foundation

final class StringCalculatorService {
    func add(_ numbers: String) throws -> Int {
        guard  !numbers.isEmpty else {
            return 0
        }
        return Int(numbers) ?? 0
    }
}
