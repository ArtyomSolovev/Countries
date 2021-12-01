//
//  SceneDelegate.swift
//  Countries
//
//  Created by Артем Соловьев on 29.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let scene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: scene)
            let tabs = createTabs()
            window.rootViewController = tabs
            self.window = window
            self.window?.makeKeyAndVisible()
        }
    }

}

class tabBarClass: UITabBarController {
    
}

private extension SceneDelegate {
    func createTabs() -> UITabBarController {
        let tabBar = tabBarClass()
        let navVC = UINavigationController()
        navVC.viewControllers = [TableViewController()]
        let VC = ViewController()
        navVC.tabBarItem = self.createProfileTab()
        VC.tabBarItem = self.createSkillsTab()
        let x = ContinentsViewController()

        tabBar.setViewControllers([navVC, VC,  x], animated: true)
        return tabBar
    }

    func createProfileTab() -> UITabBarItem {
        let item = UITabBarItem(title: "Countries", image: UIImage(systemName: "rectangle.grid.1x2.fill"), tag: 0)
        item.badgeColor = .red
        return item
    }

    func createSkillsTab() -> UITabBarItem {
        let item = UITabBarItem(title: "Continents", image: UIImage(systemName: "circle.fill"), tag: 1)
        return item
    }
}
