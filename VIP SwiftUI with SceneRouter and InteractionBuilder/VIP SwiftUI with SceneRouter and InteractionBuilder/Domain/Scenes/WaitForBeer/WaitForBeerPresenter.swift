//
//  WaitForBeerPresenter.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 25-11-2025.
//  
//

// WaitForBeer scene's presenter

import Foundation

protocol WaitForBeerPresenterProtocol {
    func performPresentation(presentation: WaitForBeerMessages.Presentations)
}

class WaitForBeerPresenter: WaitForBeerPresenterProtocol {
    
    var view: WaitForBeerViewProtocol?
    
    func performPresentation(presentation: WaitForBeerMessages.Presentations) {
        
        switch presentation {
        case .updateText(text: let text):
            view?.viewUpdate(update: .setText(text))
            view?.viewUpdate(update: .setTextField(text))
        }
    }
}
