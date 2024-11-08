//
//  ContentView.swift
//  NoteApp Watch App
//
//  Created by Matheus Candido on 11/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    @AppStorage("lineCount") var lineCount: Int = 1
    
    func getDocDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func deleteNote(offsets: IndexSet) {
        withAnimation{
            notes.remove(atOffsets: offsets)
            saveNote()
        }
    }
    
    func saveNote() {
        do {
            let data = try JSONEncoder().encode(notes)
            
            let url = getDocDirectory().appendingPathComponent("notes")
            
            try data.write(to: url)
            
        } catch {
            print("Could not save note.")
        }
    }
    
    func loadNotes() {
        DispatchQueue.main.async {
            do {
                let url = getDocDirectory().appendingPathComponent("notes")
                    
                let data = try Data(contentsOf: url)
                    
                notes = try JSONDecoder().decode([Note].self, from: data)
                    
            } catch {
                    
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    Button {
                        guard text.isEmpty == false else { return }
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        saveNote()
                    }  label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                } //: HStack
                .padding(.top, 12)
                
                Spacer()
                
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i )) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .font(.headline)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            } //: HStack
                        } //: Loop
                        .onDelete(perform: deleteNote)
                    }
                    .padding(.top, 12)
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(12)
                    Spacer()
                } //: List
            } //: VStack
            .navigationTitle("Notes")
            .onAppear(perform: {
                loadNotes()
            })
        }
    }
}

#Preview {
    ContentView()
}
