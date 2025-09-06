//
//  AddItemSheet.swift
//  MasterListApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import SwiftUI

struct AddItemSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var detail: String = ""
    var onSave: (String, String) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Başlık") {
                    TextField("Yeni görev", text: $title)
                        .textInputAutocapitalization(.sentences)
                }
                Section("Açıklama") {
                    TextField("Açıklama", text: $detail, axis: .vertical)
                        .lineLimit(3, reservesSpace: true)
                }
            }
            .navigationTitle("Yeni Öğe")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Kapat") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        onSave(title.trimmingCharacters(in: .whitespacesAndNewlines),
                               detail.trimmingCharacters(in: .whitespacesAndNewlines))
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}

