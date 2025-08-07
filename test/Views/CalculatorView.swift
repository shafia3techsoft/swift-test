//
//  CalculatorView.swift
//  test
//
//  Created by shafia on 05/08/2025.
//

import SwiftUI

struct CalculatorView: View {
    @State private var input1 = ""
    @State private var input2 = ""
    @State private var result: Int?

    var body: some View {
        Form {
            TextField("Enter first number", text: $input1)
                .keyboardType(.numberPad)
            TextField("Enter second number", text: $input2)
                .keyboardType(.numberPad)

            HStack {                
                CircleShadowButton(
                    icon: "plus.circle.fill",
                    iconColor: .white,
                    backgroundColor: Defs.darkPurpleColor,
                    size: 60
                ) {
                    result = add(Int(input1) ?? 0, Int(input2) ?? 0)
                }
                
                CircleShadowButton(
                    icon: "minus.circle.fill",
                    iconColor: .white,
                    backgroundColor: Defs.darkPurpleColor,
                    size: 60
                ) {
                    result = subtract(Int(input1) ?? 0, Int(input2) ?? 0)
                }
                
                CircleShadowButton(
                    icon: "multiply.circle.fill",
                    iconColor: .white,
                    backgroundColor: Defs.darkPurpleColor,
                    size: 60
                ) {
                    result = multiply(Int(input1) ?? 0, Int(input2) ?? 0)
                }
                
                CircleShadowButton(
                    icon: "divide.circle.fill",
                    iconColor: .white,
                    backgroundColor: Defs.darkPurpleColor,
                    size: 60
                ) {
                    result = divide(Int(input1) ?? 0, Int(input2) ?? 0)
                }

            }

            if let result = result {
                Text("Result: \(result)")
                    .font(.headline)
            }
        }
        .navigationTitle("Calculator")
    }

    //@discardableResult
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func subtract(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    
    func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    
    
    func divide(_ a: Int, _ b: Int) -> Int {
        if a != 0 ,b != 0 {
            return a / b
        }
        return 0
    }
}

#Preview {
    CalculatorView()
}
