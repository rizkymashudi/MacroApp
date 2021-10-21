//
//  MacroAppApp.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 21/10/21.
//

import SwiftUI

@main
struct MacroAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
