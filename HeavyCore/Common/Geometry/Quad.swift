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

  public var midX: Double {
    return maxX / 2
  }

  public var midY: Double {
    return maxY / 2
  }

  public init(x: Double = 0, y: Double = 0, width: Double = 0, height: Double = 0) {
    self.x = x
    self.y = y
    self.width = width
    self.height = height
  }

  // MARK: Static Manipulation Methods

  /// Equally subdivides a quad into four sub quads and returns them.
  public func subdivide() -> [Quad] {
    let width = self.width / 2
    let height = self.height / 2
    let yDiv = self.midY
    let xDiv = self.midX
    let q1 = Quad(x: self.x, y: self.y, width: width, height: width)
    let q2 = Quad(x: self.x, y: yDiv, width: width, height: height)
    let q3 = Quad(x: xDiv, y: self.y, width: width, height: height)
    let q4 = Quad(x: xDiv, y: yDiv, width: width, height: height)
    return [q1, q2, q3, q4]
  }

  // TODO: Expand
  // TODO: Offset

}

// MARK: Comparison Operators
public func == (left: Quad, right: Quad) -> Bool {
  return left.x == right.x && left.width == right.width && left.height == right.height
}

// MARK: Protocol Extensions

extension Quad: Contains {
  public func contains(quad: Quad) -> Bool {
    return quad.minX >= minX && quad.minY >= minY && quad.maxX <= maxX && quad.maxY <= maxY
  }
  public func contains(point: Point) -> Bool {
    return point.x > minX && point.y > minY && point.x < maxX && point.y < maxY
  }
}

extension Quad: Intersects {
  public func intersects(quad: Quad) -> Bool {
    return minX < quad.maxX && maxX > quad.minX && minY < quad.maxY && maxY > quad.minY
  }
}

extension Quad: HasArea {
  public var area: Double {
    return width * height
  }
}

extension Quad: HasCenter {
  public var center: Point {
    return Point(x: midX, y: midY)
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
