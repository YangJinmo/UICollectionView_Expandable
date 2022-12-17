//
//  Date.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/10/04.
//

import Foundation.NSDate

extension Date {
    func toString(dateFormat: String = "yyyy.MM.dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
