//
//  Quad.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/3/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

public struct Quad {
  public var x: Double
  public var y: Double
  public var width: Double
  public var height: Double

  /// Returns the minimum value on the x axis of this quad.
  public var minX: Double {
    return min(x, x + width)
  }
  /// Returns the minimum value on the y axis of this quad.
  public var minY: Double {
    return min(y, y + height)
  }

  /// Returns the maximum value on the x axis of this quad.
  public var maxX: Double {
    return max(x, x + width)
  }

  /// Returns the maximum value on the y axis of this quad.
  public var maxY: Double {
    return max(y, y + height)
  }

  public init(x: Double = 0, y: Double = 0, width: Double = 0, height: Double = 0) {
    self.x = x
    self.y = y
    self.width = width
    self.height = height
  }

  // MARK: Static Manipulation Methods
  // TODO: Expand
  // TODO: Offset
}

// MARK: Comparison Operators
public func == (left: Quad, right: Quad) -> Bool {
  return left.x == right.x && left.width == right.width && left.height == right.height
}

// MARK: Protocol Extensions

extension Quad: CanContain {
  public func contains(quad: Quad) -> Bool {
    return quad.minX >= minX && quad.minY >= minY && quad.maxX <= maxX && quad.maxY <= maxY
  }
  public func contains(point: Point) -> Bool {
    return point.x > minX && point.y > minY && point.x < maxX && point.y < maxY
  }
}

extension Quad: HasArea {
  public var area: Double {
    return width * height
  }
}

extension Quad: HasCenter {
  public var center: Point {
    return Point(x: (x + width) / 2, y: (y + height) / 2)
  }
}

extension Quad: HasBounds {
  public var bounds: Quad {
    return self //lol
  }
}

extension Quad: Hashable {
  public var hashValue: Int {
    return x.hashValue &+ y.hashValue &+ width.hashValue &+ height.hashValue
  }
}

extension Quad: CustomStringConvertible {
  public var description: String {
    return "(x: \(self.x), y: \(self.y), w: \(self.width), h: \(self.height))"
  }
}

extension Quad: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "(x: \(self.x), y: \(self.y), w: \(self.width), h: \(self.height))"
  }
}
