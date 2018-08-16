# Atom

Create Atomic (thread safe) objects in swift. Improved version of objc.io Atomic

## Example

```swift
let count = 10000
        
let atomic = Atomic([Int](0..<count))

DispatchQueue.concurrentPerform(iterations: count) { (i) in
    let number = atomic.value[i]
    atomic.mutate { $0.append(number + i) }
}
```
