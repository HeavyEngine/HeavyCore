//
//  Vector.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/3/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

/// A structure that contains a `dx` and `dy` value that represent a direction and magnitude in a two-dimensional coordinate system.
public struct Vector {
  public var dx: Double
  public var dy: Double

  /// Returns the scalar magnitude of this vector.
  public var magnitude: Double {
    return sqrt(pow(dx,2) + pow(dy,2))
  }

  public init(dx: Double = 0, dy: Double = 0) {
    self.dx = dx
    self.dy = dy
  }
}

// MARK: Manipulation Functions

/// Returns the inverse of the given `Vector`.
public func invert(vector: Vector) -> Vector {
  return Vector(dx: -vector.dx, dy: -vector.dx)
}

/// Returns a `Vector` that has been scaled by the given `Double`.
public func scale(vector: Vector, scalar: Double) -> Vector {
  return Vector(dx: vector.dx * scalar, dy: vector.dy * scalar)
}

/// Returns the cross product of two Vectors.
public func cross(left: Vector, right: Vector) -> Double {
  return left.dx * right.dy - left.dy * right.dx
}

/// Returns the normalized version of the given vector.
public func normalize(vector: Vector) -> Vector {
  let lengthSquared = vector.dx * vector.dx + vector.dy * vector.dy
  if lengthSquared ~= 0  || lengthSquared ~= 1 {
    return vector
  }
  return vector / sqrt(lengthSquared)
}

/// Returns the dot product of two Vectors.
public func dot(left: Vector, right: Vector) -> Double {
  return left.dx * right.dx + left.dy * right.dy
}

// MARK: Arithmetic Operators
public func + (left: Vector, right: Vector) -> Vector {
  return Vector(dx: left.dx + right.dx, dy: left.dy + right.dy)
}

public func - (left: Vector, right: Vector) -> Vector {
  return Vector(dx: left.dx - right.dx, dy: left.dy - right.dy)
}

public func * (left: Vector, right: Double) -> Vector {
  return scale(left, scalar: right)
}

public func * (left: Double, right: Vector) -> Vector {
  return scale(right, scalar: left)
}

public func * (left: Vector, right: Vector) -> Vector {
  return Vector(dx: left.dx * right.dx, dy: left.dy * right.dy)
}

public func / (left: Vector, right: Double) -> Vector {
  return Vector(dx: left.dx / right, dy: left.dy / right)
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
    return "(\(self.dx),\(self.dy),\(self.magnitude))"
  }
}

extension Vector: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "(\(self.dx),\(self.dy), \(self.magnitude))"
  }
}
