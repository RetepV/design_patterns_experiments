//
//  MainViewControllerModel.swift
//  design_pattern_MVVM
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation
import UIKit

protocol MainViewControllerModelProtocol {
    func viewDidLoad()
    
    func firstPushVCButtonTapped()
    func secondPushVCButtonTapped()
    func thirdPushVCButtonTapped()
    
    func firstPresentWithNCButtonTapped()
    func secondPresentWithNCButtonTapped()
    func thirdPresentWithNCButtonTapped()
    
    func decButtonTapped()
    func incButtonTapped()
    func updateNumberOfPeople(_ number: Int)
}

class MainViewControllerModel: MainViewControllerModelProtocol {

    // MARK: - View updates
    
    enum ViewUpdate {
        case title(String)
        case titleLabel(String)
        
        case pushVCLabel(String)
        case firstPushVCButtonLabel(String)
        case secondPushVCButtonLabel(String)
        case thirdPushVCButtonLabel(String)
        
        case presentWithNCLabel(String)
        case firstPresentWithNCButtonLabel(String)
        case secondPresentWithNCButtonLabel(String)
        case thirdPresentWithNCButtonLabel(String)

        case pushViewController(UIViewController)
        case presentViewController(UIViewController)
        
        case numberOfPeopleLabel(String)
        case numberOfPeopleInput(String)
    }
    
    // MARK: - Private
    
    private let model = MainViewModel()
    private var viewUpdate: ((MainViewControllerModel.ViewUpdate)->())!
    
    private var numberOfPeople: Int = 10
    
    // MARK: - Lifecyle
    
    init(viewUpdate: @escaping (MainViewControllerModel.ViewUpdate)->()) {
        self.viewUpdate = viewUpdate
    }
    
    // MARK: - Model protocol
    
    func viewDidLoad() {
        setupInitialViewItems()
    }
    
    func firstPushVCButtonTapped() {
        viewUpdate(.pushViewController(FirstViewController.instantiate()))
    }
    
    func secondPushVCButtonTapped() {
        viewUpdate(.pushViewController(SecondViewController.instantiate()))
    }
    
    func thirdPushVCButtonTapped() {
        viewUpdate(.pushViewController(ThirdViewController.instantiate()))
    }
    
    func firstPresentWithNCButtonTapped() {
        let navigationController = UINavigationController(rootViewController: FirstViewController.instantiate())
        viewUpdate(.presentViewController(navigationController))
    }
    
    func secondPresentWithNCButtonTapped() {
        let navigationController = UINavigationController(rootViewController: SecondViewController.instantiate())
        viewUpdate(.presentViewController(navigationController))
    }
    
    func thirdPresentWithNCButtonTapped() {
        let navigationController = UINavigationController(rootViewController: ThirdViewController.instantiate())
        viewUpdate(.presentViewController(navigationController))
    }
    
    func decButtonTapped() {
        if numberOfPeople > 0 {
            numberOfPeople -= 1
        }
        viewUpdate(.numberOfPeopleLabel("People: \(numberOfPeople)"))
        viewUpdate(.numberOfPeopleInput("\(numberOfPeople)"))
    }
    
    func incButtonTapped() {
        if numberOfPeople < 100 {
            numberOfPeople += 1
        }
        viewUpdate(.numberOfPeopleLabel("People: \(numberOfPeople)"))
        viewUpdate(.numberOfPeopleInput("\(numberOfPeople)"))
    }
    
    func updateNumberOfPeople(_ number: Int) {
        numberOfPeople = number
        viewUpdate(.numberOfPeopleLabel("People: \(numberOfPeople)"))
    }
    
    private func setupInitialViewItems() {
        
        viewUpdate(.title(model.title))
        
        viewUpdate(.titleLabel(model.titleLabel))
        
        viewUpdate(.pushVCLabel(model.pushVCLabel))
        viewUpdate(.firstPushVCButtonLabel(model.firstPushVCButtonLabel))
        viewUpdate(.secondPushVCButtonLabel(model.secondPushVCButtonLabel))
        viewUpdate(.thirdPushVCButtonLabel(model.thirdPushVCButtonLabel))

        viewUpdate(.presentWithNCLabel(model.presentWithNCLabel))
        viewUpdate(.firstPresentWithNCButtonLabel(model.firstPresentWithNCButtonLabel))
        viewUpdate(.secondPresentWithNCButtonLabel(model.secondPresentWithNCButtonLabel))
        viewUpdate(.thirdPresentWithNCButtonLabel(model.thirdPresentWithNCButtonLabel))
        
        viewUpdate(.numberOfPeopleLabel("People: \(numberOfPeople)"))
        viewUpdate(.numberOfPeopleInput("\(numberOfPeople)"))
    }
}
