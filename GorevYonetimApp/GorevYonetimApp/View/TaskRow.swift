//
//  TaskRow.swift
//  GorevYonetimApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .imageScale(.large)
                    .padding(.trailing, 4)
            }
            .buttonStyle(.plain)
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .strikethrough(task.isCompleted, pattern: .solid, color: .secondary)
                    .foregroundStyle(task.isCompleted ? .secondary : .primary)
            }
            Spacer()
            
        }
        .contentShape(Rectangle())
    }
}

