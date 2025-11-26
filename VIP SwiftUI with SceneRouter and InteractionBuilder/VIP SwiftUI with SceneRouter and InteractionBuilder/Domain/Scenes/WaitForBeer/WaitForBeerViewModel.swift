//
//  WaitForBeerViewModel.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 25-11-2025.
//  
//

// WaitForBeer scene's view model

import Foundation

@Observable
class WaitForBeerViewModel {
    
    var text: String
    var textFieldText: String = ""
    
    init(text: String) {
        self.text = text
    }
}
