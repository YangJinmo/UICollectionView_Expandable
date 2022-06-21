//
//  UIView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2021/05/21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
