//
//  Angle.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/13/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public struct Angle {
  public var radians: Double = 0
  public var degrees: Double {
    get {
      return radians * 180 / M_PI
    }
    set {
      radians = newValue * M_PI / 180.0
    }
  }
  public init(radians: Double = 0) {
    self.radians = radians
  }
  public init(degrees: Double = 0) {
    self.degrees = degrees
  }
}

// MARK: - Arithmetic Operators
public func +(lhs: Angle, rhs: Angle) -> Angle {
  return Angle(radians: lhs.radians + rhs.radians)
}

public func -(lhs: Angle, rhs: Angle) -> Angle {
  return Angle(radians: lhs.radians - rhs.radians)
}

public func /(lhs: Angle, rhs: Angle) -> Double {
  return lhs.radians / rhs.radians
}

public func *(lhs: Angle, rhs: Numeric) -> Angle {
  return Angle(radians: lhs.radians * rhs.value())
}

public func /(lhs: Angle, rhs: Numeric) -> Angle {
  return Angle(radians: lhs.radians / rhs.value())
}

public func *(lhs: Numeric, rhs: Angle) -> Angle {
  return Angle(radians: lhs.value() * rhs.radians)
}

// MARK: - Global Trig Functions

///  Return the cosine of a given `Angle`.
public func cos(angle: Angle) -> Numeric {
  return cos(angle.radians)
}

public func sin(angle: Angle) -> Numeric {
  return sin(angle.radians)
}

public func tan(angle: Angle) -> Numeric {
  return tan(angle.radians)
}
public func atan(x: Double) -> Angle {
  return Angle(radians: atan(x))
}

// MARK: - String Extensions
extension Angle: CustomStringConvertible {
  public var description: String {
    return "(rad: \(radians), deg: \(degrees)°) "
  }
}

extension Angle: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "(rad: \(radians), deg: \(degrees)°) "
  }
}

// MARK: - Literal Conversion Extensions
extension Angle: FloatLiteralConvertible, IntegerLiteralConvertible {
  public init(floatLiteral value: FloatLiteralType) {
    self.init(radians: Double(value))
  }

  public init(integerLiteral value: IntegerLiteralType) {
    self.init(radians: Double(value))
  }
}

public extension Double {
  public var degrees: Angle {
    return Angle(degrees: self)
  }
  public var radians: Angle {
    return Angle(radians: self)
  }
}

public extension Int {
  public var degrees: Angle {
    return Angle(degrees: Double(self))
  }
  public var radians: Angle {
    return Angle(radians: Double(self))
  }
}
