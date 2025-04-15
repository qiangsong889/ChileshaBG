//
//  FoodGramInputView.swift
//  Chilesha
//
//  Created by shayne song on 4/10/25.
//


import SwiftUI

struct CustomNumericKeyboard: View {
    @Binding var text: String
    var maxDigits: Int = 10
    var allowDecimal: Bool = true
    var onSubmit: (() -> Void)? = nil
    var buttonText: String = "Add"
    
    private let rows = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [".", "0", "⌫"]
    ]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { key in
                        KeyButton(key: key) {
                            handleKeyPress(key)
                        }
                    }
                }
            }
            
            if let onSubmit = onSubmit {
                Button(action: onSubmit) {
                    Text(buttonText)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    private func handleKeyPress(_ key: String) {
        switch key {
        case "⌫":
            if !text.isEmpty {
                text.removeLast()
            }
        case ".":
            if !text.contains("."), !text.isEmpty {
                text += key
            }
        default:
            if text.count < maxDigits {
                text += key
            }
        }
    }
}

struct KeyButton: View {
    let key: String
    let actions: () -> Void
    
    var body: some View {
        Button(action: actions) {
            if key == "⌫" {
                Image(systemName: "delete.left")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
            } else if !key.isEmpty {
                Text(key)
                    .font(.title2)
                    .frame(maxWidth: .infinity)
            } else {
                Color.clear
            }
        }
        .frame(maxWidth: .infinity, minHeight: 50)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .controlSize(.extraLarge)
        .disabled(key.isEmpty)
    }
}

// Usage Example
struct NumberPadView: View {
    var searchViewModel: SearchViewModel?
    @Binding var showNumberPad: Bool
    @EnvironmentObject var calculatorView: CalculatorViewModel
    @State private var amount = ""
    var type: NumberPadType = .Add
    enum NumberPadType {
        case Add, Update
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(amount)
                    .frame(width: 150)
                    .font(.system(size: 36, weight: .bold, design: .monospaced))
                Text("g")
                    .font(.system(size: 36, weight: .bold, design: .monospaced))
            }
            
            CustomNumericKeyboard(text: $amount, maxDigits: 6, onSubmit: {
                switch type {
                case .Add:
                    calculatorView.add(food: searchViewModel!.selectedFood!, gram: Double(amount)!)
                    showNumberPad = false
                case .Update:
                    calculatorView.update(gram: Double(amount)!)
                    showNumberPad = false
                }
            }, buttonText: type == .Update ? "Update" : "Add")
            
            Spacer()
        }
        .onAppear {
            if type == .Update {
//                amount = String(calculatorView.selectedMealFood.gram)
            }
        }

    }
}

#Preview {
    NumberPadView(showNumberPad: .constant(true), type: .Update)
}
