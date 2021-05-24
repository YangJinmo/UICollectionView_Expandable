//
//  UICollectionView.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/24.
//

import UIKit

extension UICollectionView {
    
    // MARK: - Methods
    
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
}

protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView {
    
}
