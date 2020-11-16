//
//  UIColor+Ext.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/16/20.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xFF, green: (netHex >> 8) & 0xFF, blue: netHex & 0xFF)
    }

    convenience init(netHex: Int, alpha: CGFloat) {
        self.init(red: CGFloat((netHex >> 16) & 0xFF) / 255.0, green: CGFloat((netHex >> 8) & 0xFF) / 255.0, blue: CGFloat(netHex & 0xFF) / 255.0, alpha: alpha)
    }
}
