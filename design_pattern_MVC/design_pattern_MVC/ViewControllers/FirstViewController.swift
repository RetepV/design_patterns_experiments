//
//  FirstViewController.swift
//  design_pattern_MVC
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    // MARK: - Lifecycle
    
    static func instantiate() -> FirstViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialViewItems()
    }
    
    // MARK: - Events
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(SecondViewController.instantiate(), animated: true)
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ThirdViewController.instantiate(), animated: true)
    }
    
    // MARK: - Private
    
    private func setupInitialViewItems() {
        
        title = "FirstViewController"
        
        titleLabel.text = "First View"
        
        firstButton.setTitle("Second ViewController", for: .normal)
        secondButton.setTitle("Third ViewController", for: .normal)
    }
}
