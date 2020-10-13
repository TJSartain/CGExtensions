//
//  CGExtensions.swift
//  ClearChain2
//
//  Created by TJ Sartain on 7/8/20.
//  Copyright © 2020 Penske Logistics. All rights reserved.
//

import UIKit

extension CGSize
{
    init(_ h: CGFloat, _ w: CGFloat)
    {
        self.init(width: w, height: h)
    }
}

extension CGRect
{
    init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat)
    {
        self.init(x: x, y: y, width: w, height: h)
    }
    
    func edgeInsets(_ insets: UIEdgeInsets) -> CGRect
    {
        let rect = insetBy(dx: (insets.left+insets.right)/2,
                           dy: (insets.top+insets.bottom)/2)
        return rect.offsetBy(dx: insets.left-(insets.left+insets.right)/2,
                             dy: insets.top-(insets.top+insets.bottom)/2)
    }
    
    func draw(fill: UIColor?, stroke: UIColor?, width: CGFloat?)
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
    var radians: CGFloat {
        self * .pi / 180
    }
    
    var degrees: CGFloat {
        self * 180 / .pi
    }
    
    static let tolerance: CGFloat = 1e-12
    
    func equals(_ x: CGFloat, _ tol: CGFloat? = .tolerance) -> Bool
    {
        (x - tol!) <= self && self <= (x + tol!)
    }
    
    func between(_ x: CGFloat, _ y: CGFloat) -> Bool
    {
        x <= self && self <= y
    }
    
    func fuzzyEqual(to other: CGFloat, _ tolerance: CGFloat) -> Bool
    {
        equals(other, tolerance)
    }
}




