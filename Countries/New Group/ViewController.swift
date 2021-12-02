//
//  ViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 29.11.2021.
//

import UIKit

let viewControllerToPresent = ContinentsViewController()

final class ViewController: UIViewController {
    
    private func showMyViewControllerInACustomizedSheet() {
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        showMyViewControllerInACustomizedSheet()
        DispatchQueue.main.async {
            self.tabBarController?.selectedIndex = 0
        }
    }
}
