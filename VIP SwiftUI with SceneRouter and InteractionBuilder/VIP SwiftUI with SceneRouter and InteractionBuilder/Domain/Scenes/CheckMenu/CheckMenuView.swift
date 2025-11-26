//
//  CheckMenuView.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// CheckMenu  scene's view

import SwiftUI

protocol CheckMenuViewProtocol {
    func viewUpdate(update: CheckMenuMessages.ViewUpdates)
}

extension CheckMenuView {

    func viewUpdate(update: CheckMenuMessages.ViewUpdates) {
        switch update {
        case .setText(let text):
            viewModel.text = text
        }
    }
}

struct CheckMenuView: View, CheckMenuViewProtocol {
    
    var interactor: CheckMenuInteractorProtocol?
    
    @Environment(SceneRouter.self)
    private var sceneRouter

    @State private var viewModel = CheckMenuViewModel(text: "CheckMenu scene")
    
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
                                
                InteractionPerformerBuilder.makePerformer(of: .navigationTitledButton(router: sceneRouter,  destination: .orderBeer, title: "Order a beer"))
            }
            .toolbar {
                GenericToolbar(router: sceneRouter, title: "CheckMenuView", trailingActions: nil)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CheckMenuView()
}
