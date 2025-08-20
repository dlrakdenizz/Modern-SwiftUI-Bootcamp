//
//  Cards.swift
//  Lesson3
//
//  Created by Dilara Akdeniz on 20.08.2025.
//

import SwiftUI

struct Cards: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 6) {
            Text(String(value))
                .font(.title3).bold()
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 72)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(.separator), lineWidth: 0.5)
        )
    }
}
#Preview {
    Cards(title: "Follow", value: 123)
}
