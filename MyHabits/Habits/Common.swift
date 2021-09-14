//
//  Common.swift
//  MyHabits
//
//  Created by Alexander Petrovichev on 27.08.2021.
//

import UIKit

typealias Function = (() -> Void)

extension UIView {
    func roundCornersWithRadius(_ radius:CGFloat, top: Bool? = true, bottom: Bool? = true, shadowEnabled: Bool = true) {
        var maskedCorners = CACornerMask()
        clipsToBounds = true
        if shadowEnabled {
            layer.masksToBounds = false
            layer.shadowOpacity = 0.5
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 4
            layer.shadowOffset = CGSize(width: 4, height: 4)
        }
        switch (top, bottom) {
        case (true, false):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case (false,true):
            maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case (true, true):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        default:
            break
        }
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
    }
    
}
