//
//  InteractionPerformerBuilder.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//

import SwiftUI

enum InteractionPerformerTypes {
    case navigationTitledButton(router: SceneRouter, destination: SceneRoute, title: String)
    
    case navigationBackButton(router: SceneRouter)
    case navigationTitledBackButton(router: SceneRouter, title: String)

    case actionButton(action: ()->Void, label: String)
    case customButton(action: ()->Void, label: ()->AnyView)
}

struct InteractionPerformerBuilder {
    
    @ViewBuilder
    static func makePerformer(of type: InteractionPerformerTypes) -> some View {
        switch type {
        
        case .navigationTitledButton(let router, let destination, let title):
            AnyView(
                Button {
                    router.push(destination)
                } label: {
                    GenericAppButton(label: title)
                }
            )
            
        case .navigationBackButton(let router):
            AnyView(
                Button {
                    router.back()
                } label: {
                    Image(systemName: "chevron.left")
                }
            )
            
        case .navigationTitledBackButton(let router, let title):
            AnyView(
                Button {
                    router.back()
                } label: {
                    GenericAppButton(label: title)
                }
            )
            
        case .actionButton(let action, let label):
            AnyView(
                Button {
                    action()
                } label: {
                    GenericAppButton(label: label)
                }
            )
            
        case .customButton(let action, let label):
            AnyView(
                Button {
                    action()
                } label: {
                    label()
                }
            )
        }
    }
}
