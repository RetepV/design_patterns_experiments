//
//  FirstViewControllerModel.swift
//  design_pattern_MVVM
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation
import UIKit

protocol FirstViewControllerModelProtocol {
    func viewDidLoad()
    
    func firstButtonTapped()
    func secondButtonTapped()
}

class FirstViewControllerModel: FirstViewControllerModelProtocol {

    // MARK: - View updates
    
    enum ViewUpdate {
        case title(String)
        case titleLabel(String)
        case firstButtonLabel(String)
        case secondButtonLabel(String)
        case pushViewController(UIViewController)
    }
    
    // MARK: - Private
    
    private let model = FirstViewModel()
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
        viewUpdate(.pushViewController(SecondViewController.instantiate()))
    }
    
    func secondButtonTapped() {
        viewUpdate(.pushViewController(ThirdViewController.instantiate()))
    }
    
    // MARK: - Private

    private func setupInitialViewItems() {
        
        viewUpdate(.title(model.title))
        
        viewUpdate(.titleLabel(model.titleLabel))

        viewUpdate(.firstButtonLabel(model.firstButtonLabel))
        viewUpdate(.secondButtonLabel(model.secondButtonLabel))
    }
}
