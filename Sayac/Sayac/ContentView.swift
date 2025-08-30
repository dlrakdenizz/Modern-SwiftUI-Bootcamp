//
//  ContentView.swift
//  Sayac
//
//  Created by Dilara Akdeniz on 30.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0

       var body: some View {
           VStack(spacing: 24) {
               Text("\(count)")
                   .font(.system(size: 72, weight: .bold, design: .rounded))
                   .monospacedDigit()

               HStack(spacing: 16) {
                   Button {
                       if count > 0 {           
                           withAnimation(.spring) { count -= 1 }
                       }
                   } label: {
                       Image(systemName: "minus")
                           .font(.title)
                           .frame(width: 64, height: 64)
                   }
                   .buttonStyle(.bordered)
                   .disabled(count == 0)

                   Button {
                       withAnimation(.spring) { count += 1 }
                   } label: {
                       Image(systemName: "plus")
                           .font(.title)
                           .frame(width: 64, height: 64)
                   }
                   .buttonStyle(.borderedProminent)
               }

               Button("Sıfırla") {
                   withAnimation(.easeInOut) { count = 0 }
               }
               .disabled(count == 0)
           }
           .padding()
       }
   }


#Preview {
    ContentView()
}
