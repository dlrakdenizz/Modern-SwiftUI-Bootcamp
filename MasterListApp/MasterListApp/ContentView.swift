//
//  ContentView.swift
//  MasterListApp
//
//  Created by Dilara Akdeniz on 6.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MasterListViewModel()
    @State private var showAddSheet = false
    @State private var useAlternateView = false
    @State private var themeTint: Color = .accentColor
    
    private let themeOptions: [Color] = [.blue, .green, .orange, .purple, .pink, .teal, .indigo, .mint, .red, .brown]
    
    var body: some View {
        NavigationStack {
            Group {
                if useAlternateView {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            sectionView(title: "Tamamlanacaklar", items: vm.pendingItems, alternate: true)
                            sectionView(title: "Tamamlananlar", items: vm.doneItems, alternate: true)
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                } else {
                    List {
                        Section("Tamamlanacaklar") {
                            ForEach(vm.pendingItems) { item in
                                NavigationLink(value: item) { row(item) }
                                    .listRowSeparator(.visible)
                            }
                            .onDelete { idx in vm.delete(at: idx, inDoneSection: false) }
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                } label: {
                                    Label("Sil", systemImage: "trash")
                                }
                            }
                        }
                        
                        Section("Tamamlananlar") {
                            ForEach(vm.doneItems) { item in
                                NavigationLink(value: item) { row(item) }
                                    .listRowSeparator(.visible)
                            }
                            .onDelete { idx in vm.delete(at: idx, inDoneSection: true) }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("MasterListApp")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Toggle(isOn: $useAlternateView) {
                        Text("Alternatif")
                    }
                    .toggleStyle(.switch)
                    .accessibilityLabel("Alternatif Görünüm")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Label("Yeni Ekle", systemImage: "plus.circle.fill")
                    }
                }
            }
            .tint(themeTint)
            .background(themeTint.opacity(0.06))
            .navigationDestination(for: MasterItem.self) { item in
                DetailView(item: item, toggleDone: { vm.toggleDone(item) })
            }
            .sheet(isPresented: $showAddSheet) {
                AddItemSheet { title, detail in
                    vm.addItem(title: title, detail: detail)
                }
                .presentationDetents([.medium, .large])
            }
            .onAppear {
                if let random = themeOptions.randomElement() {
                    themeTint = random
                }
            }
        }
    }
    
    @ViewBuilder
    private func row(_ item: MasterItem) -> some View {
        HStack(spacing: 12) {
            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                .imageScale(.large)
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                Text(item.detail)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            Spacer()
            if item.isDone {
                Text("Bitti")
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.thinMaterial, in: Capsule())
            }
        }
        .contentShape(Rectangle())
        .contextMenu {
            Button(item.isDone ? "Tamamlanmadı olarak işaretle" : "Tamamlandı olarak işaretle") {
            }
            Button(role: .destructive) {

            } label: {
                Text("Sil")
            }
        }
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    private func sectionView(title: String, items: [MasterItem], alternate: Bool) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3.weight(.semibold))
                .padding(.horizontal, 4)
            LazyVStack(spacing: 8) {
                ForEach(items) { item in
                    NavigationLink(value: item) {
                        HStack {
                            row(item)
                        }
                        .padding(12)
                        .background(.background, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .shadow(radius: 0.5, y: 0.5)
                    }
    
                    .overlay(alignment: .trailing) {
                        HStack(spacing: 8) {
                            Button {
                                if let idx = vm.items.firstIndex(of: item) {
                                    vm.items[idx].isDone.toggle()
                                }
                            } label: {
                                Image(systemName: item.isDone ? "arrow.uturn.left.circle.fill" : "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .padding(8)
                            }
                            Button(role: .destructive) {
                                vm.delete(item)
                            } label: {
                                Image(systemName: "trash.fill")
                                    .imageScale(.large)
                                    .padding(8)
                            }
                        }
                        .padding(.trailing, 6)
                    }
                }
                if items.isEmpty {
                    Text("Bu bölüm boş.")
                        .foregroundStyle(.secondary)
                        .padding(.vertical, 8)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
