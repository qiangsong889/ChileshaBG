//
//  FoodCellView.swift
//  Chilesha
//
//  Created by shayne song on 4/7/25.
//

import SwiftUI

struct PressActions: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 3)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}


struct FoodGridCell: View {
    let food: Food
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack {
                Image(food.imageName)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(food.name)
                    .fontWeight(.semibold)
                    .padding(4)
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 10)
//        .withTapEffect {
//            print("Tapped!")
//        }
//        .overlay(Button {
//        } label: {
//            SelectIndicator()
//        }, alignment: .topTrailing)
    }
}


#Preview {
    FoodGridCell(food: FoodData.data[0])
}
