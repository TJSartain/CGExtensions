//
//  CGPointExtensions.swift
//  ClerChain
//
//  Created by TJ Sartain on 5/11/20.
//  Copyright © 2020 Penske Logistics. All rights reserved.
//

import UIKit

extension CGPoint: Hashable
{
    init(_ x: CGFloat, _ y: CGFloat)
    {
        self.init(x: x, y: y)
    }
    
    init(pt: CGPoint, m: CGFloat, angle a: CGFloat)
    {
        self.init(pt.x + m * cos(a), pt.y + m * sin(a))
    }
    
    func vector(to other: CGPoint) -> CGVector
    {
        CGVector(other.x - x, other.y - y)
    }
    
    static func == (left: CGPoint, right: CGPoint) -> Bool
    {
        left.x.equals(right.x) && left.y.equals(right.y)
    }
    
    static prefix func - (pt: CGPoint) -> CGPoint
    {
        CGPoint(-pt.x, -pt.y)
    }
    
    static func + (left: CGPoint, right: CGPoint) -> CGPoint
    {
        CGPoint(left.x + right.x, left.y + right.y)
    }
    
    static func + (left: CGPoint, right: CGVector) -> CGPoint
    {
        CGPoint(left.x + right.dx, left.y + right.dy)
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGPoint
    {
        CGPoint(left.x - right.x, left.y - right.y)
    }
    
    static func - (left: CGPoint, right: CGVector) -> CGPoint
    {
        CGPoint(left.x - right.dx, left.y - right.dy)
    }
    
    static func += (lhs: inout CGPoint, rhs: CGVector)
    {
        lhs = lhs + rhs
    }
    
    static func -= (lhs: inout CGPoint, rhs: CGVector)
    {
        lhs = lhs - rhs
    }
    
    func distance(to other: CGPoint) -> CGFloat
    {
        let dx = x - other.x
        let dy = y - other.y
        return sqrt(dx*dx + dy*dy)
    }
    
    func manhattanDistance(to other: CGPoint) -> CGFloat
    {
        vector(to: other).manhattanMagnitude
    }
    
    func midpoint(_ other: CGPoint) -> CGPoint
    {
        CGPoint((x + other.x) / 2, (y + other.y) / 2)
    }
    
    func extend(length: CGFloat, angle: CGFloat) -> CGPoint
    {
        CGPoint(x + length * cos(angle), y + length * sin(angle))
    }
    
    func extend(toward other: CGPoint, amt: CGFloat) -> CGPoint
    {
        let d = amt / distance(to: other)
        return extend(toward: other, pct: d)
    }
    
    func extend(toward other: CGPoint, pct: CGFloat) -> CGPoint
    {
        CGPoint(lerp(x, other.x, pct), lerp(y, other.y, pct))
    }
    
    private func lerp(_ start: CGFloat, _ end: CGFloat, _ pct: CGFloat) -> CGFloat
    {
        return start + pct * (end-start)
    }
    
    func between(_ a: CGPoint, _ b: CGPoint) -> Bool
    {
        x.between(a.x, b.x) && y.between(a.y, b.y)
    }
    
    func near(_ pt: CGPoint, _ range: CGFloat) -> Bool
    {
        distance(to: pt) <= range
    }
    
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(x)
        hasher.combine(y)
    }
}
