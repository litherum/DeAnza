//
//  DisplayViewController.swift
//  Project1
//
//  Created by Litherum on 4/12/15.
//  Copyright (c) 2015 Litherum. All rights reserved.
//

import Cocoa

class DisplayViewController: NSViewController {
    var tileViews: [NSView] = []
    var h: Bool = true

    override func viewDidLoad() {
        populate()
    }
    
    @IBAction func reset(sender: NSButton) {
        populate()
    }

    func rotateEdges(amount: Int, edges: (Bool, Bool, Bool, Bool)) -> (Bool, Bool, Bool, Bool) {
        if amount == 0 {
            return edges
        } else if amount == 1 {
            return (edges.3, edges.0, edges.1, edges.2)
        } else if amount == 2 {
            return (edges.2, edges.3, edges.0, edges.1)
        } else {
            return (edges.1, edges.2, edges.3, edges.0)
        }
    }

    func populate() {
        for tile in tileViews {
            tile.removeFromSuperview()
        }
        tileViews.removeAll(keepCapacity: true)
        let tilesize = 72 * 2
        var m : [Int: [Int: (Bool, Bool, Bool, Bool)]] = [:]
        for i in 0 ..< 4 {
            for j in 0 ..< 5 {
                var tile: NSView!
                var edges: (Bool, Bool, Bool, Bool)
                var rand = arc4random() % 100
                if rand < 20 {
                    tile = BlackSquare(frame: NSMakeRect(CGFloat(j * tilesize), CGFloat(i * tilesize), CGFloat(tilesize), CGFloat(tilesize)))
                    edges = (false, false, false, false)
                } else if rand < 40 {
                    tile = WhiteSquare(frame: NSMakeRect(CGFloat(j * tilesize), CGFloat(i * tilesize), CGFloat(tilesize), CGFloat(tilesize)))
                    edges = (true, true, true, true)
                } else if rand < 60 {
                    tile = Triangle(frame: NSMakeRect(CGFloat(j * tilesize), CGFloat(i * tilesize), CGFloat(tilesize), CGFloat(tilesize)))
                    edges = (false, true, true, false)
                } else if rand < 80 {
                    tile = BlackQuad(frame: NSMakeRect(CGFloat(j * tilesize), CGFloat(i * tilesize), CGFloat(tilesize), CGFloat(tilesize)))
                    edges = (true, true, false, false)
                } else {
                    tile = WhiteQuad(frame: NSMakeRect(CGFloat(j * tilesize), CGFloat(i * tilesize), CGFloat(tilesize), CGFloat(tilesize)))
                    edges = (false, false, true, true)
                }
                var rotation : Int
                if i == 0 && j == 0 {
                    rotation = Int(arc4random() % 4)
                } else if i == 0 {
                    if Int(arc4random() % 100) < 80 {
                        let leftEdge = m[i]![j - 1]!.0
                        var candidates: [Int] = []
                        for k in 0 ..< 3 {
                            if rotateEdges(k, edges: edges).2 == leftEdge {
                                candidates.append(k)
                            }
                        }
                        if candidates.count > 0 {
                            rotation = candidates[Int(arc4random()) % Int(candidates.count)]
                        } else {
                            rotation = Int(arc4random() % 4)
                        }
                    } else {
                        rotation = Int(arc4random() % 4)
                    }
                } else if j == 0 {
                    if Int(arc4random() % 100) < 80 {
                        let bottomEdge = m[i - 1]![j]!.1
                        var candidates: [Int] = []
                        for k in 0 ..< 3 {
                            if rotateEdges(k, edges: edges).3 == bottomEdge {
                                candidates.append(k)
                            }
                        }
                        if candidates.count > 0 {
                            rotation = candidates[Int(arc4random()) % Int(candidates.count)]
                        } else {
                            rotation = Int(arc4random() % 4)
                        }
                    } else {
                        rotation = Int(arc4random() % 4)
                    }
                } else {
                    let tryToMatchPercent = Int(arc4random() % 100)
                    if tryToMatchPercent < 60 {
                        let leftEdge = m[i]![j - 1]!.0
                        let bottomEdge = m[i - 1]![j]!.1
                        var candidates: [Int] = []
                        for k in 0 ..< 3 {
                            let rotatedTest = rotateEdges(k, edges: edges)
                            if rotatedTest.3 == leftEdge && rotatedTest.2 == bottomEdge {
                                candidates.append(k)
                            }
                        }
                        if candidates.count > 0 {
                            rotation = candidates[Int(arc4random()) % Int(candidates.count)]
                        } else {
                            rotation = Int(arc4random() % 4)
                        }
                    } else if tryToMatchPercent < 75 {
                        let leftEdge = m[i]![j - 1]!.0
                        var candidates: [Int] = []
                        for k in 0 ..< 3 {
                            if rotateEdges(k, edges: edges).2 == leftEdge {
                                candidates.append(k)
                            }
                        }
                        if candidates.count > 0 {
                            rotation = candidates[Int(arc4random()) % Int(candidates.count)]
                        } else {
                            rotation = Int(arc4random() % 4)
                        }
                    } else if tryToMatchPercent < 90 {
                        let bottomEdge = m[i - 1]![j]!.1
                        var candidates: [Int] = []
                        for k in 0 ..< 3 {
                            if rotateEdges(k, edges: edges).3 == bottomEdge {
                                candidates.append(k)
                            }
                        }
                        if candidates.count > 0 {
                            rotation = candidates[Int(arc4random()) % Int(candidates.count)]
                        } else {
                            rotation = Int(arc4random() % 4)
                        }
                    } else  {
                        rotation = Int(arc4random() % 4)
                    }
                }
                tile.frameCenterRotation = CGFloat(rotation * 90)
                let rotatedEdges = rotateEdges(rotation, edges: edges)
                if m[i] == nil {
                    m[i] = [j: rotatedEdges]
                } else {
                    m[i]![j] = rotatedEdges
                }
                view.addSubview(tile)
                tileViews.append(tile)
            }
        }
    }
}
