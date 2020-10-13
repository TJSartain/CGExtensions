//
//  CGVectorExtensions.swift
//  CGExtensions
//
//  Created by TJ Sartain on 2/7/20.
//  Copyright © 2020 iTrinity, Inc. All rights reserved.
//

import CoreGraphics

extension CGVector
{
    public init(_ dx: CGFloat, _ dy: CGFloat)
    {
        self.init(dx: dx, dy: dy)
    }
    
    public init(from pt1: CGPoint, to pt2: CGPoint)
    {
        self.init(dx: pt2.x - pt1.x, dy: pt2.y - pt1.y)
    }
    
    public init(magnitude m: CGFloat, angle a: CGFloat)
    {
        self.init(dx: m * cos(a), dy: m * sin(a))
    }
    
    public var magnitude: CGFloat
    {
        sqrt(magnitudeSquared)
    }

    public var magnitudeSquared: CGFloat
    {
        dx*dx + dy*dy
    }

    public var manhattanMagnitude: CGFloat
    {
        abs(dx) + abs(dy)
    }
    
    public var normalized: CGVector
    {
        var vector = self
        vector.normalize()
        return vector
    }
    
    public static func + (left: CGVector, right: CGVector) -> CGVector
    {
        CGVector(left.dx + right.dx, left.dy + right.dy)
    }

    public static func - (left: CGVector, right: CGVector) -> CGVector
    {
        CGVector(left.dx - right.dx, left.dy - right.dy)
    }

    public static func * (left: CGFloat, right: CGVector) -> CGVector
    {
        CGVector(left * right.dx, left * right.dy)
    }

    public static func * (left: CGVector, right: CGFloat) -> CGVector
    {
        CGVector(left.dx * right, left.dy * right)
    }

    public static func / (left: CGVector, right: CGFloat) -> CGVector
    {
        CGVector(left.dx / right, left.dy / right)
    }

    public static prefix func - (vector: CGVector) -> CGVector
    {
        CGVector(-vector.dx, -vector.dy)
    }

    public static func += (left: inout CGVector, right: CGVector)
    {
        left = left + right
    }

    public static func -= (left: inout CGVector, right: CGVector)
    {
        left = left - right
    }

    public static func *= (left: inout CGVector, right: CGFloat)
    {
        left = left * right
    }

    public static func /= (left: inout CGVector, right: CGFloat)
    {
        left = left / right
    }
    
    public mutating func normalize()
    {
        let m = magnitude
        if m > 0 {
            dx /= m
            dy /= m
        }
    }
    
    public func dot(_ other: CGVector) -> CGFloat
    {
        dx*other.dx + dy*other.dy
    }

    public func cross(_ other: CGVector) -> CGFloat
    {
        dx*other.dy - dy*other.dx
    }
}
