//
//  SettingsView.swift
//  NoteApp Watch App
//
//  Created by Matheus Candido on 11/7/24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCount") var lineCount: Int = 1
    
    @State private var value : Float = 1.0
    
    func updateLineCount() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            // Header
            HeaderView(title: "Settings")
            // Current Lines
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // Slider
            Slider(value: Binding(
                get: {
                    self.value
                },
                set: { (newValue) in
                    self.value = newValue
                    self.updateLineCount()
                }
            ), in: 1...4, step: 1)
            .accentColor(.accentColor)
            .onAppear {
                self.value = Float(lineCount)
            }
        } //: VStack
    }
}

#Preview {
    SettingsView()
}
