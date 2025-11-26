//
//  WaitForBeerConfigurator.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 25-11-2025.
//  
//

// WaitForBeer scene's view configurator

import SwiftUI

extension WaitForBeerView {
    
    func configure() -> some View {
        
        var view = self
        
        let interactor = WaitForBeerInteractor()
        view.interactor = interactor

        let presenter = WaitForBeerPresenter()
        interactor.presenter = presenter
        
        presenter.view = view

        return view
    }
}
