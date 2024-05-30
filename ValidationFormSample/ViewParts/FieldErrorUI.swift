//
//  FieldErrorUI.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import SwiftUI

extension View {
    
    func errorStyled(_ state: FieldErrorState) -> some View {
        environment(\.fieldErrorState, state)
    }
}

struct FieldErrorState {
    let isActive: Bool
    let errorMessage: String?
    
    static let sampleError = FieldErrorState(isActive: true, errorMessage: "エラーが発生しました")
}

struct FieldErrorStateEnvironmentKey: EnvironmentKey {
    static let defaultValue = FieldErrorState(isActive: false, errorMessage: nil)
}

extension EnvironmentValues {
    var fieldErrorState: FieldErrorState {
        get { self[FieldErrorStateEnvironmentKey.self] }
        set { self[FieldErrorStateEnvironmentKey.self] = newValue }
    }
}

struct FieldErrorText: View {
    
    let errorMessage: String?
    
    var body: some View {
        Text(errorMessage ?? "")
            .foregroundStyle(.red)
            .font(.footnote)
            .frame(height: 18)
    }
}
