//
//  GatitosViewController.swift
//  TheCatAPI
//
//  Created by John on 30/10/22.
//

import UIKit

class GatitosViewController: UIViewController {
    
    // MARK: - Properties
    
    var gatitosDetailsView = GatitosDetailsVIew()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension GatitosViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(gatitosDetailsView)
    }
    
    func setupConstraints() {
        
        gatitosDetailsView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .red
    }
    
    
}

