//
//  NoteInformation.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import Foundation

struct NoteInformation: Identifiable,Equatable {
    
    var id: String 
    var note: String
    
    init(id: String, note: String) {
        self.id = id
        self.note = note
    }
    
}
