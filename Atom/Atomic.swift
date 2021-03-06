//
//  Atomic.swift
//  Atom
//
//  Created by Serhiy Vysotskiy on 1/11/18.
//  Copyright © 2018 Serhiy Vysotskiy. All rights reserved.
//

import Foundation

public class Atomic<A> {
    private let queue = DispatchQueue(label: UUID().uuidString)
    private var _value: A

    public init(_ value: A) {
        _value = value
    }

    public var value: A {
        return queue.sync(flags: .barrier) { _value }
    }

    @discardableResult
    public func mutate<M>(_ transform: (inout A) throws -> M) rethrows -> M {
        return try queue.sync(flags: .barrier) { try transform(&_value) }
    }
    
    public func update<P>(keyPath: WritableKeyPath<A, P>, with new: P) {
        mutate { $0[keyPath: keyPath] = new }
    }
}
