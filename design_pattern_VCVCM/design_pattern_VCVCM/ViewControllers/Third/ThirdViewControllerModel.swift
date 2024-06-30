//
//  ThirdViewControllerModel.swift
//  design_pattern_MVCVM
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation
import UIKit

protocol ThirdViewControllerModelProtocol {
    func viewDidLoad()
}

class ThirdViewControllerModel: ThirdViewControllerModelProtocol {

    // MARK: - View updates
    
    enum ViewUpdate {
        case title(String)
        case titleLabel(String)
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
    
    // MARK: - Private

    private func setupInitialViewItems() {
        
        viewUpdate(.title("ThirdViewController"))
        
        viewUpdate(.titleLabel("Third View"))
    }
}
