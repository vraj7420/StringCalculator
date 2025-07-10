//
//  CalculateStringSumUseCaseProtocol.swift
//  StringCalculator
//
//  Created by Vraj on 10/07/25.
//


protocol CalculateStringSumUseCaseProtocol {
    func execute(with input: String) throws -> Int
}

final class CalculateStringSumUseCase: CalculateStringSumUseCaseProtocol {
    private let service: StringCalculatorService

    init(service: StringCalculatorService = StringCalculatorService()) {
        self.service = service
    }

    func execute(with input: String) throws -> Int {
        return try service.add(input)
    }
}
