//
//  GridView.swift
//  Project1
//
//  Created by Litherum on 4/12/15.
//  Copyright (c) 2015 Litherum. All rights reserved.
//

import Cocoa

class GridView: NSView {
    override func drawRect(dirtyRect: NSRect) {
        let tilesize = 72 * 2
        NSColor.grayColor().set()
        for i in 1 ..< 5 {
            var path = NSBezierPath()
            path.moveToPoint(NSMakePoint(CGFloat(i * tilesize), bounds.origin.y))
            path.lineToPoint(NSMakePoint(CGFloat(i * tilesize), NSMaxY(bounds)))
            path.stroke()
        }
        for i in 1 ..< 4 {
            var path = NSBezierPath()
            path.moveToPoint(NSMakePoint(bounds.origin.x, CGFloat(i * tilesize)))
            path.lineToPoint(NSMakePoint(NSMaxX(bounds), CGFloat(i * tilesize)))
            path.stroke()
        }
    }
}

