//
//  UIApplication+Extention.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        if let scene = connectedScenes.first as? UIWindowScene {
            if let window = scene.windows.first {
                window.endEditing(true)
            }
        }
    }
}
