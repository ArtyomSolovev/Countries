//
//  ViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 29.11.2021.
//

import UIKit

class ViewController: UIViewController {
    func showMyViewControllerInACustomizedSheet() {
        let viewControllerToPresent = ContinentsViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
//            sheet.largestUndimmedDetentIdentifier = .medium
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//            sheet.prefersEdgeAttachedInCompactHeight = true
//            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
//    let VC = ContinentsViewController()

    override func viewWillAppear(_ animated: Bool) {
        showMyViewControllerInACustomizedSheet()
        DispatchQueue.main.async {
            self.tabBarController?.selectedIndex = 0
        }
//        view.backgroundColor = .none
//        let halfModalTransitioningDelegate = HalfModalTransitioningDelegate(viewController: self, presentingViewController: VC)
//
//        VC.modalPresentationStyle = .custom
//        VC.transitioningDelegate = halfModalTransitioningDelegate
//        self.present(VC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
