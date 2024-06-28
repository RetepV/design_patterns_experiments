//
//  MainViewController.swift
//  design_pattern_MVC
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Private
    
    private var viewModel: MainViewControllerModelProtocol? = nil
    
    // MARK: - Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var pushVCLabel: UILabel!
    @IBOutlet private weak var firstPushVCButton: UIButton!
    @IBOutlet private weak var secondPushVCButton: UIButton!
    @IBOutlet private weak var thirdPushVCButton: UIButton!
    
    @IBOutlet private weak var presentWithNCLabel: UILabel!
    @IBOutlet private weak var firstPresentWithNCButton: UIButton!
    @IBOutlet private weak var secondPresentWithNCButton: UIButton!
    @IBOutlet private weak var thirdPresentWithNCButton: UIButton!
    
    // MARK: - Lifecycle
    
    // MARK: - Lifecycle
    
    static func instantiate() -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MainViewController") as! MainViewController
        viewController.viewModel = MainViewControllerModel(viewUpdate: { update in
            viewController.updateView(update: update)
        }) as MainViewControllerModelProtocol
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Updates
    
    func updateView(update: MainViewControllerModel.ViewUpdate) {

        switch update {
        case .title(let string):
            title = string
        case .titleLabel(let string):
            titleLabel.text? = string

        case .pushVCLabel(let string):
            pushVCLabel.text = string
        case .firstPushVCButtonLabel(let string):
            firstPushVCButton.setTitle(string, for: .normal)
        case .secondPushVCButtonLabel(let string):
            secondPushVCButton.setTitle(string, for: .normal)
        case .thirdPushVCButtonLabel(let string):
            thirdPushVCButton.setTitle(string, for: .normal)

        case .presentWithNCLabel(let string):
            presentWithNCLabel.text = string
        case .firstPresentWithNCButtonLabel(let string):
            firstPresentWithNCButton.setTitle(string, for: .normal)
        case .secondPresentWithNCButtonLabel(let string):
            secondPresentWithNCButton.setTitle(string, for: .normal)
        case .thirdPresentWithNCButtonLabel(let string):
            thirdPresentWithNCButton.setTitle(string, for: .normal)

        case .pushViewController(let viewController):
            navigationController?.pushViewController(viewController, animated: true)
        case .presentViewController(let viewController):
            present(viewController, animated: true)
        }
    }
    
    // MARK: - Events
    
    @IBAction func firstPushVCButtonTapped(_ sender: UIButton) {
        viewModel?.firstPushVCButtonTapped()
    }
    
    @IBAction func secondPushVCButtonTapped(_ sender: UIButton) {
        viewModel?.secondPushVCButtonTapped()
    }

    @IBAction func thirdPushVCButtonTapped(_ sender: UIButton) {
        viewModel?.thirdPushVCButtonTapped()
    }
    
    @IBAction func firstPresentWithNCButtonTapped(_ sender: UIButton) {
        viewModel?.firstPresentWithNCButtonTapped()
    }
    
    @IBAction func secondPresentWithNCButtonTapped(_ sender: UIButton) {
        viewModel?.secondPresentWithNCButtonTapped()
    }
    
    @IBAction func thirdPresentWithNCButtonTapped(_ sender: UIButton) {
        viewModel?.thirdPresentWithNCButtonTapped()
    }
}

