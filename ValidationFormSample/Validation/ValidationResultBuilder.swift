//
//  ValidationResultBuilder.swift
//  ValidationFormSample
//
//  Created by masaki on 2024/05/30.
//

import Foundation

@resultBuilder
enum ValidationResultBuilder {
    
    static func buildExpression<Content>(_ expression: Content) -> ValidationResult<Content> {
        .success(expression)
    }
    
    static func buildExpression<Content>(_ expression: ValidationResult<Content>) -> ValidationResult<Content> {
        expression
    }
    
    static func buildBlock<Content>(_ result: ValidationResult<Content>) -> ValidationResult<Content> {
        result
    }
    
    static func buildOptional<Component>(_ component: ValidationResult<Component>?) -> ValidationResult<Component?> {
        guard let component else {
            return .success(nil)
        }
        switch component {
        case .success(let value):
            return .success(value)
        case .failed:
            return .failed
        }
    }
    
    static func buildEither<Content>(first: ValidationResult<Content>) -> ValidationResult<Content> {
        first
    }
    
    static func buildEither<Content>(second: ValidationResult<Content>) -> ValidationResult<Content> {
        second
    }
    
    static func buildBlock() -> ValidationResult<Void> {
        .success(())
    }
    
    static func buildBlock<C0, C1>(_ c0: ValidationResult<C0>, _ c1: ValidationResult<C1>) -> ValidationResult<(C0, C1)> {
        guard let c0 = c0.successValue, let c1 = c1.successValue else { return .failed }
        return .success((c0, c1))
    }

    static func buildBlock<C0, C1, C2>(_ c0: ValidationResult<C0>, _ c1: ValidationResult<C1>, _ c2: ValidationResult<C2>) -> ValidationResult<(C0, C1, C2)> {
        guard let c0 = c0.successValue, let c1 = c1.successValue, let c2 = c2.successValue else { return .failed }
        return .success((c0, c1, c2))
    }

    static func buildBlock<C0, C1, C2, C3>(_ c0: ValidationResult<C0>, _ c1: ValidationResult<C1>, _ c2: ValidationResult<C2>, _ c3: ValidationResult<C3>) -> ValidationResult<(C0, C1, C2, C3)> {
        guard let c0 = c0.successValue, let c1 = c1.successValue, let c2 = c2.successValue, let c3 = c3.successValue else { return .failed }
        return .success((c0, c1, c2, c3))
    }

    static func buildBlock<C0, C1, C2, C3, C4>(_ c0: ValidationResult<C0>, _ c1: ValidationResult<C1>, _ c2: ValidationResult<C2>, _ c3: ValidationResult<C3>, _ c4: ValidationResult<C4>) -> ValidationResult<(C0, C1, C2, C3, C4)> {
        guard let c0 = c0.successValue, let c1 = c1.successValue, let c2 = c2.successValue, let c3 = c3.successValue, let c4 = c4.successValue else { return .failed }
        return .success((c0, c1, c2, c3, c4))
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: ValidationResult<C0>, _ c1: ValidationResult<C1>, _ c2: ValidationResult<C2>, _ c3: ValidationResult<C3>, _ c4: ValidationResult<C4>, _ c5: ValidationResult<C5>) -> ValidationResult<(C0, C1, C2, C3, C4, C5)> {
        guard let c0 = c0.successValue, let c1 = c1.successValue, let c2 = c2.successValue, let c3 = c3.successValue, let c4 = c4.successValue, let c5 = c5.successValue else { return .failed }
        return .success((c0, c1, c2, c3, c4, c5))
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: ValidationResult<C0>, _ c1: ValidationResult<C1>, _ c2: ValidationResult<C2>, _ c3: ValidationResult<C3>, _ c4: ValidationResult<C4>, _ c5: ValidationResult<C5>, _ c6: ValidationResult<C6>) -> ValidationResult<(C0, C1, C2, C3, C4, C5, C6)> {
        guard let c0 = c0.successValue, let c1 = c1.successValue, let c2 = c2.successValue, let c3 = c3.successValue, let c4 = c4.successValue, let c5 = c5.successValue, let c6 = c6.successValue else { return .failed }
        return .success((c0, c1, c2, c3, c4, c5, c6))
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: ValidationResult<C0>, _ c1: ValidationResult<C1>, _ c2: ValidationResult<C2>, _ c3: ValidationResult<C3>, _ c4: ValidationResult<C4>, _ c5: ValidationResult<C5>, _ c6: ValidationResult<C6>, _ c7: ValidationResult<C7>) -> ValidationResult<(C0, C1, C2, C3, C4, C5, C6, C7)> {
        guard let c0 = c0.successValue, let c1 = c1.successValue, let c2 = c2.successValue, let c3 = c3.successValue, let c4 = c4.successValue, let c5 = c5.successValue, let c6 = c6.successValue, let c7 = c7.successValue else { return .failed }
        return .success((c0, c1, c2, c3, c4, c5, c6, c7))
    }
}

extension ValidationResult {
    
    static func combine(@ValidationResultBuilder _ block: () -> ValidationResult<Value>) -> Self {
        block()
    }
}
