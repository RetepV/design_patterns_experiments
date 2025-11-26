//
//  OrderBeerConfigurator.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// OrderBeer scene's view configurator

import SwiftUI

extension OrderBeerView {
    
    func configure() -> some View {
        
        var view = self
        
        let interactor = OrderBeerInteractor()
        view.interactor = interactor

        let presenter = OrderBeerPresenter()
        interactor.presenter = presenter
        
        presenter.view = view

        return view
    }
}
