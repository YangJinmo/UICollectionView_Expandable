//
//  UINavigationController.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/12/19.
//

import UIKit.UINavigationController

extension UINavigationController {
    convenience init(rootViewController: UIViewController, tabBarItem: UITabBarItem) {
        self.init(rootViewController: rootViewController)

        isNavigationBarHidden = true
        title = tabBarItem.title
        self.tabBarItem = tabBarItem
    }
}
