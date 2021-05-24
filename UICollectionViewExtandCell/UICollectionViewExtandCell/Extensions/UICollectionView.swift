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
        register(T.self, forCellWithReuseIdentifier: T.description)
    }
}
