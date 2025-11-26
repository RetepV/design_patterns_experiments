//
//  FindTablePresenter.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// FindTable scene's presenter

import Foundation

protocol FindTablePresenterProtocol {
    func performPresentation(presentation: FindTableMessages.Presentations)
}

class FindTablePresenter: FindTablePresenterProtocol {
    
    var view: FindTableViewProtocol?
    
    func performPresentation(presentation: FindTableMessages.Presentations) {
        
        switch presentation {
        case .updateText(text: let text):
            view?.viewUpdate(update: .setText(text))
            view?.viewUpdate(update: .setTextEntry(""))
        }
    }
}
