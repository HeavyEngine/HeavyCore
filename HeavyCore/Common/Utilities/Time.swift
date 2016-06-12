//
//  Time.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 6/12/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public struct Time {
  private var nanoValue: UInt
  public var nanoseconds: Double {
    return Double(nanoValue)
  }
  public var microseconds: Double {
    return nanoseconds / 1_000
  }
  public var milliseconds: Double {
    return nanoseconds / 1_000_000
  }
  public var seconds: Double {
    return nanoseconds / 1_000_000_000
  }
  public var minutes: Double {
    return nanoseconds / 60_000_000_000
  }
  public var hours: Double {
    return minutes / 60
  }
  public init(_ nanoSeconds: UInt = 0) {
    self.nanoValue = nanoSeconds
  }
  public func elapsed(since: Time) -> Time {
    if self < since {
      return since - self
    } else {
      return self - since
    }
  }
}

// MARK: - String Extensions
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
  return Time(lhs.nanoValue + rhs.nanoValue)
}

public func -(lhs: Time, rhs: Time) -> Time {
  return Time(lhs.nanoValue - rhs.nanoValue)
}

public func /(lhs: Time, rhs: Time) -> Time {
  return Time(lhs.nanoValue / rhs.nanoValue)
}

public func *(lhs: Time, rhs: Time) -> Time {
  return Time(lhs.nanoValue * rhs.nanoValue)
}

// MARK: - Comparison Operators

public func >(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanoValue > rhs.nanoValue
}

public func <(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanoValue < rhs.nanoValue
}

public func >=(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanoValue >= rhs.nanoValue
}

public func <=(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanoValue <= rhs.nanoValue
}

public func ==(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanoValue == rhs.nanoValue
}

public func !=(lhs: Time, rhs: Time) -> Bool {
  return lhs.nanoValue != rhs.nanoValue
}
