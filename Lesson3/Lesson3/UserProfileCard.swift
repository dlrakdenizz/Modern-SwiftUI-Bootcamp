//
//  UserProfileCard.swift
//  Lesson3
//
//  Created by Dilara Akdeniz on 20.08.2025.
//

import SwiftUI

struct UserProfileCard: View {
    
    @State private var follower : Int = 100
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // Header
                
                ZStack {
                    LinearGradient(
                        colors: [.purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(radius: 8)
                    
                    VStack(spacing: 10) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                            .shadow(radius: 5)
                        
                        Text("Dilara Akdeniz")
                            .font(.title).bold()
                            .foregroundStyle(Color.white)
                        
                        Text("Computer Engineer | iOS Developer")
                            .font(.subheadline)
                            .foregroundStyle(Color.white)
                    }
                    .padding(.top, 12)
                }
                .padding(.horizontal)
                
                //Info Cards
                
                HStack(spacing: 12) {
                    Cards(title: "Follow", value: 1234)
                    Cards(title: "Follower", value: follower)
                    Cards(title: "Like", value: 3445)
                }
                .padding(.horizontal)
                
                //About Me
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("About Me")
                        .font(.headline).bold()
                    
                    Text("""
        I am Dilara Akdeniz, born on July 1, 2001, in Istanbul. I graduated in June 2025 as the third-ranked student from the Computer Engineering department at Manisa Celal Bayar University. I have a deep passion for mobile application development, with a particular focus on iOS applications. I am proficient in Swift and SwiftUI and have experience working with various iOS-specific technologies, including UIKit, Combine, Core Data, and Core Animation. Additionally, I am skilled in integrating backend services through GraphQL and REST APIs, and implementing subscription systems using tools like RevenueCat and Adapty. I am committed to continuously improving my knowledge of iOS development and staying updated with the latest trends in the field.
        """)
                    .font(.body)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                //Buttons
                
                HStack(spacing: 12) {
                    Button {
                        if let url = URL(string: "https://dilaraakdenizpersonalweb.web.app") {
                            openURL(url)
                        }
                    } label: {
                        Text("Send Message")
                            .frame(maxWidth: .infinity, minHeight: 44)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                        follower += 1
                    } label: {
                        Text("Follow")
                            .frame(maxWidth: .infinity, minHeight: 44)
                    }
                    .buttonStyle(.bordered)
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
            }
            .padding(.top, 12)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    UserProfileCard()
}
