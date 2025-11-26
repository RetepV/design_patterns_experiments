//
//  FindTableInteractor.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// FindTable scene's interactor

import Foundation
import SwiftUI

protocol FindTableInteractorProtocol {
    func performInteraction(interaction: FindTableMessages.Interactions)
}

class FindTableInteractor: FindTableInteractorProtocol {

    var presenter: FindTablePresenterProtocol?
    
    func performInteraction(interaction: FindTableMessages.Interactions) {
        
        switch interaction {
        case .textUpdated(let text):
            presenter?.performPresentation(presentation: .updateText(text))
        }
    }
}
