//
//  SliderSwiftUIAppApp.swift
//  SliderSwiftUIApp
//
//  Created by Никита  on 04.06.2021.
//

import SwiftUI

@main
struct SliderSwiftUIAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
