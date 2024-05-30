//
//  RegisterFormView.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import SwiftUI

struct RegisterFormView: View {
    
    @State var form = RegisterForm()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                MyTextField(name: "ID", text: $form.id)
                    .errorStyled(form.$id.errorState)
                MyTextField(name: "PW", text: $form.password)
                    .errorStyled(form.$password.errorState)
                FruitPicker(name: "好きなフルーツ", selection: $form.favoriteFruit)
                    .errorStyled(form.$favoriteFruit.errorState)
                Toggle("プロフィールを入力する", isOn: $form.includesProfile.animation())
                    .font(.subheadline)
                Group {
                    MyTextField(name: "ニックネーム", text: $form.nickName)
                        .errorStyled(form.$nickName.errorState)
                    MyTextField(name: "年齢", text: $form.age)
                        .errorStyled(form.$age.errorState)
                }
                .disabled(!form.includesProfile)
                Button("登録") {
                    register()
                }
                .buttonStyle(.myButtonStyle)
            }
            .padding()
        }
    }
    
    func register() {
        Task {
            switch form.validate() {
            case .success(let request):
                await API.send(request)
            case .failed:
                break
            }
        }
    }
}

#Preview {
    RegisterFormView()
}
