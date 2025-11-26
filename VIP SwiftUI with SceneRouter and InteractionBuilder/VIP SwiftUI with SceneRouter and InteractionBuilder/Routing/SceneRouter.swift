//
//  SceneRouter.swift
//  VIP SwiftUI architecture
//
//  Created by Peter de Vroomen on 23-11-2025.
//

import Foundation
import SwiftUI

@Observable
final class SceneRouter {
    
    var path: [SceneRoute] = []

    func push(_ scene: SceneRoute) {
        
        if scene == .none {
            return
        }
        
        if scene == .back {
            _ = path.popLast()
        }
        else {
            path.append(scene)
        }
    }

    func back() {
        _ = path.popLast()
    }

    func home() {
        path.removeAll()
    }
}

