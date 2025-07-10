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
        var input = numbers
        var delimiterSet = CharacterSet(charactersIn: ",\n")

        if numbers.hasPrefix("//") {
            let parts = numbers.components(separatedBy: "\n")
            if parts.count >= 2 {
                let delimiter = parts[0].dropFirst(2)
                input = parts[1]
                delimiterSet = CharacterSet(charactersIn: "\(delimiter)\n")
            }
        }
        let components = input.components(separatedBy: delimiterSet)
        let values = components.compactMap { Int($0) }
        return values.reduce(0, +)
    }
}
