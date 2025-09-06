//
//  TaskViewModel.swift
//  GorevYonetimApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import Foundation

final class TaskViewModel: ObservableObject {
    @Published private(set) var tasks: [Task] = [
        Task(title: "Görev 1"),
        Task(title: "Görev 2"),
        Task(title: "Görev 3"),
        Task(title: "Görev 4"),
        Task(title: "Görev 5"),
        Task(title: "Görev 6")
    ]
    
    var activeTasks: [Task] { tasks.filter { !$0.isCompleted } }
    var completedTasks: [Task] { tasks.filter { $0.isCompleted } }
    
    func addTask(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        tasks.insert(Task(title: trimmed), at: 0)
    }
    
    func toggle(_ task: Task) {
        guard let idx = tasks.firstIndex(of: task) else { return }
        tasks[idx].isCompleted.toggle()
    }
    
    func delete(at offsets: IndexSet, inCompletedSection: Bool) {
        let source = inCompletedSection ? completedTasks : activeTasks
        let ids = offsets.map { source[$0].id }
        tasks.removeAll { ids.contains($0.id) }
    }
}
