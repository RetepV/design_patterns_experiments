//
//  FindTableConfigurator.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// FindTable scene's view configurator

import SwiftUI

extension FindTableView {
    
    func configure() -> some View {
        
        var view = self
        
        let interactor = FindTableInteractor()
        view.interactor = interactor

        let presenter = FindTablePresenter()
        interactor.presenter = presenter
        
        presenter.view = view

        return view
    }
}
