//
//  Models.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import Foundation

enum Fruit: String, CaseIterable {
    case apple = "🍎"
    case banana = "🍌"
    case cherry = "🍒"
}

struct RegisterRequest {
    
    struct Profile {
        let nickName: String
        let age: Int
    }
    
    let id: String
    let password: String
    let favoriteFruit: Fruit
    var profile: Profile? = nil
}

enum API {

    static func send(_ request: RegisterRequest) async {
        
    }
}
