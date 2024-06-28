//
//  MainViewController.swift
//  design_pattern_MVC
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import UIKit

class MainViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialViewItems()
    }
    
    // MARK: - Events
    
    @IBAction func firstPushVCButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(FirstViewController.instantiate(), animated: true)
    }
    
    @IBAction func secondPushVCButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(SecondViewController.instantiate(), animated: true)
    }

    @IBAction func thirdPushVCButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ThirdViewController.instantiate(), animated: true)
    }
    
    @IBAction func firstPresentWithNCButtonTapped(_ sender: UIButton) {
        let navigationController = UINavigationController(rootViewController: FirstViewController.instantiate())
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func secondPresentWithNCButtonTapped(_ sender: UIButton) {
        let navigationController = UINavigationController(rootViewController: SecondViewController.instantiate())
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func thirdPresentWithNCButtonTapped(_ sender: UIButton) {
        let navigationController = UINavigationController(rootViewController: ThirdViewController.instantiate())
        present(navigationController, animated: true, completion: nil)
    }

    // MARK: - Private
    
    private func setupInitialViewItems() {
        
        title = "MainViewController"
        
        titleLabel.text = "Main View"
        
        pushVCLabel.text = "Push ViewController on current NavigationController"
        firstPushVCButton.setTitle("First ViewController", for: .normal)
        secondPushVCButton.setTitle("Second ViewController", for: .normal)
        thirdPushVCButton.setTitle("Third ViewController", for: .normal)

        presentWithNCLabel.text = "Present ViewController on new NavigationController"
        firstPresentWithNCButton.setTitle("First ViewController", for: .normal)
        secondPresentWithNCButton.setTitle("Second ViewController", for: .normal)
        thirdPresentWithNCButton.setTitle("Third ViewController", for: .normal)
    }
}

