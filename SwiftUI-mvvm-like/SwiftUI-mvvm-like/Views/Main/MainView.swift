//
//  MainView.swift
//  SwiftUI-mvvm-like
//
//  Created by Peter de Vroomen on 01/07/2024.
//

import SwiftUI

struct MainView: View {
    // MARK: - State
    
    @State
    var model = ViewModel() as ViewModelProtocol
    @StateObject
    var sheetCoordinator = SheetCoordinator<PresentableSheets>()
    
    // MARK: - View
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(model.titleLabel)
                    .font(Font.system(size: 36, weight: .bold))

                Spacer()
                    .frame(height: 64)

                NavigationLink(model.firstPushVCButtonLabel) {
                    model.firstPushVCButtonTapped()
                }
                Spacer()
                    .frame(height:16)
                NavigationLink(model.secondPushVCButtonLabel) {
                    model.secondPushVCButtonTapped()
                }
                Spacer()
                    .frame(height:16)
                NavigationLink(model.thirdPushVCButtonLabel) {
                    model.thirdPushVCButtonTapped()
                }

                Spacer()
                    .frame(height:64)

                Button(model.firstPresentWithNCButtonLabel) {
                    model.firstPresentWithNCButtonTapped(coordinator: sheetCoordinator)
                }
                Spacer()
                    .frame(height:16)
                Button(model.secondPresentWithNCButtonLabel) {
                    sheetCoordinator.presentSheet(.secondView)
                }
                Spacer()
                    .frame(height:16)
                Button(model.thirdPresentWithNCButtonLabel) {
                    sheetCoordinator.presentSheet(.thirdView)
                }

                Spacer()
                    .frame(height: 64)
                
                VStack {
                    Text("\(model.peopleLabel) \(model.numberOfPeople)")
                    
                    HStack {
                        Spacer()
                        Button(model.decButtonLabel, action: model.decrementPeople)
                        Spacer()
                        Button(model.incButtonLabel, action: model.incrementPeople)
                        Spacer()
                    }
                    
                    HStack {
                        Text(model.enterNumberOfPeopleLabel)
                        TextField(model.amountLabel, value: $model.numberOfPeople, format: .number)
                            .multilineTextAlignment(.center)
                    }
                }
                Spacer()
            }
            .navigationBarTitle(model.title)
            .navigationBarTitleDisplayMode(.inline)
            .sheetCoordinating(coordinator: sheetCoordinator)
        }
    }
}

#Preview {
    MainView()
}
