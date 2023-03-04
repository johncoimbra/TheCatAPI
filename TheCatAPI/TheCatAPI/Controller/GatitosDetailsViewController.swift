//
//  GatitosDetailsViewController.swift
//  TheCatAPI
//
//  Created by John on 02/11/22.
//

import UIKit
import Kingfisher

class GatitosDetailsViewController: UIViewController {
    // MARK: - Properties
    let viewModel: GatitosDetailsViewModelProtocol
    private let gatitosDetailsView = GatitosDetailsVIew()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    init(viewModel: GatitosDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        fillBreed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func fillBreed() {
        let url = URL(string: viewModel.gatitosModel.image?.url ?? "")
        gatitosDetailsView.imageBreed.kf.setImage(with: url)
        gatitosDetailsView.breedLabel.text = viewModel.gatitosModel.name
        gatitosDetailsView.descriptionBreedLabelTwo.text = viewModel.gatitosModel.description
        gatitosDetailsView.temperamentLabel.text = viewModel.gatitosModel.temperament
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
