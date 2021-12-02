//
//  NewListTableViewCell.swift
//  Countries
//
//  Created by Артем Соловьев on 30.11.2021.
//

import UIKit

final class NewListTableViewCell: UITableViewCell {
    
    static let id = "NewListCell"
    
    private let nameOfTheCity : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var object: Country? {
        didSet {
            guard let person = object else { return }
            self.nameOfTheCity.text = person.name
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.addSubview(nameOfTheCity)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.nameOfTheCity.leftAnchor.constraint(equalTo: self.leftAnchor, constant: UIScreen.main.bounds.width/8).isActive = true
        self.nameOfTheCity.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
