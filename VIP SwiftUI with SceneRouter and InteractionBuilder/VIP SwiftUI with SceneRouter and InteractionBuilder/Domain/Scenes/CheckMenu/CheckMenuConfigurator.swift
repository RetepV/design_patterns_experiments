//
//  CheckMenuConfigurator.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// CheckMenu scene's view configurator

import SwiftUI

extension CheckMenuView {
    
    func configure() -> some View {
        
        var view = self
        
        let interactor = CheckMenuInteractor()
        view.interactor = interactor

        let presenter = CheckMenuPresenter()
        interactor.presenter = presenter
        
        presenter.view = view

        return view
    }
}
