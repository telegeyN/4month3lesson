//
//  Font.swift
//  4month3lesson
//
//  Created by Telegey Nurbekova on 20/02/24.
//

import UIKit

enum Fonts: String {
    case bold = "Poppins-Bold"
    case light = "Poppins-ExtraLight"
    case regular = "Poppins-Regular"
    case medium = "Outfit-Medium"
    case boldOutfit = "Outfit-Bold"
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: rawValue, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
