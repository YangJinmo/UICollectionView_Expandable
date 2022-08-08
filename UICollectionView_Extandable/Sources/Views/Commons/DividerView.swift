//
//  DividerView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2021/05/21.
//

import UIKit

class DividerView: BaseView {
    // MARK: - Methods

    override func commonInit() {
        backgroundColor = .secondarySystemBackground

        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
