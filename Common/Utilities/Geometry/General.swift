//
//  General.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/3/16.
//  Copyright © 2016 Heavy. All rights reserved.
//
public typealias Radians = Double
public typealias Degrees = Double

public extension Radians {
  var inDegrees: Degrees {
    return self * 180 / M_PI
  }
}

public extension Degrees {
  var inRadians: Radians {
    return self * M_PI / 180
  }
}