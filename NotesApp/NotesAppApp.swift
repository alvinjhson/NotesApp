//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @StateObject var note = NoteViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(note)
        }
    }
}
