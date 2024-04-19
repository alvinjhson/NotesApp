//
//  NoteInformation.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import Foundation

struct NoteInformation: Identifiable,Equatable {
    
    var id = UUID()
    
    var note: String
    
    init(note: String){
        self.note = note
    }
    
}
