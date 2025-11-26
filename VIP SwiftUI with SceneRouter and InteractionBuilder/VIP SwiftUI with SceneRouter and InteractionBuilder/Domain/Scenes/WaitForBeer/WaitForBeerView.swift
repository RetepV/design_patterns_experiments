//
//  WaitForBeerView.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 25-11-2025.
//  
//

// WaitForBeer  scene's view

import SwiftUI

protocol WaitForBeerViewProtocol {
    func viewUpdate(update: WaitForBeerMessages.ViewUpdates)
}

extension WaitForBeerView {

    func viewUpdate(update: WaitForBeerMessages.ViewUpdates) {
        switch update {
        case .setText(let text):
            viewModel.text = text
        case .setTextField(let text):
            viewModel.textFieldText = text
        }
    }
}

struct WaitForBeerView: View, WaitForBeerViewProtocol {
    
    var interactor: WaitForBeerInteractorProtocol?
    
    @Environment(SceneRouter.self)
    private var sceneRouter
    
    @State private var viewModel = WaitForBeerViewModel(text: "WaitForBeer scene")
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Text: ")
                    Text(viewModel.text)
                }
                
                TextField("Type new text:", text: $viewModel.textFieldText)
                    .border(Color.gray, width: 1)
                    .padding([.leading, .trailing], 60)
                
                Button("Update") {
                    self.interactor?.performInteraction(interaction: .textUpdated(viewModel.textFieldText))
                }
            }
            .toolbar {
                GenericToolbar(router: sceneRouter, title: "WaitForBeerView", trailingActions: nil)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WaitForBeerView()
}
