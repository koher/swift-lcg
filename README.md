# SwiftLCG

_SwiftLCG_ provides `LinearCongruentialRandomNumberGenerator`, which is an implementation of `RandomNumberGenerator` using linear congruential generators to produce pseudo-randomized numbers.

```swift
var random = LinearCongruentialRandomNumberGenerator(seed: 42)
let x: Int = (1 ... 100).randomElement(using: &random)!
let y: Bool = Bool.random(using: &random)
let z: Double = Double.random(in: 0.0 ..< 1.0, using: &random)
```

`LinearCongruentialRandomNumberGenerator` is useful to produce same sequences of pseudo-randomized numbers. `LinearCongruentialRandomNumberGenerator` instances initialized with same seeds always produce same sequences.  

## License

MIT
