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
            if let newlineRange = numbers.range(of: "\n") {
                   let delimiterPart = numbers[numbers.index(numbers.startIndex, offsetBy: 2)..<newlineRange.lowerBound]
                   let numberPart = numbers[newlineRange.upperBound...]
                   let delimiter = String(delimiterPart)
                   input = String(numberPart)
                   delimiterSet = CharacterSet(charactersIn: "\(delimiter)\n")
               }
        }
        let components = input.components(separatedBy: delimiterSet)
        let values = components.compactMap { Int($0) }
        
        let negatives = values.filter { $0 < 0 }
        if !negatives.isEmpty {
            throw CalculatorError.negativeNumbers(negatives)
        }
        
        return values.reduce(0, +)
    }
}
