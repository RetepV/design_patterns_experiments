//
//  ThirdViewModel.swift
//  GuessTheFlag
//
//  Created by Peter de Vroomen on 01/07/2024.
//

import Foundation

// Viewmodel for MainView

extension ThirdView {
    
    // MARK: - Protocol
    
    protocol ViewModelProtocol {
        var title: String {get}
        var titleLabel: String {get}
    }
    
    @Observable
    class ViewModel: ViewModelProtocol {
        
        // MARK: - Constants
        
        let title = "ThirdView"
        let titleLabel = "Third View"
    }
}
