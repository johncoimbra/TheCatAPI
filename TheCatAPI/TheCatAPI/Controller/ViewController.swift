//
//  ViewController.swift
//  TheCatAPI
//
//  Created by John on 30/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


}

extension ViewController: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .red
    }
    
    
}

