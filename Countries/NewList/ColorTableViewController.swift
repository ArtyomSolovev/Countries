//
//  ColorTableViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 02.12.2021.
//

import UIKit

class ColorTableViewController: UITableViewController {

    private var array: [UIColor] = [.init(hex: "#FF0000")!, .orange, .yellow, .green, .cyan, .blue, .purple]
    
    weak var colorDelegate: ColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: ColorTableViewCell.id)
        self.tableView.isScrollEnabled = false
    }

    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250, height: self.tableView.contentSize.height)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorTableViewCell.id, for: indexPath) as! ColorTableViewCell

        cell.backgroundColor = self.array[indexPath.row]

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            self.colorDelegate?.update(colorButton: self.array[indexPath.row])
            self.dismiss(animated: true, completion: nil)
        }
    }

}
