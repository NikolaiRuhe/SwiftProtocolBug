import XCTest
import TestID



final class ABTests: XCTestCase {

    func testA() {
        let sut = AA(42)
        XCTAssert(sut.id == 42)
    }

    func testB() {
        let sut = BB(42)
        let string = "\(sut)"
        XCTAssertEqual(string, "42")
    }
}
