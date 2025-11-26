//
//  FindTableMessages.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// FindTable scene's messages (Interactions, Presentations and ViewuUpdates).

enum FindTableMessages {
    
    enum Interactions {
        case textUpdated(String)
    }
    
    enum Presentations {
        case updateText(String)
    }
    
    enum ViewUpdates {
        case setText(String)
        case setTextEntry(String)
    }
}
