//
//  OrderBeerView.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// OrderBeer  scene's view

import SwiftUI

protocol OrderBeerViewProtocol {
    func viewUpdate(update: OrderBeerMessages.ViewUpdates)
}

extension OrderBeerView {

    func viewUpdate(update: OrderBeerMessages.ViewUpdates) {
        switch update {
        case .setText(let text):
            viewModel.text = text
        }
    }
}

struct OrderBeerView: View, OrderBeerViewProtocol {
    
    var interactor: OrderBeerInteractorProtocol?
    
    @Environment(SceneRouter.self)
    private var sceneRouter
    
    @State private var viewModel = OrderBeerViewModel(text: "OrderBeer scene")
    
    @State private var newText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Text: ")
                    Text(viewModel.text)
                }
                
                TextField("Type new text:", text: $newText)
                    .border(Color.gray, width: 1)
                    .padding([.leading, .trailing], 60)
                
                InteractionPerformerBuilder.makePerformer(of: .actionButton(action: {
                    self.interactor?.performInteraction(interaction: .textUpdated(text: self.newText))
                    self.newText = ""
                }, label: "Update text"))
                
                InteractionPerformerBuilder.makePerformer(of: .navigationTitledButton(router: sceneRouter, destination: .waitForBeer, title: "Wait for beer"))

            }
            .toolbar {
                GenericToolbar(router: sceneRouter, title: "OrderBeerView", trailingActions: nil)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OrderBeerView()
}
