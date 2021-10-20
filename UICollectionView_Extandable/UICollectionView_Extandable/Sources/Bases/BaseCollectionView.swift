//
//  BaseCollectionView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2021/05/24.
//

import UIKit

class BaseCollectionView: UICollectionView {
    
    // MARK: - Convenience Initialization
    
    convenience init(layout: UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = .systemBackground
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
