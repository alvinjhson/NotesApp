//
//  ContentView.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var note : NoteViewModel
    var body: some View {
        NavigationStack{
            VStack {
                List() {
                    ForEach(note.noteEntries) { entry in
                        NavigationLink( destination:NoteEntryView(noteEntry: entry)){
                            rowView(entry: entry)
                        }
                        
                    }
                }
            }
            .navigationTitle("Notes")
            .navigationBarItems( trailing: NavigationLink(destination: NoteEntryView()) {
               Image(systemName: "plus.circle")
            })
        }
    }
}
struct rowView: View {
    
    let entry: NoteInformation
    
    var body: some View {
        HStack {
            Text(entry.note)
                       

        }
    }
}

#Preview {
    ContentView()
}
