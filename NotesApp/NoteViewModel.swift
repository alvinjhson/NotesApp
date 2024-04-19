//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import Foundation
class NoteViewModel : ObservableObject {
    @Published var noteEntries = [NoteInformation]()
    
    init(){
        addMockData()
        
    }
    
    func addMockData() {
        
        noteEntries.append(NoteInformation(note:"Hejsan"))
        noteEntries.append(NoteInformation(note:"Nej varför då"))
        noteEntries.append(NoteInformation(note:"Okej men hur??"))
        
        
      
        
    }
    
    func update(entry : NoteInformation, with note: String) {
        if let index = noteEntries.firstIndex(of: entry){
            noteEntries[index].note = note
            
        }
        
    }
}
