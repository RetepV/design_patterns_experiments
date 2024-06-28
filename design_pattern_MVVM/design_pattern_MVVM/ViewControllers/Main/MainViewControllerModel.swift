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
    }
    
    // MARK: - Private
    
    private var viewUpdate: ((MainViewControllerModel.ViewUpdate)->())!
    
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
    
    private func setupInitialViewItems() {
        
        viewUpdate(.title("MainViewController"))
        
        viewUpdate(.titleLabel("Main View"))
        
        viewUpdate(.pushVCLabel("Push ViewController on current NavigationController"))
        viewUpdate(.firstPushVCButtonLabel("First ViewController"))
        viewUpdate(.secondPushVCButtonLabel("Second ViewController"))
        viewUpdate(.thirdPushVCButtonLabel("Third ViewController"))

        viewUpdate(.presentWithNCLabel("Present ViewController on new NavigationController"))
        viewUpdate(.firstPresentWithNCButtonLabel("First ViewController"))
        viewUpdate(.secondPresentWithNCButtonLabel("Second ViewController"))
        viewUpdate(.thirdPresentWithNCButtonLabel("Third ViewController"))
    }
}
