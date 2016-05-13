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
  public var angle = Angle(radians: 0)

  /// The scalar magnitude of this vector.
  public var magnitude: Numeric = 1.0

  public var dx: Double {
    return cos(angle) * magnitude
  }

  public var dy: Double {
    return sin(angle) * magnitude
  }

  internal mutating func updateAngleAndMagnitude(dx dx: Numeric, dy: Numeric) {
    angle = atan(dy / dx)
    magnitude = sqrt(dx * dx + dy * dy)
  }


  public init(dx: Numeric = 0, dy: Numeric = 0) {
    updateAngleAndMagnitude(dx: dx, dy: dy)
  }

  /// Creates a new unit (magnitude of 1) `Vector` based on a given angle in radians.
  public init(angle: Angle, magnitude: Numeric = 1) {
    self.angle     = angle
    self.magnitude = magnitude
  }


  // MARK: Static Manipulation Methods

  /// Returns the inverse of the given `Vector`.
//  public static func invert(vector: Vector) -> Vector {
//    return Vector(dx: -vector.dx, dy: -vector.dy)
//  }
//
//  public func invert() -> Vector {
//    return Vector.invert(self)
//  }
  public mutating func scale(by multiplier: Numeric) {
    self.magnitude = self.magnitude * multiplier
  }

  /// Returns a `Vector` that has been scaled by the given `Double`.
  public static func scaled(vector: Vector, by multiplier: Numeric) -> Vector {
    return Vector(angle: vector.angle, magnitude: vector.magnitude * multiplier)
  }

  public func scaled(by multiplier: Numeric) -> Vector {
    return Vector.scaled(self, by: multiplier)
  }

  /// Returns the cross product of two Vectors.
  public static func cross(left: Vector, _ right: Vector) -> Double {
    return left.dx * right.dy - left.dy * right.dx
  }

  public func cross(vector: Vector) -> Double {
    return Vector.cross(self, vector)
  }

  /// Returns the dot product of two Vectors.
  public static func dot(left: Vector, _ right: Vector) -> Double {
    return left.dx * right.dx + left.dy * right.dy
  }

  public func dot(vector: Vector) -> Double {
    return Vector.dot(self, vector)
  }

  /// Returns the normalized version of the given vector.
  public static func normalized(vector: Vector) -> Vector {
    return Vector(angle: vector.angle)
  }

  public func normalized() -> Vector {
    return Vector.normalized(self)
  }

  public mutating func normalize() {
    magnitude = 1
  }

  ///  Returns a `Vector` that represents the given `Vector` rotated by `theta` radians.
  ///
  ///  - parameter vector: The `Vector` to be rotated.
  ///  - parameter theta:  How far to rotate the vector.
  ///
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
  return Vector.scaled(left, by: right)
}

public func * (left: Double, right: Vector) -> Vector {
  return Vector.scaled(right, by: left)
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
    return 0
  }
}
extension Vector: CustomStringConvertible {
  public var description: String {
    return "(θ: \(self.angle), mag: \(self.magnitude)), dx: \(self.dx), dy: \(self.dy)"
  }
}

extension Vector: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "(θ: \(self.angle), mag: \(self.magnitude)), dx: \(self.dx), dy: \(self.dy)"
  }
}
