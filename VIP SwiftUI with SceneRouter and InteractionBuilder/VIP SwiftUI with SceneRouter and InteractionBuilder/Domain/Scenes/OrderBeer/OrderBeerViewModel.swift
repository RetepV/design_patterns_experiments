//
//  OrderBeerViewModel.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// OrderBeer scene's view model

import Foundation

@Observable
class OrderBeerViewModel {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
