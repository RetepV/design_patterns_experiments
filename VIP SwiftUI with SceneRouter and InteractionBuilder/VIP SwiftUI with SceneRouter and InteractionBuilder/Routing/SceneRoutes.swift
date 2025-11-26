//
//  SceneRoutes.swift
//  VIP SwiftUI architecture
//
//  Created by Peter de Vroomen on 23-11-2025.
//

import Foundation
import SwiftUI

enum SceneRoute: Hashable {
    case none               // Special case, does nothing. Can make for easier to read or more efficient code.
    case back               // Special case, goes back in navigation stack. Can make for easier to read or more efficient code.
    
    case main               // Special case, signifies the main view to start the application with.
    
    case findTable
    case checkMenu
    case orderBeer
    case waitForBeer
}

extension SceneRoute: View {
    
    var body: some View {
        switch self {
        case .none, .back:
            fatalError("These cases should never create a view. Check SceneRouter as to why this is happening.")
        case .main, .findTable:
            FindTableView().configure()
        case .checkMenu:
            CheckMenuView().configure()
        case .orderBeer:
            OrderBeerView().configure()
        case .waitForBeer:
            WaitForBeerView().configure()
        }
    }
}
