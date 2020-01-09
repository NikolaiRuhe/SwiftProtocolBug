import Foundation


public protocol A: Identifiable, ExpressibleByIntegerLiteral {
    init(_ id: Int)
}

extension A {
    public init(integerLiteral: Int) { self.init(integerLiteral) }
}

public struct AA: A {
    public var id: Int
    public init(_ id: Int) { self.id = id }
}


public protocol B: Identifiable, CustomStringConvertible where ID == Int {}

extension B {
    public var description: String { String(describing: id) }
}

public struct BB: B {
    public var id: Int
    public init(_ id: Int) { self.id = id }
}
