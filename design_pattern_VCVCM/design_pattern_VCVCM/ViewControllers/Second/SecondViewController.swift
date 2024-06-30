//
//  SecondViewController.swift
//  design_pattern_MVC
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Private
    
    private var viewModel: SecondViewControllerModelProtocol? = nil

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    
    // MARK: - Lifecycle
    
    static func instantiate() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        viewController.viewModel = SecondViewControllerModel(viewUpdate: { update in
            viewController.updateView(update: update)
        }) as SecondViewControllerModelProtocol
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Updates
    
    func updateView(update: SecondViewControllerModel.ViewUpdate) {
        switch update {
        case .title(let string):
            title = string
        case .titleLabel(let string):
            titleLabel.text? = string
            
        case .firstButtonLabel(let string):
            firstButton.setTitle(string, for: .normal)

        case .pushViewController(let viewController):
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - Events
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        viewModel?.firstButtonTapped()
    }
}
