//
//  OrderBeerInteractor.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// OrderBeer scene's interactor

import Foundation

protocol OrderBeerInteractorProtocol {
    func performInteraction(interaction: OrderBeerMessages.Interactions)
}

class OrderBeerInteractor: OrderBeerInteractorProtocol {
    
    var presenter: OrderBeerPresenterProtocol?
    
    func performInteraction(interaction: OrderBeerMessages.Interactions) {
        
        switch interaction {
        case .textUpdated(let text):
            presenter?.performPresentation(presentation: .updateText(text: text))
        }
    }
}
