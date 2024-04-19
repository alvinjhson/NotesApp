//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Alvin Johansson on 2024-04-18.
//

import SwiftUI
import Firebase

@main
struct NotesAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject var note = NoteViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(note)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Configured FIrebase!")

    return true
  }
}
