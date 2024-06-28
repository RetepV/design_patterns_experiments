//
//  SecondViewControllerModel.swift
//  design_pattern_MVVM
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation
import UIKit

protocol SecondViewControllerModelProtocol {
    func viewDidLoad()
    
    func firstButtonTapped()
}

class SecondViewControllerModel: SecondViewControllerModelProtocol {

    // MARK: - View updates
    
    enum ViewUpdate {
        case title(String)
        case titleLabel(String)
        case firstButtonLabel(String)
        case pushViewController(UIViewController)
    }
    
    // MARK: - Private
    
    private var viewUpdate: ((ViewUpdate)->())!
    
    // MARK: - Lifecyle
    
    init(viewUpdate: @escaping (ViewUpdate)->()) {
        self.viewUpdate = viewUpdate
    }
    
    // MARK: - Model protocol
    
    func viewDidLoad() {
        setupInitialViewItems()
    }
    
    func firstButtonTapped() {
        viewUpdate(.pushViewController(ThirdViewController.instantiate()))
    }
    
    // MARK: - Private

    private func setupInitialViewItems() {
        
        viewUpdate(.title("SecondViewController"))
        
        viewUpdate(.titleLabel("Second View"))

        viewUpdate(.firstButtonLabel("Third ViewController"))
    }
}
