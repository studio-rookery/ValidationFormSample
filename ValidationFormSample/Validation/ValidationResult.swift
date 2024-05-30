//
//  ValidationResult.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import Foundation

enum ValidationResult<Value> {
    case success(Value)
    case failed
    
    func map<R>(_ transform: (Value) -> R) -> ValidationResult<R> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failed:
            return .failed
        }
    }
    
    var successValue: Value? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
}
