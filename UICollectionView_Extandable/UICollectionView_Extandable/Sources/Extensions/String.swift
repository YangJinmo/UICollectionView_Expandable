//
//  String.swift
//  UICollectionView_Extandable
//
//  Created by JMY on 2022/06/21.
//

import UIKit

extension String {
    func log(function: String = #function, _ comment: String = "") {
        print("func \(function) \(comment)\(self)")
    }
}
