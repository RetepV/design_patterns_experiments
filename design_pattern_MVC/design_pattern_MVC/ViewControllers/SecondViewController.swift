//
//  SecondViewController.swift
//  design_pattern_MVC
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    
    // MARK: - Lifecycle
    
    static func instantiate() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialViewItems()
    }
    
    // MARK: - Events
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ThirdViewController.instantiate(), animated: true)
    }
        
    // MARK: - Private
    
    private func setupInitialViewItems() {
        
        title = "SecondViewController"
        
        titleLabel.text = "Second View"
        
        firstButton.setTitle("Third ViewController", for: .normal)
    }
}
