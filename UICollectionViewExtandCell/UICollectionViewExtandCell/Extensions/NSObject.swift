//
//  NSObject.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/21.
//

import Foundation

extension NSObject {
    
    // MARK: - Variables
    
    // Creates a string representing the given value.
    static var description: String {
        return String(describing: self)
    }
    
    // Returns the dynamic type of a value.
    public var dynamicType: String {
        return type(of: self).description
    }
}
