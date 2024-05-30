//
//  RegisterForm.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import Foundation

struct RegisterForm {
    
    @Field var id = ""
    @Field var password = ""
    @Field var favoriteFruit: Fruit?
    
    var includesProfile = false
    
    @Field var nickName = ""
    @Field var age = ""
    
    mutating func validate() -> ValidationResult<RegisterRequest> {
        $id.clearError()
        $password.clearError()
        $favoriteFruit.clearError()
        $nickName.clearError()
        $age.clearError()
        
        return ValidationResult.combine {
            $id.validate(
                with: .count(isIn: 1 ... 20) && .isOnlyAlphanumeric,
                errorMessage: "IDは1~20文字以内の英数字で入力してください"
            )
            $password.validate(
                with: .count(isIn: 1 ... 20),
                errorMessage: "パスワードは1~20文字以内で入力してください"
            )
            $favoriteFruit.validateNotNil(
                errorMessage: "好きなフルーツを選択してください"
            )
            if includesProfile {
                validateProfile()
            }
        }
        .map(RegisterRequest.init)
    }
    
    mutating func validateProfile() -> ValidationResult<RegisterRequest.Profile> {
        ValidationResult.combine {
            $nickName.validate(
                with: .count(isIn: 1 ... 20),
                errorMessage: "ニックネームは1~20文字以内で入力してください"
            )
            $age.validate(
                byTransform: Int.init,
                with: .range(in: 0 ... 999),
                errorMessage: "年齢は0〜999の範囲で入力してください"
            )
        }
        .map(RegisterRequest.Profile.init)
    }
}
