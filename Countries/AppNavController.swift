//
//  AppNavController.swift
//  Countries
//
//  Created by Артем Соловьев on 30.11.2021.
//

import UIKit

class AppNavController: UINavigationController, HalfModalPresentable {
    
    let VC = ViewController()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isHalfModalMaximized() ? .default : .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let halfModalTransitioningDelegate = HalfModalTransitioningDelegate(viewController: self, presentingViewController: VC)

        VC.modalPresentationStyle = .custom
        VC.transitioningDelegate = halfModalTransitioningDelegate
        self.present(VC, animated: true, completion: nil)
    }

}
