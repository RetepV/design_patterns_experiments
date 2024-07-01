//
//  SecondViewModel.swift
//  GuessTheFlag
//
//  Created by Peter de Vroomen on 01/07/2024.
//

import Foundation

// Viewmodel for MainView

extension SecondView {
    
    // MARK: - Protocol
    
    protocol ViewModelProtocol {
        var title: String {get}
        var titleLabel: String {get}
        
        var firstPushVCButtonLabel: String {get}
        
        func firstPushVCButtonTapped() -> ThirdView
    }
    
    @Observable
    class ViewModel: ViewModelProtocol {
        
        // MARK: - Constants
        
        let title = "SecondView"
        let titleLabel = "Second View"

        let firstPushVCButtonLabel = "Third View"
        
        func firstPushVCButtonTapped() -> ThirdView {
            ThirdView()
        }
    }
}
