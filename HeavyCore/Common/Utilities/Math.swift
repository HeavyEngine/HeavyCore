//
//  Math.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/11/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public struct Math {
  /// Determine if the two numbers are within a distance from each other.
  /// Based on http://floating-point-gui.de/errors/comparison/
  public static func aboutEqual(a: FloatLiteralType, _ b: FloatLiteralType, delta: FloatLiteralType = DBL_EPSILON) -> Bool {
    let absA = abs(a)
    let absB = abs(b)
    let diff = abs(a - b)

    if a == b {
      return true
    } else if ( a == 0 || b == 0 || diff < DBL_MIN) {
      return diff < (delta * DBL_MIN)
    } else {
      return diff / min((absA + absB), DBL_MAX) < delta
    }
  }

  public static func average(values: FloatLiteralType...) -> FloatLiteralType {
    return average(values)
  }

  public static func average(values: [FloatLiteralType]) -> FloatLiteralType {
    return values.reduce(0, combine: { $0 + $1}) / FloatLiteralType(values.count)
  }

  /// Round to the place by the provided base.
  /// - parameter value: The initial value.
  /// - parameter place: The decimal place you wish to round to.
  /// - parameter base: The base to round in, 10 is the default for decimals.
  public static func round(value: FloatLiteralType, toPlace place: Int = 0, by base: Int = 10) -> FloatLiteralType {
    let p = pow(FloatLiteralType(base), -1.0 * FloatLiteralType(place))
    return Foundation.round(value * p) / p
  }

  public static func clamp(value: FloatLiteralType, min: FloatLiteralType, max: FloatLiteralType) -> FloatLiteralType {
    if value < min {
      return min
    } else if value > max {
      return max
    } else {
      return value
    }
  }

  public static func lerp(start: FloatLiteralType, end: FloatLiteralType, weight: FloatLiteralType) -> FloatLiteralType {
    return (1.0 - weight) * start + weight * end
  }
}

public extension FloatLiteralType {

  func isAboutEqual(to b: FloatLiteralType, within delta: FloatLiteralType = DBL_EPSILON) -> Bool {
    return Math.aboutEqual(self, b, delta: delta)
  }

  func round(toPlace place: Int, base: Int = 10) -> FloatLiteralType {
    return Math.round(self, toPlace: place, by: base)
  }

  func clamp(min min: FloatLiteralType, max: FloatLiteralType) -> FloatLiteralType {
    return Math.clamp(self, min: min, max: max)
  }

  func lerp(to end: FloatLiteralType, weight: FloatLiteralType) -> FloatLiteralType {
    return Math.lerp(self, end: end, weight: weight)
  }
}

public extension _ArrayType where Generator.Element == FloatLiteralType {
  func average() -> FloatLiteralType {
    return Math.average(self as! [FloatLiteralType])
  }
}
