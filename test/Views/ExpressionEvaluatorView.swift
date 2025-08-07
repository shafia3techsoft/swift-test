//
//  ExpressionEvaluatorView.swift
//  test
//
//  Created by shafia on 05/08/2025.
//

import SwiftUI

indirect enum Expression {
    case number(Int)
    case add(Expression, Expression)
    case multiply(Expression, Expression)

    func evaluate() -> Int {
        switch self {
        case .number(let value): return value
        case .add(let lhs, let rhs): return lhs.evaluate() + rhs.evaluate()
        case .multiply(let lhs, let rhs): return lhs.evaluate() * rhs.evaluate()
        }
    }
}

struct ExpressionEvaluatorView: View {
    let expr = Expression.add(.number(2), .multiply(.number(3), .number(4)))

    var body: some View {
        VStack {
            Text("Expression: 2 + 3 × 4")
            Text("Result: \(expr.evaluate())")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Expression Evaluator")
    }
}

#Preview {
    ExpressionEvaluatorView()
}
