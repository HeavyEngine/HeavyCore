//
//  Protocols.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/3/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

public protocol HasCenter {
  var center: Point { get }
}

public protocol HasBounds {
  var bounds: Quad { get }
}

public protocol CanContain {
  func contains(point: Point) -> Bool
  func contains(quad: Quad) -> Bool
}

public protocol HasArea {
  var area: Double { get }
}
