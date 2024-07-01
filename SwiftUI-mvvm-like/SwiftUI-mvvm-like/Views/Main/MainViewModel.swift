//
//  MainViewModel.swift
//  GuessTheFlag
//
//  Created by Peter de Vroomen on 01/07/2024.
//

import Foundation
import SwiftUI

// Viewmodel for MainView

extension MainView {
    
    // MARK: - Protocol
    
    protocol ViewModelProtocol {
        
        // MARK: - Constants
        
        var title: String {get}
        var titleLabel: String {get}
        
        var pushVCLabel: String {get}
        var firstPushVCButtonLabel: String {get}
        var secondPushVCButtonLabel: String {get}
        var thirdPushVCButtonLabel: String {get}
        
        var presentWithNCLabel: String {get}
        var firstPresentWithNCButtonLabel: String {get}
        var secondPresentWithNCButtonLabel: String {get}
        var thirdPresentWithNCButtonLabel: String {get}
        
        var decButtonLabel: String {get}
        var incButtonLabel: String {get}
        var peopleLabel: String {get}
        var enterNumberOfPeopleLabel: String {get}
        var amountLabel: String {get}

        // MARK: - View 'actions'
        
        // These functions are named like actions but return a view. The reason being that we might want to do some processing
        // before showing any new screen. These functions therefore do more than just return the next view to navigate to.
        // TODO: it would be great if we could return `some view` or `any view`, so we won't have to return some concrete view.
        // TODO: But for now, I don't know how yet.
        func firstPushVCButtonTapped() -> FirstView
        func secondPushVCButtonTapped() -> SecondView
        func thirdPushVCButtonTapped() -> ThirdView
        
        func firstPresentWithNCButtonTapped(coordinator: SheetCoordinator<PresentableSheets>)
        func secondPresentWithNCButtonTapped(coordinator: SheetCoordinator<PresentableSheets>)
        func thirdPresentWithNCButtonTapped(coordinator: SheetCoordinator<PresentableSheets>)

        // MARK: - State
        
        var numberOfPeople: Int {get set}

        // MARK: - State updates
        
        func incrementPeople()
        func decrementPeople()
    }
    
    @Observable
    class ViewModel: @preconcurrency ViewModelProtocol {
        
        // MARK: - Constants
        
        let title = "MainView"
        let titleLabel = "Main View"

        let pushVCLabel = "Push ViewController on current NavigationController"
        let firstPushVCButtonLabel = "First View"
        let secondPushVCButtonLabel = "Second View"
        let thirdPushVCButtonLabel = "Third View"
        
        let presentWithNCLabel = "Present ViewController with NavigationController"
        let firstPresentWithNCButtonLabel = "First View"
        let secondPresentWithNCButtonLabel = "Second View"
        let thirdPresentWithNCButtonLabel = "Third View"
        
        let decButtonLabel = "DEC"
        let incButtonLabel = "INC"
        
        let peopleLabel = "People:"
        let enterNumberOfPeopleLabel = "Enter number of people:"
        let amountLabel = "Amount"

        // MARK: - State
        
        internal var numberOfPeople: Int = 10
        
        // MARK: - Public View 'actions'
        
        func firstPushVCButtonTapped() -> FirstView {
            FirstView()
        }
        
        func secondPushVCButtonTapped() -> SecondView {
            SecondView()
        }
        
        func thirdPushVCButtonTapped() -> ThirdView {
            ThirdView()
        }

        @MainActor
        func firstPresentWithNCButtonTapped(coordinator: SheetCoordinator<PresentableSheets>) {
            coordinator.presentSheet(.firstView)
        }
        
        @MainActor
        func secondPresentWithNCButtonTapped(coordinator: SheetCoordinator<PresentableSheets>) {
            coordinator.presentSheet(.secondView)
        }
        
        @MainActor
        func thirdPresentWithNCButtonTapped(coordinator: SheetCoordinator<PresentableSheets>) {
            coordinator.presentSheet(.thirdView)
        }
        
        // MARK: - State updates

        func incrementPeople() {
            if numberOfPeople < 100 {
                numberOfPeople += 1
            }
        }
        
        func decrementPeople() {
            if numberOfPeople > 0 {
                numberOfPeople -= 1
            }
        }
    }
    
    // MARK: - Sheets
    
    enum PresentableSheets: String, Identifiable, SheetEnum {
        case firstView, secondView, thirdView
        
        var id: String { rawValue }

        @ViewBuilder
        func view(coordinator: SheetCoordinator<PresentableSheets>) -> some View {
            switch self {
            case .firstView:
                FirstView()
            case .secondView:
                SecondView()
            case .thirdView:
                ThirdView()
            }
        }
    }
}
