//
//  ColorTableViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 02.12.2021.
//

import UIKit

final class ColorTableViewController: UITableViewController {

    private let hexOfColor = ["#FF0000", "#FFA500", "#FFFF00", "#00FF00", "#00FFFF", "#0000FF", "#800080"]
    private var arrayOfColor = [UIColor]()
    
    weak var colorDelegate: ColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureArray()
        self.tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: ColorTableViewCell.id)
        self.tableView.isScrollEnabled = false
    }

    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250, height: self.tableView.contentSize.height)
    }
    
    private func configureArray() {
        hexOfColor.forEach { arrayOfColor.append((.init(hex: $0 ) ?? .white))
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfColor.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorTableViewCell.id, for: indexPath) as! ColorTableViewCell

        cell.backgroundColor = self.arrayOfColor[indexPath.row]

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            self.colorDelegate?.update(colorButton: self.hexOfColor[indexPath.row])
            self.dismiss(animated: true, completion: nil)
        }
    }

}
