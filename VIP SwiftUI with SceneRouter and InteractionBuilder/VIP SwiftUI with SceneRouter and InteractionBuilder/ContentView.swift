//
//  ContentView.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//

import SwiftUI

struct ContentView: View {

    @State
    private var sceneRouter: SceneRouter = .init()
    
    var body: some View {
        NavigationStack(path: $sceneRouter.path) {
            SceneRoute.main
                .navigationDestination(for: SceneRoute.self) { destination in
                    destination
                }
        }
        .environment(sceneRouter)
    }
}

#Preview {
    ContentView()
}
