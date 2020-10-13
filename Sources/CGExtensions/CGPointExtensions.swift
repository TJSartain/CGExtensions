//
//  CGPointExtensions.swift
//  CGExtensions
//
//  Created by TJ Sartain on 5/11/20.
//  Copyright © 2020 Penske Logistics. All rights reserved.
//

import UIKit

extension CGPoint: Hashable
{
    public init(_ x: CGFloat, _ y: CGFloat)
    {
        self.init(x: x, y: y)
    }
    
    public init(pt: CGPoint, m: CGFloat, angle a: CGFloat)
    {
        self.init(pt.x + m * cos(a), pt.y + m * sin(a))
    }
    
    public func vector(to other: CGPoint) -> CGVector
    {
        CGVector(other.x - x, other.y - y)
    }
    
    public static func == (left: CGPoint, right: CGPoint) -> Bool
    {
        left.x.equals(right.x) && left.y.equals(right.y)
    }
    
    public static prefix func - (pt: CGPoint) -> CGPoint
    {
        CGPoint(-pt.x, -pt.y)
    }
    
    public static func + (left: CGPoint, right: CGPoint) -> CGPoint
    {
        CGPoint(left.x + right.x, left.y + right.y)
    }
    
    public static func + (left: CGPoint, right: CGVector) -> CGPoint
    {
        CGPoint(left.x + right.dx, left.y + right.dy)
    }
    
    public static func - (left: CGPoint, right: CGPoint) -> CGPoint
    {
        CGPoint(left.x - right.x, left.y - right.y)
    }
    
    public static func - (left: CGPoint, right: CGVector) -> CGPoint
    {
        CGPoint(left.x - right.dx, left.y - right.dy)
    }
    
    public static func += (lhs: inout CGPoint, rhs: CGVector)
    {
        lhs = lhs + rhs
    }
    
    public static func -= (lhs: inout CGPoint, rhs: CGVector)
    {
        lhs = lhs - rhs
    }
    
    public func distance(to other: CGPoint) -> CGFloat
    {
        let dx = x - other.x
        let dy = y - other.y
        return sqrt(dx*dx + dy*dy)
    }
    
    public func manhattanDistance(to other: CGPoint) -> CGFloat
    {
        vector(to: other).manhattanMagnitude
    }
    
    public func midpoint(_ other: CGPoint) -> CGPoint
    {
        CGPoint((x + other.x) / 2, (y + other.y) / 2)
    }
    
    public func extend(length: CGFloat, angle: CGFloat) -> CGPoint
    {
        CGPoint(x + length * cos(angle), y + length * sin(angle))
    }
    
    public func extend(toward other: CGPoint, amt: CGFloat) -> CGPoint
    {
        let d = amt / distance(to: other)
        return extend(toward: other, pct: d)
    }
    
    public func extend(toward other: CGPoint, pct: CGFloat) -> CGPoint
    {
        CGPoint(lerp(x, other.x, pct), lerp(y, other.y, pct))
    }
    
    private func lerp(_ start: CGFloat, _ end: CGFloat, _ pct: CGFloat) -> CGFloat
    {
        return start + pct * (end-start)
    }
    
    public func between(_ a: CGPoint, _ b: CGPoint) -> Bool
    {
        x.between(a.x, b.x) && y.between(a.y, b.y)
    }
    
    public func near(_ pt: CGPoint, _ range: CGFloat) -> Bool
    {
        distance(to: pt) <= range
    }
    
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(x)
        hasher.combine(y)
    }
}
