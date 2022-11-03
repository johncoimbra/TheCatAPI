//
//  GatitosViewCell.swift
//  TheCatAPI
//
//  Created by John on 30/10/22.
//

import UIKit

class GatitosViewCell: UITableViewCell {
    
    // MARK: - Propterties
    var label = UILabel().apply {
        $0.text = "Persa"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
    }
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GatitosViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {
        label.center(inView: self)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .systemGray3
        self.layer.cornerRadius = 4
        
    }
}
