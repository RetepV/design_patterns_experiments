//
//  WaitForBeerInteractor.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 25-11-2025.
//  
//

// WaitForBeer scene's interactor

import Foundation

protocol WaitForBeerInteractorProtocol {
    func performInteraction(interaction: WaitForBeerMessages.Interactions)
}

class WaitForBeerInteractor: WaitForBeerInteractorProtocol {
    
    var presenter: WaitForBeerPresenterProtocol?
    
    func performInteraction(interaction: WaitForBeerMessages.Interactions) {
        
        switch interaction {
        case .textUpdated(let text):
            presenter?.performPresentation(presentation: .updateText(text))
        }
    }
}
