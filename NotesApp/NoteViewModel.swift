//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import Foundation
import FirebaseFirestore
class NoteViewModel : ObservableObject {
    @Published var noteEntries = [NoteInformation]()
    
    init(){
        
        setupSnapshotListener()
      
        
        
    }

    func update(entry: NoteInformation, with note: String) {
        let db = Firestore.firestore()
        db.collection("notes").document(entry.id).updateData([
            "note": note
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    func setupSnapshotListener() {
            let db = Firestore.firestore()
            db.collection("notes").addSnapshotListener { [weak self] (querySnapshot, error) in
                guard let self = self else { return }
                if let error = error {
                    print("Error listening for document changes: \(error)")
                    return
                }

                self.noteEntries.removeAll()
                for document in querySnapshot!.documents {
                    let note = document.data()["note"] as? String ?? ""
                    let id = document.documentID
                    self.noteEntries.append(NoteInformation(id: id, note: note))
                }
            }
        }
    
    

   
}
