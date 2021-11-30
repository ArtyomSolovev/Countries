//
//  ViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 29.11.2021.
//

import UIKit

class ViewController: UIViewController {

    let VC = YourSecondViewController()

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            
            self.tabBarController?.selectedIndex = 0
        }
        view.backgroundColor = .red
        
        let halfModalTransitioningDelegate = HalfModalTransitioningDelegate(viewController: self, presentingViewController: VC)

        VC.modalPresentationStyle = .custom
        VC.transitioningDelegate = halfModalTransitioningDelegate
        self.present(VC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class YourSecondViewController: UIViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = .cyan
    }
}
