//
//  UICollectionView.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/24.
//

import UIKit

extension UICollectionView {
    
    // MARK: UICollectionViewCell
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UICollectionViewCell>(_: T.Type) {
        let bundle: Bundle = Bundle(for: T.self)
        let nib: UINib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    // MARK: UICollectionReusableView
    
    func registerHeader<T: UICollectionReusableView>(_: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerFooter<T: UICollectionReusableView>(_: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableViewHeader<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableViewFooter<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UIEdgeInsets {
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    static func uniform(size: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: size, left: size, bottom: size, right: size)
    }
}
