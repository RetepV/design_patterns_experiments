//
//  MainViewModel.swift
//  design_pattern_MVVM
//
//  Created by Peter de Vroomen on 30/06/2024.
//


class MainViewModel {
    
    // MARK: - Constants
    
    let title = "MainViewController"
    
    let titleLabel = "Main View"
    
    let pushVCLabel = "Push ViewController on current NavigationController"
    let firstPushVCButtonLabel = "First ViewController"
    let secondPushVCButtonLabel = "Second ViewController"
    let thirdPushVCButtonLabel = "Third ViewController"

    let presentWithNCLabel = "Present ViewController on new NavigationController"
    let firstPresentWithNCButtonLabel = "First ViewController"
    let secondPresentWithNCButtonLabel = "Second ViewController"
    let thirdPresentWithNCButtonLabel = "Third ViewController"
    
    // MARK: - State
    
    var numberOfPeople: Int = 10    
}
