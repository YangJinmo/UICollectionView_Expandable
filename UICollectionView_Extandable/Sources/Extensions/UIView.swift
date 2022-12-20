//
//  UIView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2021/05/21.
//

import UIKit

extension UIView {
    var navigationBarHeight: CGFloat {
        return 44
    }

    var tabBarHeight: CGFloat {
        return 49
    }

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }

    func setBottomShadow() {
        setShadow(x: 0, y: 1.6, blur: 1.6, alpha: 0.04)
    }

    func hideShadow() {
        layer.shadowOpacity = 0
    }

    func setShadow(
        x: CGFloat,
        y: CGFloat,
        blur: CGFloat,
        alpha: Float
    ) {
        layer.masksToBounds = false
        // layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = alpha
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let bezierPath = UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )

            let shapeLayer = CAShapeLayer()
            // shapeLayer.frame = bounds
            shapeLayer.path = bezierPath.cgPath

            layer.mask = shapeLayer
        }
    }
}
