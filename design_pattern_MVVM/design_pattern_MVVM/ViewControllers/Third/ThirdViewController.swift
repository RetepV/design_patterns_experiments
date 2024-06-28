//
//  ThirdViewController.swift
//  design_pattern_MVC
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: - Private
    
    private var viewModel: ThirdViewControllerModelProtocol? = nil

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    static func instantiate() -> ThirdViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        viewController.viewModel = ThirdViewControllerModel(viewUpdate: { update in
            viewController.updateView(update: update)
        }) as ThirdViewControllerModelProtocol
        return viewController

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Updates
    
    func updateView(update: ThirdViewControllerModel.ViewUpdate) {
        switch update {
        case .title(let string):
            title = string
        case .titleLabel(let string):
            titleLabel.text? = string
        }
    }
    
    // MARK: - Events
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(SecondViewController.instantiate(), animated: true)
    }
        
    // MARK: - Private
    
    private func setupInitialViewItems() {
        
        title = "ThirdViewController"
        
        titleLabel.text = "Third View"
    }

}
