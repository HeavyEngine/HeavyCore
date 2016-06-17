//
//  Time.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 6/12/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation


///  Inspired by MeasuringCup (https://github.com/catalandres/MeasuringCup/)
public struct Time {

  public enum Unit {
    case nanoseconds, microseconds, milliseconds, seconds, minutes, hours
    public var symbol: String {
      return Time.unitValues(self).symbol
    }
    public var factor: Double {
      return Time.unitValues(self).factor
    }
    public var baseUnit: Unit {
      return .nanoseconds
    }
  }

  static public func unitValues(unit: Unit) -> (factor: Double, symbol: String) {
    switch unit {
    case .nanoseconds:
      return (1, "ns")
    case .microseconds:
      return (1_000, "μs")
    case .milliseconds:
      return (1_000_000, "ms")
    case .seconds:
      return (1_000_000_000, "s")
    case .minutes:
      return (60 * 1_000_000_000, "min")
    case .hours:
      return (60, "h")
    }
  }

  public var nanosecondValue: Double

  public init(_ nanoseconds: Double = 0) {
    self.nanosecondValue = nanoseconds
  }

  public var nanoseconds: Double {
    return self.nanosecondValue
  }
  public var microseconds: Double {
    return self.nanoseconds / Unit.microseconds.factor
  }
  public var milliseconds: Double {
    return self.nanoseconds / Unit.milliseconds.factor
  }
  public var seconds: Double {
    return self.nanoseconds / Unit.seconds.factor
  }
  public var minutes: Double {
    return self.nanoseconds / Unit.minutes.factor
  }
  public var hours: Double {
    return self.minutes / Unit.hours.factor
  }
}

/// MARK: - String Extensions
extension Time: CustomStringConvertible {
  public var description: String {
    return "(ns: \(nanoseconds), μs: \(microseconds), ms: \(milliseconds), s: \(seconds))"
  }
}

extension Time: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "(ns: \(nanoseconds), μs: \(microseconds), ms: \(milliseconds), s: \(seconds))"
  }
}

// MARK: - Arithmetic Operators
public func +(lhs: Time, rhs: Time) -> Time {
  return Time(lhs.nanosecondValue + rhs.nanosecondValue)
}

public func -(lhs: Time, rhs: Time) -> Time {
  return Time(lhs.nanosecondValue - rhs.nanosecondValue)
}

public func /(lhs: Time, rhs: Time) -> Time {
  return Time(lhs.nanosecondValue / rhs.nanosecondValue)
}

public func *(lhs: Time, rhs: Time) -> Time {
  return Time(lhs.nanosecondValue * rhs.nanosecondValue)
}

// MARK: - Comparison Operators

public func >(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanosecondValue > rhs.nanosecondValue
}

public func <(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanosecondValue < rhs.nanosecondValue
}

public func >=(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanosecondValue >= rhs.nanosecondValue
}

public func <=(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanosecondValue <= rhs.nanosecondValue
}

public func ==(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanosecondValue == rhs.nanosecondValue
}

public func !=(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanosecondValue != rhs.nanosecondValue
}

// MARK: - Literal Conversion Extensions

public protocol TimeConvertible {}
extension UInt: TimeConvertible {}
extension Int: TimeConvertible {}
extension Float: TimeConvertible {}
extension Double: TimeConvertible {}

extension Double {
  init(_ value: TimeConvertible) {
    switch value {
    case is UInt:
      self = Double(value as! UInt)
    case is Int:
      self = Double(value as! Int)
    case is Float:
      self = Double(value as! Float)
    case is Double:
      self = value as! Double
    default:
      self = 0
    }
  }
}

extension TimeConvertible {
  private func convert(unit: Time.Unit) -> Time {
    return Time(Double(self) * unit.factor)
  }
  public var nanoseconds: Time {
    return Time(Double(self))
  }
  public var microseconds: Time {
    return convert(.microseconds)
  }
  public var milliseconds: Time {
    return convert(.milliseconds)
  }
  public var seconds: Time {
    return convert(.seconds)
  }
  public var minutes: Time {
    return convert(.minutes)
  }
  public var hours: Time {
    return convert(.hours)
  }
}
