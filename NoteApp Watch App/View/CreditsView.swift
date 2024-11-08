//
//  CreditsView.swift
//  NoteApp Watch App
//
//  Created by Matheus Candido on 11/7/24.
//

import SwiftUI

struct CreditsView: View {
    
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    var body: some View {
        VStack(spacing: 3) {
            // Profile Image
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // Header
            HeaderView(title: "Credits")
            
            // Content
            Text("Matheus Carvalho")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Full Stack Developer")
                .foregroundColor(.secondary)
                .fontWeight(.light)
                .font(.system(size: 12))

        } //: VStack
    }
}

#Preview {
    CreditsView()
}
