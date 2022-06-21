//
//  Identifiable.swift
//  UICollectionView_Extandable
//
//  Created by JMY on 2022/06/21.
//

import UIKit

protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Identifiable {
}

extension UITableViewHeaderFooterView: Identifiable {
}

extension UICollectionReusableView: Identifiable {
}

extension UIViewController: Identifiable {
}
