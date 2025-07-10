//
//  StringCalculatorView.swift
//  StringCalculator
//
//  Created by Vraj on 10/07/25.
//

import SwiftUI

struct StringCalculatorView: View {
    @StateObject private var viewModel = StringCalculatorViewModel()
    
    var body: some View {
        ZStack {
            ColorConstant.customBgColor
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text(StringConstant.screenTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(StringConstant.placeholder)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    
                    TextEditor(text: $viewModel.input)
                        .frame(height: 350)
                        .padding(10)
                        .background(ColorConstant.inputFieldBg)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2))
                        )
                    
                    Button(action: {
                        viewModel.calculate()
                    }) {
                        Text(StringConstant.calculateBtnTitle)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(ColorConstant.buttonBlue)
                            .cornerRadius(10)
                    }
                    
                    if let result = viewModel.result {
                        Text(result)
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.title2)
                            
                    }
                }
                .padding()
                .background(ColorConstant.cardBgColor)
                .cornerRadius(20)
                .padding(.horizontal)
                Spacer()
            }
            .padding(.top)
        }
    }
}


#Preview {
    StringCalculatorView()
}
