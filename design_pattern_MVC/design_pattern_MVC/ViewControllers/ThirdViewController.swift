//
//  ThirdViewController.swift
//  design_pattern_MVC
//
//  Created by Peter de Vroomen on 28/06/2024.
//

import Foundation

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    static func instantiate() -> ThirdViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialViewItems()
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
