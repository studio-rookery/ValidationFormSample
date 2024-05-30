//
//  FruitPicker.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import SwiftUI

struct FruitPicker: View {
    
    @Environment(\.fieldErrorState) var fieldErrorState
    
    let name: String
    @Binding var selection: Fruit?
    
    var body: some View {
        FieldView(name: name) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach([nil] + Fruit.allCases, id: \.self) { fruit in
                        Button {
                            selection = fruit
                        } label: {
                            Text(fruit?.rawValue ?? "未選択")
                                .frame(width: 80, height: 38)
                                .foregroundStyle(fruit == selection ? .white : .black)
                                .background(fruit == selection ? tint : quinary, in: Capsule())
                                .font(.subheadline)
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.red, lineWidth: fieldErrorState.isActive ? 1 : 0)
                                }
                        }
                    }
                }
                .buttonStyle(.plain)
            }
            FieldErrorText(errorMessage: fieldErrorState.errorMessage)
        }
    }
    
    var tint: AnyShapeStyle {
        AnyShapeStyle(TintShapeStyle())
    }
    
    var quinary: AnyShapeStyle {
        AnyShapeStyle(HierarchicalShapeStyle.quinary)
    }
}

#Preview {
    VStack {
        FruitPicker(name: "好きなフルーツ", selection: .constant(.apple))
        FruitPicker(name: "好きなフルーツ", selection: .constant(.apple))
            .environment(\.fieldErrorState, .sampleError)
    }
    .padding()
}
