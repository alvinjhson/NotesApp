//
//  NoteEntryView.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import Foundation
import SwiftUI

struct NoteEntryView: View {
    
    var noteEntry : NoteInformation?
    @EnvironmentObject var notes : NoteViewModel
    
    @State var note : String = ""
  
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
          
            HStack{
                Text("Note:")
                TextEditor(text: $note)
                    .frame(height: 35)
            }
        }
        .onAppear(perform: setContent)
        .navigationBarItems(trailing: Button("save"){
            saveEntry()
            presentationMode.wrappedValue.dismiss()
            
        })
      
    }
  
    private func setContent() {
        if let noteEntry = noteEntry {
            note = noteEntry.note
           
        }
    }
//    private func setEmail() {
//        if let userEntry = userEntry {
//            email = userEntry.email
//        }
//    }
//
    private func saveEntry() {
        if let noteEntry = noteEntry{
            
            notes.update(entry: noteEntry, with: note)
            //notes.update(entry: noteEntry , with: note)
            
        }else
        {
            let newEntry = NoteInformation(note:note)
            notes.noteEntries.append(newEntry)
        }
        
        
    }
    
    
    
}
