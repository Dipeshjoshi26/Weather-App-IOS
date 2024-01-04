//
//  SwiftUI_WeatherApp.swift
//  SwiftUI-Weather
//
//  Created by Dipesh raj joshi on 02/01/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_WeatherApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
