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
public func cos(angle: Angle) -> Double {
  return cos(angle.radians)
}

public func sin(angle: Angle) -> Double {
  return sin(angle.radians)
}

public func tan(angle: Angle) -> Double {
  return tan(angle.radians)
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
    var a = Angle()
    a.degrees = self
    return a
  }
  public var radians: Angle {
    var a = Angle()
    a.radians = self
    return a
  }
}

public extension Int {
  public var degrees: Angle {
    var a = Angle()
    a.degrees = Double(self)
    return a
  }
  public var radians: Angle {
    var a = Angle()
    a.radians = Double(self)
    return a
  }
}

// MARK: Numeric Protocol

///  Helps with casting Int, Float, Double to angles and us repeating ourselves
///  when making arithmetic operators.
public protocol Numeric {
  func value() -> Double
}

extension Int: Numeric {
  public func value() -> Double {
    return Double(self)
  }
}

extension Float: Numeric {
  public func value() -> Double {
    return Double(self)
  }
}

extension Double: Numeric {
  public func value() -> Double {
    return Double(self)
  }
}
