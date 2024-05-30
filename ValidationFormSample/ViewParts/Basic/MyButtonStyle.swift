//
//  MyButtonStyle.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .bold()
            .frame(minWidth: 120, minHeight: 52)
            .background(.tint, in: Capsule())
            .brightness(configuration.isPressed ? -0.05 : 0)
    }
}

extension ButtonStyle where Self == MyButtonStyle {
    
    static var myButtonStyle: MyButtonStyle { .init() }
}
