//
//  BaseView.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/20.
//

import UIKit

class BaseView: UIView {
    
    // MARK: - Convenience Initialization
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    
    func setupViews() {
        
    }
}
