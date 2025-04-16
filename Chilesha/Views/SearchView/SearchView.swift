//
//  SearchView.swift
//  Chilesha
//
//  Created by shayne song on 4/7/25.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var calculatorView: CalculatorViewModel
    @State private var showNumberPad = false
    @State private var settingsDetent = PresentationDetent.medium
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    @FocusState var searchInputFocused: Bool
    @StateObject var searchViewModel = SearchViewModel()
    
    var body: some View {
        ZStack {
            //            Color.mint.opacity(0.5).ignoresSafeArea()
            VStack(spacing: 5) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField(text: $searchViewModel.searchText, label: {
                        Text("Search by food name")
                    }).focused($searchInputFocused)
                }
                .padding(.horizontal, 30)
                .frame(height: 60)
                .background {
                    RoundedRectangle(cornerRadius: 35)
                        .fill(.background)
                }
                List(FoodData.data) { food in
                    if searchViewModel.searchText.isEmpty || food.name.containsCaseInsensitive(searchViewModel.searchText) {
                        HStack {
                            Text(food.name)
                                .font(.headline)
                            Spacer()
                            Text("\(food.caloriesPer100g, specifier: "%.2f") / 100g")
                                .font(.subheadline)
                        }
                        .withTapEffect {
                            print("\(food.name) tapped")
                            searchViewModel.selectedFood = food
                            showNumberPad = true
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            .padding(.top, 30)
            .background(.gray.opacity(0.15))
            .blur(radius: searchViewModel.showFoodCardView ? 20 : 0)
            .disabled(searchViewModel.showFoodCardView)
            .onAppear() {
                searchInputFocused = true
            }
            .sheet(isPresented: $showNumberPad) {
                
            } content: {
                NumberPadView(searchViewModel: searchViewModel, showNumberPad: $showNumberPad)
                    .presentationDetents(
                        [.medium],
                        selection: $settingsDetent
                    )
            }
            
        }
        
        
    }
}
#Preview {
    var router = NavigationRouter()
    SearchView()
        .environmentObject(CalculatorViewModel())
        .environmentObject(router)
    
}
