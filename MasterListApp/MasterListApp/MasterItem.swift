//
//  MasterItem.swift
//  MasterListApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import SwiftUI

struct MasterItem: Identifiable, Hashable {
    let id: UUID
    var title: String
    var detail: String
    var isDone: Bool
    
    init(id: UUID = UUID(), title: String, detail: String, isDone: Bool = false) {
        self.id = id
        self.title = title
        self.detail = detail
        self.isDone = isDone
    }
}
