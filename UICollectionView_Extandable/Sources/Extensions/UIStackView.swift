//
//  UIStackView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/08/06.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal, spacing: CGFloat = 0) {
        self.init(frame: .zero)

        self.axis = axis
        self.spacing = spacing
    }

    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }

    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
