//
//  DetailView.swift
//  MasterListApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import SwiftUI

struct DetailView: View {
    let item: MasterItem
    let toggleDone: () -> Void
    
    private let sfSymbols: [String] = [
        "bolt.fill", "flame.fill", "leaf.fill", "paperplane.fill", "star.circle.fill",
        "pencil.and.outline", "clock.fill", "heart.circle.fill", "folder.fill", "wand.and.stars.inverse"
    ]
    @State private var symbolName: String = "star"
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: symbolName)
                .font(.system(size: 72, weight: .semibold))
                .padding(.top, 16)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.title2.weight(.semibold))
                Text(item.detail)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Button {
                toggleDone()
            } label: {
                Label(item.isDone ? "Tamamlanmadı olarak işaretle" : "Tamamlandı olarak işaretle",
                      systemImage: item.isDone ? "arrow.uturn.left" : "checkmark.circle")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Detay")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            symbolName = sfSymbols.randomElement() ?? "sparkles"
        }
    }
}


