I'm experiencing a runtime crash with Swift under macOS 10.14.6 and iOS 12. I'm using
Xcode 11.3. The problem does not occur on macOS 10.15 or iOS 13. I'm building in
Xcode 11.3

I've narrowed the problem down to a minimal example. The problem is triggered when
accessing a type that conforms to (at least) two protocols: Identifiable and another Swift
standard protocol. Using a default implementation also seems necessary.

Example:

```
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

let sut = AA(42)     // EXC_BAD_ACCESS
```

Here's the stack:

|#0|0x00007fff7decfb1f in swift_getWitnessTable ()|
|---|---|
|#1|0x0000000106ba31ec in lazy protocol witness table accessor for type AA and conformance AA ()|
|#2|0x0000000106ba3156 in instantiation function for generic protocol witness table for AA ()|
|#3|0x00007fff7ded00c9 in swift_getWitnessTable ()|
|#4|0x0000000106ba24ac in lazy protocol witness table accessor for type AA and conformance AA ()|

[Here's a package](https://github.com/NikolaiRuhe/SwiftProtocolBug) that illustrates the problem.
It contains two slightly different unit tests which reliably crash (execute the unit tests in
Xcode or the shell: `swift test`).
