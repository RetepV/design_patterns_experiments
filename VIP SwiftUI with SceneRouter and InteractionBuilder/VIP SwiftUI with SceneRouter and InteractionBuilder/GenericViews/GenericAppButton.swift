//
//  GenericAppButton.swift
//  VIP SwiftUI with router and linkbuilder
//
//  Created by Peter de Vroomen on 24-11-2025.
//

import SwiftUI

struct GenericAppButton: View {
    
    var label: String = "Default"
    var labelColor: Color = .white
    
    var buttonColor: Color = Color(red: 0.274, green: 0.649, blue: 0.265)
    
    var borderColor: Color = Color(red: 0.167, green: 0.394, blue: 0.161)
    var borderWidth: CGFloat = 2
    
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(buttonColor)
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(borderColor, lineWidth: borderWidth)
                )
                .layoutPriority(-100)
            Text(label)
                .foregroundStyle(labelColor)
                .padding(EdgeInsets(top: borderWidth,
                                    leading: borderWidth + 8,
                                    bottom: borderWidth,
                                    trailing: borderWidth + 8))
        }
    }
}

#Preview {
    GenericAppButton(label: "Hi")
}
