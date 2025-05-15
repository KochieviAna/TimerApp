//
//  Font+Extention.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import SwiftUI

extension Font {
    static func interMedium(size: CGFloat) -> Font {
        return Font.custom("Inter_18pt-Medium", size: size)
    }
    
    static func interRegular(size: CGFloat) -> Font {
        return Font.custom("Inter_18pt-Regular", size: size)
    }
    
    static func interBold(size: CGFloat) -> Font {
        return Font.custom("Inter_24pt-Bold", size: size)
    }
    
    static func robotoBold(size: CGFloat) -> Font {
        return Font.custom("Roboto-Bold", size: size)
    }
    
    static func robotoRegular(size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
}
