//
//  FieldView.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import SwiftUI

struct FieldView<Content: View>: View {
    
    let name: String
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.caption)
            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
