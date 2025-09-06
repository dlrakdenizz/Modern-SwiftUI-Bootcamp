//
//  TaskListView.swift
//  GorevYonetimApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var vm = TaskViewModel()
    @State private var newTitle: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Yeni görev alanı
                HStack {
                    TextField("Yeni görev...", text: $newTitle, prompt: Text("Yeni görev..."))
                        .textFieldStyle(.roundedBorder)
                        .onSubmit { add() }
                    Button {
                        add()
                    } label: {
                        Label("Ekle", systemImage: "plus.circle.fill")
                    }
                    .disabled(newTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()
                
                // Liste
                List {
                    Section("Aktif") {
                        ForEach(vm.activeTasks) { task in
                            TaskRow(task: task) {
                                vm.toggle(task)
                            }
                        }
                        .onDelete { vm.delete(at: $0, inCompletedSection: false) }
                    }
                    
                    Section("Tamamlananlar") {
                        ForEach(vm.completedTasks) { task in
                            TaskRow(task: task) {
                                vm.toggle(task)
                            }
                        }
                        .onDelete { vm.delete(at: $0, inCompletedSection: true) }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Görevler")
        }
    }
    
    private func add() {
        vm.addTask(title: newTitle)
        newTitle = ""
    }
}

#Preview {
    TaskListView()
}
