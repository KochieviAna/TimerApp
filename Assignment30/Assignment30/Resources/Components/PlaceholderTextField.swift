//
//  PlaceholderTextField.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import SwiftUI

struct PlaceholderTextField: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var alignment: TextAlignment = .leading
    var frameWidth: CGFloat = 350
    var frameHeight: CGFloat = 39
    
    var body: some View {
        ZStack(alignment: alignment == .center ? .center : .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.primaryWhite.opacity(0.5))
                    .padding(alignment == .center ? .all : .leading, 8)
            }
            TextField("", text: $text)
                .keyboardType(keyboardType)
                .multilineTextAlignment(alignment)
                .foregroundColor(.primaryWhite)
                .padding(.leading, 8)
        }
        .frame(width: frameWidth, height: frameHeight)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryGrey))
    }
}

#Preview {
    PlaceholderTextField(
        placeholder: "სთ",
        text: .constant(""),
        alignment: .center,
        frameWidth: 110
    )
}
