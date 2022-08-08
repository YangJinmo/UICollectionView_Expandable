//
//  UIViewController.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/08/06.
//

import UIKit.UIViewController

extension UIViewController {
    var tabBarHeight: CGFloat {
        if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
            return visibleViewController.tabBarHeight
        }

        return tabBarController?.tabBar.frame.height ?? 49
    }

    var navigationBarHeight: CGFloat {
        if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
            return visibleViewController.navigationBarHeight
        }

        return navigationController?.navigationBar.frame.height ?? 56
    }

    // MARK: - Modal

    func present(_ viewControllerToPresent: UIViewController, completion: (() -> Void)? = nil) {
        (viewControllerToPresent as? BaseTabViewController)?.addDismissButton()

        present(viewControllerToPresent, animated: true, completion: completion)
    }

    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }

    // MARK: - Navigation Controller

    func presentWithNavigationController(_ rootViewController: UIViewController, completion: (() -> Void)? = nil) {
        (rootViewController as? BaseTabViewController)?.addDismissButton()

        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.isNavigationBarHidden = true
        present(navigationController, completion: completion)
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool = true, hidesBottomBarWhenPushed: Bool = true) {
        (viewController as? BaseTabViewController)?.addPopButton()

        viewController.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func popViewController() {
        navigationController?.popViewController(animated: true)
    }

    func popToViewController(_ viewController: UIViewController) {
        navigationController?.popToViewController(viewController, animated: true)
    }

    func popToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
}
