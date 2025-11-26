//
//  CheckMenuInteractor.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// CheckMenu scene's interactor

import Foundation

protocol CheckMenuInteractorProtocol {
    func performInteraction(interaction: CheckMenuMessages.Interactions)
}

class CheckMenuInteractor: CheckMenuInteractorProtocol {
    
    var presenter: CheckMenuPresenterProtocol?
    
    func performInteraction(interaction: CheckMenuMessages.Interactions) {
        
        switch interaction {
        case .textUpdated(let text):
            presenter?.performPresentation(presentation: .updateText(text: text))
        }
    }
}
