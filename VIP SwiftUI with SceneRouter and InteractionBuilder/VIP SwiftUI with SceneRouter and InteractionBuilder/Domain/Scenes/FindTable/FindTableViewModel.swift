//
//  FindTableViewModel.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// FindTable scene's view model

import Foundation

@Observable
class FindTableViewModel {
    
    var text: String
    var newText: String = ""
    
    init(text: String) {
        self.text = text
    }
}
