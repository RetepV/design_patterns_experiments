//
//  WaitForBeerMessages.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 25-11-2025.
//  
//

// WaitForBeer scene's messages (Interactions, Presentations and ViewuUpdates).

enum WaitForBeerMessages {
    
    enum Interactions {
        case textUpdated(String)
    }
    
    enum Presentations {
        case updateText(String)
    }
    
    enum ViewUpdates {
        case setText(String)
        case setTextField(String)
    }
}
