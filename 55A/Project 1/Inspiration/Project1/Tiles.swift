//
//  Tiles.swift
//  Project1
//
//  Created by Litherum on 4/12/15.
//  Copyright (c) 2015 Litherum. All rights reserved.
//

import Cocoa

class BlackSquare: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func drawRect(dirtyRect: NSRect) {
        NSColor.blackColor().set()
        NSBezierPath.fillRect(bounds)
    }
}

class WhiteSquare: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func drawRect(dirtyRect: NSRect) {
        NSColor.whiteColor().set()
        NSBezierPath.fillRect(bounds)
    }
}

class Triangle: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func drawRect(dirtyRect: NSRect) {
        NSColor.whiteColor().set()
        NSBezierPath.fillRect(bounds)
        var path = NSBezierPath()
        path.moveToPoint(bounds.origin)
        path.lineToPoint(NSMakePoint(NSMaxX(bounds), NSMaxY(bounds)))
        path.lineToPoint(NSMakePoint(NSMaxX(bounds), bounds.origin.y))
        path.closePath()
        NSColor.blackColor().set()
        path.fill()
    }
}

class BlackQuad: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func drawRect(dirtyRect: NSRect) {
        NSColor.whiteColor().set()
        NSBezierPath.fillRect(bounds)
        var path = NSBezierPath()
        path.moveToPoint(bounds.origin)
        path.appendBezierPathWithArcWithCenter(bounds.origin, radius: min(bounds.size.width, bounds.size.height), startAngle: 0, endAngle: 90)
        path.closePath()
        NSColor.blackColor().set()
        path.fill()
    }
}

class WhiteQuad: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func drawRect(dirtyRect: NSRect) {
        NSColor.blackColor().set()
        NSBezierPath.fillRect(bounds)
        var path = NSBezierPath()
        path.moveToPoint(bounds.origin)
        path.appendBezierPathWithArcWithCenter(bounds.origin, radius: min(bounds.size.width, bounds.size.height), startAngle: 0, endAngle: 90)
        path.closePath()
        NSColor.whiteColor().set()
        path.fill()
    }
}
