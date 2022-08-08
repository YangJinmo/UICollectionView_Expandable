//
//  UIScrollView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/08/06.
//

import UIKit

extension UIScrollView {
    convenience init(scrollIndicator: Bool) {
        self.init(frame: .zero)

        showsVerticalScrollIndicator = scrollIndicator
        showsHorizontalScrollIndicator = scrollIndicator
    }
}
