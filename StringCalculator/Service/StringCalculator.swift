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
        let values = numbers.split(separator: ",").compactMap { Int($0) }
        return values.reduce(0, +)
    }
}
