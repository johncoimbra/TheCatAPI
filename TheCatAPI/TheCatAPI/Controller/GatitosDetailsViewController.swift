//
//  GatitosDetailsViewController.swift
//  TheCatAPI
//
//  Created by John on 02/11/22.
//

import UIKit

class GatitosDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private let gatitosDetailsView = GatitosDetailsVIew()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - CodeView
extension GatitosDetailsViewController: CodeView {
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
        view.backgroundColor = .white
        title = "Detalhes"
    }
}
