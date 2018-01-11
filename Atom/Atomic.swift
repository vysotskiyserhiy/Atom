//
//  Atomic.swift
//  Atom
//
//  Created by Serhiy Vysotskiy on 1/11/18.
//  Copyright © 2018 Serhiy Vysotskiy. All rights reserved.
//

import Foundation

class Atomic<A> {
    private let queue = DispatchQueue(label: UUID().uuidString)
    private var _value: A

    init(_ value: A) {
        _value = value
    }

    var value: A {
        return queue.sync(flags: .barrier) { _value }
    }

    func map<M>(_ transform: (A) throws -> M) ->M? {
        return queue.sync(execute: { () -> M? in
            return try? transform(_value)
        })
    }

    @discardableResult
    func mutate<M>(_ transform: (inout A) throws -> M) rethrows -> M {
        return try queue.sync(flags: .barrier) {
            return try transform(&_value)
        }
    }
}
