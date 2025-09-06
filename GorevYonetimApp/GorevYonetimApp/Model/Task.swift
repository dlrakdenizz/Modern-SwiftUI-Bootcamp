//
//  Task.swift
//  GorevYonetimApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
