//
//  CalculatorError.swift
//  StringCalculator
//
//  Created by Vraj on 10/07/25.
//

import Foundation

enum CalculatorError: LocalizedError {
    case negativeNumbers([Int])

    var errorDescription: String? {
        switch self {
        case .negativeNumbers(let negatives):
            return "\(StringConstant.negativeNumberError) \(negatives.map(String.init).joined(separator: ", "))"
        }
    }
}
