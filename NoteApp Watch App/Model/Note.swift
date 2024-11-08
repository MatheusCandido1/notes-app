//
//  Note.swift
//  NoteApp Watch App
//
//  Created by Matheus Candido on 11/7/24.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
