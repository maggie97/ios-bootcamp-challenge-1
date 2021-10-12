//
//  CardView.swift
//  iOS Bootcamp Challenge
//
//  Created by Marlon David Ruiz Arroyave on 28/09/21.
//

import UIKit

class CardView: UIView {

    private let margin: CGFloat = 30
    var card: Card?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    required init(card: Card) {
        self.card = card
        super.init(frame: .zero)
        setup()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupUI()
    }

    private func setup() {
        guard let card = card else { return }

        card.items.forEach { item in
            let itemTitleLabel = UILabel()
            itemTitleLabel.text = item.title
            itemTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
            let itemDescriptionLabel = UILabel()
            itemDescriptionLabel.font = UIFont.systemFont(ofSize: 15)
            itemDescriptionLabel.text = item.description
            
            stackView.addArrangedSubview(itemTitleLabel)
            
            stackView.addArrangedSubview(itemDescriptionLabel)
            
        }

        titleLabel.text = card.title
        backgroundColor = .white
        layer.cornerRadius = 20
    }

    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true

        // TODO: Display pokemon info (eg. types, abilities)
        addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: margin).isActive =  true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 4).isActive = true
    }

}
