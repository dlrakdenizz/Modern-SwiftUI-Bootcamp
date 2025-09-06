//
//  MasterListViewModel.swift
//  MasterListApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import SwiftUI

final class MasterListViewModel: ObservableObject {
    @Published var items: [MasterItem] = []
    
    init() {
        items = [
            MasterItem(title: "Başlık 1", detail: "Açıklama 1"),
            MasterItem(title: "Başlık 2", detail: "Açıklama 2"),
            MasterItem(title: "Başlık 3", detail: "Açıklama 3"),
            MasterItem(title: "Başlık 4", detail: "Açıklama 4"),
            MasterItem(title: "Başlık 5", detail: "Açıklama 5"),
            MasterItem(title: "Başlık 6", detail: "Açıklama 6"),
            MasterItem(title: "Başlık 7", detail: "Açıklama 7"),
            MasterItem(title: "Başlık 8", detail: "Açıklama 8"),
            MasterItem(title: "Başlık 9", detail: "Açıklama 9"),
            MasterItem(title: "Başlık 10", detail: "Açıklama 10")
        ]
    }
    
    var pendingItems: [MasterItem] { items.filter { !$0.isDone } }
    var doneItems: [MasterItem] { items.filter { $0.isDone } }
    
    func addItem(title: String, detail: String) {
        let item = MasterItem(title: title, detail: detail, isDone: false)
        items.insert(item, at: 0)
    }
    
    func toggleDone(_ item: MasterItem) {
        guard let idx = items.firstIndex(of: item) else { return }
        items[idx].isDone.toggle()
    }
    
    func delete(at offsets: IndexSet, inDoneSection: Bool) {
        let source = inDoneSection ? doneItems : pendingItems
        let idsToDelete = offsets.map { source[$0].id }
        items.removeAll { idsToDelete.contains($0.id) }
    }
    
    func delete(_ item: MasterItem) {
        items.removeAll { $0.id == item.id }
    }
}
