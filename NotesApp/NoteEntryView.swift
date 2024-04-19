//
//  NoteEntryView.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct NoteEntryView: View {
    
    var noteEntry : NoteInformation?
    @EnvironmentObject var notes : NoteViewModel
    
    @State var note : String = ""
    @State var id : String = ""
  
    
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

    private func saveEntry() {
        if let noteEntry = noteEntry{
            
            notes.update(entry: noteEntry, with: note)
            //notes.update(entry: noteEntry , with: note)
            
        }else
        {
            addNewEntry()
        }
        
        
     
        
    }
    private func addNewEntry() {
        print("addNewEntry called")
        let db = Firestore.firestore()

        // Anta att 'note' är en sträng som representerar noteringen du vill spara
        var ref: DocumentReference? = nil
        ref = db.collection("notes").addDocument(data: [
            "note": note
        ]) {  err in
            if let err = err {
                print("Error adding document: \(err)")
            } else if let ref = ref {
                print("Document added with ID: \(ref.documentID)")
                let newEntry = NoteInformation(id: ref.documentID, note: note)
              
            }
        }
    }


    
    
    
    
}
