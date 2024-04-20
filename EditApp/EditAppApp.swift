//
//  EditAppApp.swift
//  EditApp
//
//  Created by Ron Lane on 4/20/24.
//

import SwiftUI

@main
struct EditAppApp: App {
    @StateObject var viewModel = ContentViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
