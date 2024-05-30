//
//  MyTextField.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import SwiftUI

struct MyTextField: View {
    
    @Environment(\.fieldErrorState) var fieldErrorState
    @Environment(\.isEnabled) var isEnabled
    
    let name: String
    @Binding var text: String
    
    var body: some View {
        FieldView(name: name) {
            TextField(name, text: $text)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(.quinary, in: Capsule())
                .overlay {
                    Capsule()
                        .strokeBorder(.red, lineWidth: fieldErrorState.isActive ? 1 : 0)
                }
            FieldErrorText(errorMessage: fieldErrorState.errorMessage)
        }
        .opacity(isEnabled ? 1 : 0.35)
    }
}

#Preview {
    VStack {
        MyTextField(name: "ID", text: .constant("test"))
        MyTextField(name: "ID", text: .constant("test"))
            .environment(\.fieldErrorState, .sampleError)
    }
    .padding()
}
