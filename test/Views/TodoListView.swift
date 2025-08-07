//
//  TodoListView.swift
//  test
//
//  Created by shafia on 05/08/2025.
//

import SwiftUI
struct TodoItem: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isDone: Bool = false
}

struct TodoListView: View {
    @AppStorage("todos") private var data: Data = Data()
    @State private var todos: [TodoItem] = []
    @State private var newTodo = ""

    var body: some View {
        VStack {
            HStack {
                TextField("New Task", text: $newTodo)
                Button("Add") {
                    let item = TodoItem(title: newTodo)
                    todos.append(item)
                    saveTodos()
                    newTodo = ""
                }
            }.padding()

            List {
                ForEach(todos) { todo in
                    HStack {
                        Text(todo.title)
                        Spacer()
                        if todo.isDone {
                            Text("✅")
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
                            todos[index].isDone.toggle()
                            saveTodos()
                        }
                    }
                }
                .onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                    saveTodos()
                }
            }
        }
        .onAppear(perform: loadTodos)
        .navigationTitle("To-Do List")
    }

    func saveTodos() {
        if let encoded = try? JSONEncoder().encode(todos) {
            data = encoded
        }
    }

    func loadTodos() {
        if let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) {
            todos = decoded
        }
    }
}

#Preview {
    TodoListView()
}
