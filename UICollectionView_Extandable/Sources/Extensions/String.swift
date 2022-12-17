//
//  String.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/06/21.
//

import UIKit

extension String {
    var source: String {
        let components = components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!.components(separatedBy: ".").first!
    }

    func log(filename: String = #file, line: Int = #line, function: String = #function, _ comment: String = "") {
        print("\(Date().toString()) [\(filename.source):\(line)] \(function) \(comment)\(self)")
    }
}
