//
//  FirstViewController.swift
//  design_pattern_MVC
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Private
    
    private var viewModel: FirstViewControllerModelProtocol? = nil
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    // MARK: - Lifecycle
    
    static func instantiate() -> FirstViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
        viewController.viewModel = FirstViewControllerModel(viewUpdate: { update in
            viewController.updateView(update: update)
        }) as FirstViewControllerModelProtocol
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Updates
    
    func updateView(update: FirstViewControllerModel.ViewUpdate) {
        switch update {
        case .title(let string):
            title = string
        case .titleLabel(let string):
            titleLabel.text? = string
        case .firstButtonLabel(let string):
            firstButton.setTitle(string, for: .normal)
        case .secondButtonLabel(let string):
            secondButton.setTitle(string, for: .normal)
        case .pushViewController(let viewController):
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - Events
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        viewModel?.firstButtonTapped()
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        viewModel?.secondButtonTapped()
    }
    
    // MARK: - Private    
}
