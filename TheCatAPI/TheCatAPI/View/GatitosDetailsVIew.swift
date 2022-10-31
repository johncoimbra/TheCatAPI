//
//  GatitosDetailsVIew.swift
//  TheCatAPI
//
//  Created by John on 30/10/22.
//

import UIKit

class GatitosDetailsVIew: UIView {
    
    // MARK: - Properties
    private var imageBreed = UIImageView().apply {
        $0.image = UIImage(systemName: "house")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.setDimensions(height: 250)
    }
    
    private var nameBreedLabel = UILabel().apply {
        $0.text = "Nome da Raça:"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GatitosDetailsVIew: CodeView {
    func buildViewHierarchy() {
        addSubview(imageBreed)
        addSubview(nameBreedLabel)
    }
    
    func setupConstraints() {
        
        imageBreed.anchor(
            top: topAnchor,
            left: leftAnchor,
            right: rightAnchor
        )
        
        nameBreedLabel.anchor(
            top: imageBreed.bottomAnchor,
            left: leftAnchor,
            paddingTop: 16,
            paddingLeft: 16
        )
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
