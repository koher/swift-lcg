import XCTest
@testable import SwiftLCG

final class LinearCongruentialRandomNumberGeneratorTests: XCTestCase {
    func testExample() {
        var random = LinearCongruentialRandomNumberGenerator(seed: 42)
        let x: Int = (1 ... 100).randomElement(using: &random)!
        let y: Bool = Bool.random(using: &random)
        let z: Double = Double.random(in: 0.0 ..< 1.0, using: &random)

        XCTAssertEqual(x, 32)
        XCTAssertEqual(y, false)
        XCTAssertEqual(z, 0.6130834267986173)
    }

    func testDistribution() {
        var random = LinearCongruentialRandomNumberGenerator(seed: 42)
        var counts: [Int] = .init(repeating: 0, count: 100)
        for _ in 0 ..< 10_000 {
            let x = (0 ..< 100).randomElement(using: &random)!
            counts[x] += 1
        }

        for count in counts {
            XCTAssertGreaterThan(count, 80)
        }
    }

    func testReproducibility() {
        var random = LinearCongruentialRandomNumberGenerator(seed: 42)
        let x1 = random.next()
        let y1 = random.next()
        let z1 = random.next()

        random = LinearCongruentialRandomNumberGenerator(seed: 42)
        let x2 = random.next()
        let y2 = random.next()
        let z2 = random.next()

        XCTAssertEqual(x1, x2)
        XCTAssertEqual(y1, y2)
        XCTAssertEqual(z1, z2)
    }

    func testValueSemantics() {
        var random1 = LinearCongruentialRandomNumberGenerator(seed: 42)
        var random2 = random1

        let x1 = random1.next()
        let y1 = random1.next()
        let z1 = random1.next()

        let x2 = random2.next()
        let y2 = random2.next()
        let z2 = random2.next()

        XCTAssertEqual(x1, x2)
        XCTAssertEqual(y1, y2)
        XCTAssertEqual(z1, z2)
    }
}
