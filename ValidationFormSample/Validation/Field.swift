//
//  Field.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import Foundation

@propertyWrapper
struct Field<Value: Equatable> {
    
    var wrappedValue: Value {
        didSet {
            guard wrappedValue != oldValue else {
                return
            }
            isErrorActive = false
        }
    }
    var isErrorActive = false
    var errorMessage: String?
    
    var rawValue: Value {
        get { wrappedValue }
        set { wrappedValue = newValue }
    }
    
    var projectedValue: Field<Value> {
        get { self }
        set { self = newValue }
    }
    
    var errorState: FieldErrorState {
        FieldErrorState(isActive: isErrorActive, errorMessage: errorMessage)
    }
    
    mutating func clearError() {
        isErrorActive = false
        errorMessage = nil
    }
}

extension Field {
    
    mutating func validate<R>(byTransform transform: (Value) -> R?, with rule: ValidationRule<R>, errorMessage: String) -> ValidationResult<R> {
        guard let transformed = transform(wrappedValue), rule.validate(transformed) else {
            self.errorMessage = errorMessage
            isErrorActive = true
            return .failed
        }
        return .success(transformed)
    }
    
    mutating func validate(with rule: ValidationRule<Value>, errorMessage: String) -> ValidationResult<Value> {
        guard rule.validate(wrappedValue) else {
            self.errorMessage = errorMessage
            isErrorActive = true
            return .failed
        }
        return .success(wrappedValue)
    }
    
    mutating func validateNotNil<R>(errorMessage: String) -> ValidationResult<R> where Value == R? {
        guard let wrappedValue else {
            self.errorMessage = errorMessage
            isErrorActive = true
            return .failed
        }
        return .success(wrappedValue)
    }
}
