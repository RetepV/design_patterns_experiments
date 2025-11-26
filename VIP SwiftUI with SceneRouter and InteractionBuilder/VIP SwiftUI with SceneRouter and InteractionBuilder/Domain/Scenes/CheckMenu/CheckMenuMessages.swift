//
//  CheckMenuMessages.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// CheckMenu scene's messages (Interactions, Presentations and ViewuUpdates).

enum CheckMenuMessages {
    
    enum Interactions {
        case textUpdated(text: String)
    }
    
    enum Presentations {
        case updateText(text: String)
    }
    
    enum ViewUpdates {
        case setText(text: String)
    }
}
