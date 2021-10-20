//
//  DividerView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2021/05/21.
//

import UIKit

class DividerView: BaseView {
    
    override func setupViews() {
        backgroundColor = .secondarySystemBackground
        
        snp.makeConstraints {
            $0.height.equalTo(1)
        }
    }
}
