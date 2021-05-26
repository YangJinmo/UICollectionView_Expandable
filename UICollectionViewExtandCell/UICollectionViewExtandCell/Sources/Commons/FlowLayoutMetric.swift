//
//  FlowLayoutMetric.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/25.
//

import UIKit

protocol FlowLayoutMetric {
    var numberOfItemForRow: CGFloat { get }
    var inset: CGFloat { get }
    var lineSpacing: CGFloat { get }
    var interItemSpacing: CGFloat { get }
    
    func flowLayout() -> UICollectionViewFlowLayout
}

extension FlowLayoutMetric {
    func flowLayout() -> UICollectionViewFlowLayout {
        return UICollectionViewFlowLayout().then {
            $0.sectionInset = .init(horizontal: inset, vertical: 0)
            $0.minimumLineSpacing = lineSpacing
            $0.minimumInteritemSpacing = interItemSpacing
        }
    }
    
    func itemSize(width view: UIView, height: CGFloat) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width - (inset * 2), height: height)
    }
}
