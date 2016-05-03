//
//  Point.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/2/16.
//  Copyright © 2016 Heavy. All rights reserved.
//


/// A structure that contains an *x* and *y* value
/// in order to specify a location in a two-dimensional
/// coordinate system.
public struct Point {
  public var x: Double
  public var y: Double
  public init(x: Double = 0, y: Double = 0) {
    self.x = x
    self.y = y
  }
}

public func == (left: Point, right: Point) -> Bool {
  return left.x == right.x && left.y == right.y
}

public func + (left: Point, right: Point) -> Point {
  return Point(x: left.x + right.x, y: left.y + right.y)
}

public func - (left: Point, right: Point) -> Point {
  return Point(x: left.x - right.x, y: left.y - right.y)
}

public func * (left: Point, right: Point) -> Point {
  return Point(x: left.x * right.x, y: left.y * right.y)
}

public func / (left: Point, right: Point) -> Point {
  return Point(x: left.x / right.x, y: left.y / right.y)
}

public extension Point {

  /// Returns a `Double` representing the distance between two points.
  public func distanceTo(point: Point) -> Double {
    return sqrt(pow(self.x - point.x,2) + pow(self.y - point.y,2))
  }
}

extension Point: Hashable {
  public var hashValue: Int {
    return self.x.hashValue &+ self.y.hashValue
  }
}

extension Point: CustomStringConvertible {
  public var description: String {
    return "(x: \(self.x), y: \(self.y))"
  }
}

extension Point: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "(x: \(self.x), y: \(self.y))"
  }
}