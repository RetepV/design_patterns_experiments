//
//  OrderBeerPresenter.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// OrderBeer scene's presenter

import Foundation

protocol OrderBeerPresenterProtocol {
    func performPresentation(presentation: OrderBeerMessages.Presentations)
}

class OrderBeerPresenter: OrderBeerPresenterProtocol {
    
    var view: OrderBeerViewProtocol?
    
    func performPresentation(presentation: OrderBeerMessages.Presentations) {
        
        switch presentation {
        case .updateText(text: let text):
            view?.viewUpdate(update: .setText(text: text))
        }
    }
}
