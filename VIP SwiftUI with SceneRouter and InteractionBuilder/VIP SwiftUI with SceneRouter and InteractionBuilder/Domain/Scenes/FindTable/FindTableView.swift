//
//  FindTableView.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//  
//

// FindTable  scene's view

import SwiftUI

protocol FindTableViewProtocol {
    func viewUpdate(update: FindTableMessages.ViewUpdates)
}

extension FindTableView {

    func viewUpdate(update: FindTableMessages.ViewUpdates) {
        switch update {
        case .setText(let text):
            viewModel.text = text
        case .setTextEntry(let text):
            viewModel.newText = text
        }
    }
}

struct FindTableView: View, FindTableViewProtocol {
    
    var interactor: FindTableInteractorProtocol?
    
    @Environment(SceneRouter.self)
    private var sceneRouter
    
    @State private var viewModel = FindTableViewModel(text: "FindTable scene")
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    Text("Text: ")
                    Text(viewModel.text)
                }

                TextField("Type new text:", text: $viewModel.newText)
                    .border(Color.gray, width: 1)
                    .padding([.leading, .trailing], 60)

                InteractionPerformerBuilder.makePerformer(of: .actionButton(action: {
                    self.interactor?.performInteraction(interaction: .textUpdated(viewModel.newText))
                }, label: "Update text"))
                
                InteractionPerformerBuilder.makePerformer(of: .navigationTitledButton(router: sceneRouter, destination: .checkMenu, title: "Check the menu"))
            }
            .toolbar {
                GenericToolbar(router: sceneRouter, title: "FindTableView", trailingActions: nil)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FindTableView()
}
