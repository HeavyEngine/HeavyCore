//
//  Vector.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/3/16.
//  Copyright © 2016 Heavy. All rights reserved.
//
import Foundation

/// A structure that contains a `dx` and `dy` value that represent a direction
/// and magnitude in a two-dimensional coordinate system.
public struct Vector {
  public var dx: Double
  public var dy: Double

  /// Returns the scalar magnitude of this vector.
  public var magnitude: Double {
    return sqrt(pow(dx, 2) + pow(dy, 2))
  }

  /// Returns the angle of a given `Vector` in radians.
  public var angle: Radians {
    return atan2(self.dx, self.dy)
  }

  public init(dx: Double = 0, dy: Double = 0) {
    self.dx = dx
    self.dy = dy
  }

  /// Creates a new unit (magnitude of 1) `Vector` based on a given angle in radians.
  public init(radians: Radians) {
    self.dx = cos(radians)
    self.dy = sin(radians)
  }

  /// Creates a new unit (magnitude of 1) `Vector` based on a given angle in Degrees.
  public init(degrees: Degrees) {
    self.dx = cos(degrees.inRadians)
    self.dy = sin(degrees.inRadians)
  }

  // MARK: Static Manipulation Methods

  /// Returns the inverse of the given `Vector`.
  public static func invert(vector: Vector) -> Vector {
    return Vector(dx: -vector.dx, dy: -vector.dy)
  }

  /// Returns a `Vector` that has been scaled by the given `Double`.
  public static func scale(vector: Vector, by scalar: Double) -> Vector {
    return Vector(dx: vector.dx * scalar, dy: vector.dy * scalar)
  }

  /// Returns the cross product of two Vectors.
  public static func cross(left: Vector, _ right: Vector) -> Double {
    return left.dx * right.dy - left.dy * right.dx
  }

  /// Returns the dot product of two Vectors.
  public static func dot(left: Vector, _ right: Vector) -> Double {
    return left.dx * right.dx + left.dy * right.dy
  }

  /// Returns the normalized version of the given vector.
  public static func normalize(vector: Vector) -> Vector {
    let lengthSquared = vector.dx * vector.dx + vector.dy * vector.dy
    if lengthSquared ~= 0  || lengthSquared ~= 1 {
      return vector
    }
    return vector / sqrt(lengthSquared)
  }

  /// Returns a `Vector` that represents the given `Vector` rotated by `theta` radians.
  public static func rotate(vector: Vector, by theta: Radians) -> Vector {
    return Vector(dx: vector.dx * cos(theta) - vector.dy * sin(theta),
                  dy: vector.dx * sin(theta) + vector.dy * cos(theta)
    )
  }
  public func rotate(by theta: Radians) -> Vector {
    return Vector.rotate(self, by: theta)
  }

  /// Performs a linear interpolation between two `Vector` values.
  public static func lerp(start: Vector, end: Vector, time: Double) -> Vector {
    return start + time * (end - start)
  }

  // MARK: Chainable Manipulation Functions

  public func invert() -> Vector {
    return Vector.invert(self)
  }

  public func scale(scalar: Double) -> Vector {
    return Vector.scale(self, by: scalar)
  }

  public func cross(vector: Vector) -> Double {
    return Vector.cross(self, vector)
  }

  public func dot(vector: Vector) -> Double {
    return Vector.dot(self, vector)
  }

  public func normalize() -> Vector {
    return Vector.normalize(self)
  }

  public func rotate(theta: Radians) -> Vector {
    return Vector.rotate(self, by: theta)
  }

  public func lerp(to vector: Vector, by time: Double) -> Vector {
    return Vector.lerp(self, end: vector, time: time)
  }
}

// MARK: Arithmetic Operators
public func + (left: Vector, right: Vector) -> Vector {
  return Vector(dx: left.dx + right.dx, dy: left.dy + right.dy)
}

public func - (left: Vector, right: Vector) -> Vector {
  return Vector(dx: left.dx - right.dx, dy: left.dy - right.dy)
}

public func * (left: Vector, right: Double) -> Vector {
  return Vector.scale(left, by: right)
}

public func * (left: Double, right: Vector) -> Vector {
  return Vector.scale(right, by: left)
}

public func * (left: Vector, right: Vector) -> Vector {
  return Vector(dx: left.dx * right.dx, dy: left.dy * right.dy)
}

public func / (left: Vector, right: Double) -> Vector {
  return Vector(dx: left.dx / right, dy: left.dy / right)
}

public func / (left: Double, right: Vector) -> Vector {
  return Vector(dx: left / right.dx, dy: left / right.dy)
}

public func / (left: Vector, right: Vector) -> Vector {
  return Vector(dx: left.dx / right.dx, dy: left.dy / right.dy)
}

public prefix func - (right: Vector) -> Vector {
  return Vector(dx: -right.dx, dy: -right.dx)
}

// MARK: Comparison Operators
public func == (left: Vector, right: Vector) -> Bool {
  return left.dx == right.dx && left.dy == right.dy
}

// MARK: Protocol Extensions
extension Vector: Hashable {
  public var hashValue: Int {
    return self.dx.hashValue &+ self.dy.hashValue
  }
}
extension Vector: CustomStringConvertible {
  public var description: String {
    return "(dx: \(self.dx), dy: \(self.dy), m: \(self.magnitude))"
  }
}

extension Vector: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "(dx:\(self.dx), dy: \(self.dy), m: \(self.magnitude))"
  }
}
