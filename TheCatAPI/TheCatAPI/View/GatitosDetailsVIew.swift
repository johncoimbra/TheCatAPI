//
//  GatitosDetailsVIew.swift
//  TheCatAPI
//
//  Created by John on 30/10/22.
//

import UIKit

class GatitosDetailsVIew: UIView {
    
    // MARK: - Properties
    private let scrollView = UIScrollView().apply {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
    }
    
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
    
    private var breedLabel = UILabel().apply {
        $0.text = "Persa"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.textAlignment = .center
    }
    
    private var descriptionBreedLabel = UILabel().apply {
        $0.text = "Descrição da Raça:"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
    }
    
    private var descriptionBreedLabelTwo = UILabel().apply {
        $0.text = Constants().DESCRIPTION
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.textAlignment = .justified
        $0.numberOfLines = 0
        $0.clipsToBounds = true
    }
    
    private var temperamentBreedLabel = UILabel().apply {
        $0.text = "Temperamento:"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
    }
    
    private var temperamentLabel = UILabel().apply {
        $0.text = Constants().TEMPERAMENT
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.textAlignment = .justified
        $0.numberOfLines = 0
        $0.clipsToBounds = true
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
        addSubview(scrollView)
        scrollView.addSubview(imageBreed)
        scrollView.addSubview(nameBreedLabel)
        scrollView.addSubview(breedLabel)
        scrollView.addSubview(descriptionBreedLabel)
        scrollView.addSubview(descriptionBreedLabelTwo)
        scrollView.addSubview(temperamentBreedLabel)
        scrollView.addSubview(temperamentLabel)
    }
    
    func setupConstraints() {
        scrollView.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor
        )
        
        imageBreed.anchor(
            top: scrollView.topAnchor,
            left: leftAnchor,
            right: rightAnchor
        )
        
        nameBreedLabel.anchor(
            top: imageBreed.bottomAnchor,
            left: leftAnchor,
            paddingTop: 16,
            paddingLeft: 16
        )
        
        breedLabel.centerY(inView: nameBreedLabel)
        breedLabel.anchor(
            left: nameBreedLabel.rightAnchor,
            paddingLeft: 8
        )
        
        descriptionBreedLabel.anchor(
            top: nameBreedLabel.bottomAnchor,
            left: leftAnchor,
            paddingTop: 16,
            paddingLeft: 16
        )
        
        descriptionBreedLabelTwo.anchor(
            top: descriptionBreedLabel.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 16,
            paddingLeft: 16,
            paddingRight: 16
        )
        
        temperamentBreedLabel.anchor(
            top: descriptionBreedLabelTwo.bottomAnchor,
            left: leftAnchor,
            paddingTop: 16,
            paddingLeft: 16
        )
        
        temperamentLabel.anchor(
            top: temperamentBreedLabel.bottomAnchor,
            left: leftAnchor,
            bottom: scrollView.bottomAnchor,
            right: rightAnchor,
            paddingTop: 16,
            paddingLeft: 16,
            paddingRight: 16
        )
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
