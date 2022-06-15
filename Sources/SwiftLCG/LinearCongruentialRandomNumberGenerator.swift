public struct LinearCongruentialRandomNumberGenerator: RandomNumberGenerator {
    private var x: UInt64

    public init(seed: UInt64) {
        self.x = seed
    }

    public mutating func next() -> UInt64 {
        x = 0x5d588b656c078965 &* x &+ 0x269ec3
        return x
    }
}
