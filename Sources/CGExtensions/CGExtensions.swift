//
//  CGExtensions.swift
//  CGExtensions
//
//  Created by TJ Sartain on 7/8/20.
//  Copyright © 2020 Penske Logistics. All rights reserved.
//

import UIKit

extension CGSize
{
    public init(_ h: CGFloat, _ w: CGFloat)
    {
        self.init(width: w, height: h)
    }
}

extension CGRect
{
    public init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat)
    {
        self.init(x: x, y: y, width: w, height: h)
    }
    
    public func edgeInsets(_ insets: UIEdgeInsets) -> CGRect
    {
        let rect = insetBy(dx: (insets.left+insets.right)/2,
                           dy: (insets.top+insets.bottom)/2)
        return rect.offsetBy(dx: insets.left-(insets.left+insets.right)/2,
                             dy: insets.top-(insets.top+insets.bottom)/2)
    }
    
    public func draw(fill: UIColor?, stroke: UIColor?, width: CGFloat?)
    {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        let path = UIBezierPath(rect: self)
        
        if let fill = fill {
            fill.setFill()
            path.fill()
        }
        
        if let stroke = stroke, let width = width {
            stroke.setStroke()
            path.lineWidth = width
            path.stroke()
        }
        
        context?.restoreGState()
    }
}

extension CGFloat
{
    public var radians: CGFloat {
        self * .pi / 180
    }
    
    public var degrees: CGFloat {
        self * 180 / .pi
    }
    
    public static let tolerance: CGFloat = 1e-12
    
    public func equals(_ x: CGFloat, _ tol: CGFloat? = .tolerance) -> Bool
    {
        (x - tol!) <= self && self <= (x + tol!)
    }
    
    public func between(_ x: CGFloat, _ y: CGFloat) -> Bool
    {
        x <= self && self <= y
    }
    
    public func fuzzyEqual(to other: CGFloat, _ tolerance: CGFloat) -> Bool
    {
        equals(other, tolerance)
    }
    
    public func power(_ a: CGFloat, _ b: CGFloat) -> CGFloat
    {
        return a * pow(self, b)
    }
    
    public func power(_ a: (CGFloat, CGFloat)) -> CGFloat
    {
        return a.0 * pow(self, a.1)
    }
    
    public func exponential(_ a: CGFloat, _ b: CGFloat) -> CGFloat
    {
        return a * pow(CGFloat(M_E), b * self)
    }
    
    public func exponential(_ a: (CGFloat, CGFloat)) -> CGFloat
    {
        return a.0 * pow(CGFloat(M_E), a.1 * self)
    }
}
