//
//  StringCalculatorViewModel.swift
//  StringCalculator
//
//  Created by Vraj on 10/07/25.
//


import Foundation

final class StringCalculatorViewModel: ObservableObject {
    @Published var input: String = ""
    @Published var result: String? = ""
    @Published var errorMessage: String?


    private let useCase: CalculateStringSumUseCaseProtocol

    init(useCase: CalculateStringSumUseCaseProtocol = CalculateStringSumUseCase()) {
        self.useCase = useCase
    }

    func calculate() {
        do {
            let value = try useCase.execute(with: input)
            result = "\(StringConstant.result) \(value)"
            errorMessage = nil
        } catch let error as CalculatorError {
            result = nil
            errorMessage = error.localizedDescription
        } catch {
            result = nil
            errorMessage = StringConstant.unexpectedError
        }
    }
}
