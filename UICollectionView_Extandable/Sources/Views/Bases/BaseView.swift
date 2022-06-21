//
//  BaseView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2021/05/20.
//

import UIKit

class BaseView: UIView {
    // MARK: - Initialization

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    func setupViews() {
    }
}
