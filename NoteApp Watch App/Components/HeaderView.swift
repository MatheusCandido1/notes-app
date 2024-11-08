//
//  HeaderView.swift
//  NoteApp Watch App
//
//  Created by Matheus Candido on 11/7/24.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String = ""
    
    var body: some View {
        // Header
        VStack {
            // Title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
            }
            // Separator
            
            
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
                
            } //: HStack
            .foregroundColor(.accentColor)
        } //: VStack
    }
}

#Preview {
    HeaderView(title: "Credits")
    
}

#Preview {
    HeaderView()
}
