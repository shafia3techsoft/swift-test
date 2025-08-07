//
//  ContentView.swift
//  test
//
//  Created by shafia on 04/08/2025.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink("Calculator", destination: CalculatorView())
//                NavigationLink("To-Do List", destination: TodoListView())
//                NavigationLink("Notes", destination: NotesView())
//                NavigationLink("Expression Evaluator", destination: ExpressionEvaluatorView())
//                NavigationLink("Settings", destination: SettingsView())
//            }
//            .navigationTitle("SwiftMaster")
//        }
//    }
//}


struct ContentView: View {
    @State private var selectedTab = 0
    
    let tabItems = [
        ("apps.ipad", "Calculator"),
        ("checklist", "To-Do List"),
        ("pencil.and.scribble", "Notes"),
        ("plus.forwardslash.minus", "Evaluator"),
        ("circle.grid.3x3.circle.fill", "Settings")
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            // Main content based on tab will appear hre
            var title = tabItems[selectedTab].1
            
            if title == "Calculator" {
                CalculatorView()
            }
            else if title == "To-Do List" {
                TodoListView()
            }
            else if title == "Notes" {
                NotesView()
            }
            else if title == "Evaluator" {
                ExpressionEvaluatorView()
            }
            else if title == "Settings" {
                SettingsView()
            }
            
            Spacer()
            
            LiquidTabBar(selected: $selectedTab, tabs: tabItems)
                .padding(.bottom, 20)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    ContentView()
}
