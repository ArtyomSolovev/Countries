//
//  NewListViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 30.11.2021.
//

import UIKit

class NewListViewController: UIViewController {
    
    var array = Country.data + Country.data
    private let heightOfScreen = UIScreen.main.bounds.height
    private let widthOfScreen = UIScreen.main.bounds.width
    
    private let tableWithCountries: UITableView = {
        let tableView = UITableView()
        tableView.register(NewListTableViewCell.self, forCellReuseIdentifier: NewListTableViewCell.id)
        return tableView
    }()
    
    private let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = .white
        return nameTextField
    }()
    
    private var cancelButton : UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return button
    }()
    
    @objc func cancelAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private var okeyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Ok", for: .normal)
//        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(okeyAction), for: .touchUpInside)
        return button
    }()
    
    @objc func okeyAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        let toplabel = UILabel(frame: CGRect(x: 0, y: heightOfScreen/10, width: self.view.frame.width, height: 20))
        toplabel.text  = "Новый список городов"
        toplabel.textAlignment = .center
        toplabel.center.x = view.center.x
        view.addSubview(toplabel)
        
        let textLabel = UILabel()
        textLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        textLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        textLabel.text  = "Короткое имя списка"
        textLabel.textAlignment = .center
        
        let textLabel2 = UILabel()
        textLabel2.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        textLabel2.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        textLabel2.text  = "Длинное имя списка"
        textLabel2.textAlignment = .center
        
        let textLabel3 = UILabel()
        textLabel3.widthAnchor.constraint(equalToConstant: self.view.frame.width/2).isActive = true
//        textLabel3.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        textLabel3.text  = "Цвет списка"
        textLabel3.textAlignment = .center
        
        nameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        let fullNaeTextField = UITextField()
        fullNaeTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        textLabel5.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        fullNaeTextField.textAlignment = .center
        fullNaeTextField.backgroundColor = .white
        
        let textLabel6 = UILabel()
        textLabel6.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        textLabel6.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        textLabel6.text  = "Hi World6"
        textLabel6.textAlignment = .center
        
        //verticalStackView
        let verticalStackView   = UIStackView(arrangedSubviews: [textLabel, textLabel2, textLabel3])
        verticalStackView.axis  = NSLayoutConstraint.Axis.vertical
        verticalStackView.distribution  = UIStackView.Distribution.equalSpacing
        verticalStackView.alignment = UIStackView.Alignment.center
        verticalStackView.spacing   = 10.0
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalStackView2   = UIStackView(arrangedSubviews: [nameTextField, fullNaeTextField, textLabel6])
        verticalStackView2.axis  = NSLayoutConstraint.Axis.vertical
        verticalStackView2.distribution  = UIStackView.Distribution.equalSpacing
        verticalStackView2.alignment = UIStackView.Alignment.center
        verticalStackView2.spacing   = 10.0
        verticalStackView2.translatesAutoresizingMaskIntoConstraints = false
        
        let StackView   = UIStackView(arrangedSubviews: [verticalStackView, verticalStackView2])
        StackView.axis  = NSLayoutConstraint.Axis.horizontal
        StackView.distribution  = UIStackView.Distribution.equalSpacing
        StackView.alignment = UIStackView.Alignment.center
        StackView.spacing   = 10.0
        StackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(StackView)
        
        NSLayoutConstraint.activate([
            StackView.topAnchor.constraint(equalTo: toplabel.bottomAnchor),
            StackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            StackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -widthOfScreen/20),
//            StackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
//        print("sdfsdfsdds",StackView.frame.height,toplabel.bounds.height)
//        let tableWithCountries = UITableView(frame: CGRect(x: 0,
//                                                           y: 200,
//                                                           width: widthOfScreen,
//                                                           height: heightOfScreen/2),
//                                             style: .insetGrouped)
        
//        var x = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height/2))
//        x = tableWithCountries
        self.view.addSubview(tableWithCountries)
        tableWithCountries.frame = CGRect(x: 0, y: view.bounds.height/3, width: view.bounds.width, height: view.bounds.height/2)
        tableWithCountries.dataSource = self
        tableWithCountries.delegate = self
        
        tableWithCountries.topAnchor.constraint(equalTo: StackView.bottomAnchor, constant: -heightOfScreen/20).isActive = true
        tableWithCountries.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableWithCountries.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/2).isActive = true
        
        self.view.addSubview(cancelButton)
        self.view.addSubview(okeyButton)
        
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -widthOfScreen/4).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
        cancelButton.topAnchor.constraint(equalTo: tableWithCountries.bottomAnchor, constant: heightOfScreen/20).isActive = true
        
        okeyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: widthOfScreen/4).isActive = true
        okeyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        okeyButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
        okeyButton.topAnchor.constraint(equalTo: tableWithCountries.bottomAnchor, constant: heightOfScreen/20).isActive = true

    }
    
    private func setupCancelButton() {
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -widthOfScreen/4).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
        cancelButton.topAnchor.constraint(equalTo: tableWithCountries.bottomAnchor, constant: heightOfScreen/20).isActive = true
    }
    
    private func setupOkeyButton() {
        okeyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: widthOfScreen/4).isActive = true
        okeyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        okeyButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
        okeyButton.topAnchor.constraint(equalTo: tableWithCountries.bottomAnchor, constant: heightOfScreen/20).isActive = true
    }

}

extension NewListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableWithCountries.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableWithCountries.cellForRow(at: indexPath)?.accessoryType = .none
        } else{
            tableWithCountries.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
//        tableWithCountries.cellForRow(at: indexPath)?.isHighlighted = true
    }
    
}
extension NewListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewListTableViewCell.id, for: indexPath) as! NewListTableViewCell

        cell.object = self.array[indexPath.row]

        return cell
    }
    
    
}
