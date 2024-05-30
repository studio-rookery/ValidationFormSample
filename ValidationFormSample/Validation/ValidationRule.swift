//
//  ValidationRule.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import Foundation

struct ValidationRule<Value> {
    
    let validate: (Value) -> Bool
    
    static func && (_ lhs: Self, _ rhs: Self) -> Self {
        ValidationRule { value in
            lhs.validate(value) && rhs.validate(value)
        }
    }
}

extension ValidationRule where Value == String {
    
    static func count(isIn range: ClosedRange<Int>) -> Self {
        .init { value in
            range.contains(value.count)
        }
    }
    
    static var isOnlyAlphanumeric: Self {
        .init {
            !$0.isEmpty && $0.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
        }
    }
}

extension ValidationRule where Value: Collection {
    
    static var isNotEmpty: Self {
        .init {
            !$0.isEmpty
        }
    }
}

extension ValidationRule where Value: Comparable {
    
    static func range(in range: ClosedRange<Value>) -> Self {
        .init(validate: range.contains)
    }
}
