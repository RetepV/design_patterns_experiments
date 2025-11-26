//
//  OrderBeerMessages.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// OrderBeer scene's messages (Interactions, Presentations and ViewuUpdates).

enum OrderBeerMessages {
    
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
