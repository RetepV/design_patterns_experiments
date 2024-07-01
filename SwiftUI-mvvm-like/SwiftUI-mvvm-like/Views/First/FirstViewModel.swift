//
//  MainViewModel.swift
//  GuessTheFlag
//
//  Created by Peter de Vroomen on 01/07/2024.
//

import Foundation
import SwiftUICore

// Viewmodel for MainView

extension FirstView {
    
    // MARK: - Protocol
    
    protocol ViewModelProtocol {
        var title: String {get}
        var titleLabel: String {get}
        
        var firstPushVCButtonLabel: String {get}
        var secondPushVCButtonLabel: String {get}
        
        func firstPushVCButtonTapped() -> SecondView
        func secondPushVCButtonTapped() -> ThirdView
    }
    
    @Observable
    class ViewModel: ViewModelProtocol {
        
        // MARK: - Constants
        
        let title = "FirstView"
        let titleLabel = "First View"

        let firstPushVCButtonLabel = "Second View"
        let secondPushVCButtonLabel = "Third View"
        
        // MARK: Public
        
        @ViewBuilder
        func firstPushVCButtonTapped() -> SecondView {
            SecondView()
        }
        
        @ViewBuilder
        func secondPushVCButtonTapped() -> ThirdView {
            ThirdView()
        }
    }
}
