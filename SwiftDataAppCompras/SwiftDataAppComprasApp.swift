//
//  SwiftDataAppComprasApp.swift
//  SwiftDataAppCompras
//
//  Created by German David Vertel Narvaez on 24/12/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataAppComprasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ListModel.self)
                
        }
    }
}
