# CGExtensions

A collection of helpful functions and additions to various CoreGraphics structs.


CGFloat

    public var radians: CGFloat 
    public var degrees: CGFloat 

    public static let tolerance: CGFloat = 1e-12

    public func equals(_ x: CGFloat, _ tol: CGFloat? = .tolerance) -> Bool
    public func between(_ x: CGFloat, _ y: CGFloat) -> Bool
    public func fuzzyEqual(to other: CGFloat, _ tolerance: CGFloat) -> Bool


CGPoint

    public init(_ x: CGFloat, _ y: CGFloat)
    public init(pt: CGPoint, m: CGFloat, angle a: CGFloat)
    public func vector(to other: CGPoint) -> CGVector

    public func distance(to other: CGPoint) -> CGFloat
    public func manhattanDistance(to other: CGPoint) -> CGFloat
    public func midpoint(_ other: CGPoint) -> CGPoint
    public func extend(length: CGFloat, angle: CGFloat) -> CGPoint
    public func extend(toward other: CGPoint, amt: CGFloat) -> CGPoint
    public func extend(toward other: CGPoint, pct: CGFloat) -> CGPoint
    public func between(_ a: CGPoint, _ b: CGPoint) -> Bool
    public func near(_ pt: CGPoint, _ range: CGFloat) -> Bool

    public static func == (left: CGPoint, right: CGPoint) -> Bool
    public static prefix func - (pt: CGPoint) -> CGPoint
    public static func + (left: CGPoint, right: CGPoint) -> CGPoint
    public static func + (left: CGPoint, right: CGVector) -> CGPoint
    public static func - (left: CGPoint, right: CGPoint) -> CGPoint
    public static func - (left: CGPoint, right: CGVector) -> CGPoint
    public static func += (lhs: inout CGPoint, rhs: CGVector)
    public static func -= (lhs: inout CGPoint, rhs: CGVector)


CGSize

    public init(_ h: CGFloat, _ w: CGFloat)


CGRect

    public init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat)

    public func edgeInsets(_ insets: UIEdgeInsets) -> CGRect
    public func draw(fill: UIColor?, stroke: UIColor?, width: CGFloat?)


CGVector

    public init(_ dx: CGFloat, _ dy: CGFloat)
    public init(from pt1: CGPoint, to pt2: CGPoint)
    public init(magnitude m: CGFloat, angle a: CGFloat)

    public var magnitude: CGFloat
    public var magnitudeSquared: CGFloat
    public var manhattanMagnitude: CGFloat
    public var normalized: CGVector

    public static func + (left: CGVector, right: CGVector) -> CGVector
    public static func - (left: CGVector, right: CGVector) -> CGVector
    public static func * (left: CGFloat, right: CGVector) -> CGVector
    public static func * (left: CGVector, right: CGFloat) -> CGVector
    public static func / (left: CGVector, right: CGFloat) -> CGVector
    public static prefix func - (vector: CGVector) -> CGVector
    public static func += (left: inout CGVector, right: CGVector)
    public static func -= (left: inout CGVector, right: CGVector)
    public static func *= (left: inout CGVector, right: CGFloat)
    public static func /= (left: inout CGVector, right: CGFloat)

    public mutating func normalize()
    public func dot(_ other: CGVector) -> CGFloat
    public func cross(_ other: CGVector) -> CGFloat
