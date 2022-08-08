//
//  UIButton.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/08/08.
//

import UIKit.UIButton

extension UIButton {
    convenience init(
        _ titleText: String? = nil,
        _ titleFont: UIFont = .subtitle,
        _ titleColor: UIColor = .label
    ) {
        self.init(frame: .zero)

        setTitle(titleText, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
    }

    convenience init(
        _ image: UIImage? = nil,
        _ tintColor: UIColor = .label
    ) {
        self.init(frame: .zero)

        setImage(image, for: .normal)
        self.tintColor = tintColor
    }
}
