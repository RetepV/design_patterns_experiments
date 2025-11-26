//
//  CheckMenuPresenter.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// CheckMenu scene's presenter

import Foundation

protocol CheckMenuPresenterProtocol {
    func performPresentation(presentation: CheckMenuMessages.Presentations)
}

class CheckMenuPresenter: CheckMenuPresenterProtocol {
    
    var view: CheckMenuViewProtocol?
    
    func performPresentation(presentation: CheckMenuMessages.Presentations) {
        
        switch presentation {
        case .updateText(text: let text):
            view?.viewUpdate(update: .setText(text: text))
        }
    }
}
