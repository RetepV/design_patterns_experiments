//
//  GenericToolbar.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 26-11-2025.
//

import Foundation
import SwiftUI

struct GenericToolbarAction: Identifiable {

    let id: UUID = UUID()
    
    let title: String
    let action: ()->Void

    static func == (lhs: GenericToolbarAction, rhs: GenericToolbarAction) -> Bool {
        lhs.id == rhs.id
    }
}

struct GenericToolbar: ToolbarContent {
    
    let router: SceneRouter
    let title: String?
    let trailingActions: [GenericToolbarAction]?
    
    var body: some ToolbarContent {
        if router.path.count > 0 {
            ToolbarItem(placement: .topBarLeading) {
                InteractionPerformerBuilder.makePerformer(of: .navigationBackButton(router: router))
            }
        }
        if let title {
            ToolbarItem(placement: .principal) {
                Text(title)
            }
        }
        if let trailingActions, !trailingActions.isEmpty {
            ToolbarItemGroup(placement: .topBarTrailing) {
                ForEach(trailingActions.indices, id: \.self) { index in
                    InteractionPerformerBuilder.makePerformer(of: .actionButton(action: trailingActions[index].action,
                                                                                label: trailingActions[index].title))
                }
            }
        }
    }
}
