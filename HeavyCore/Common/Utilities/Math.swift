//
//  Math.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/11/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public struct Math {
  /// Determine if the two numbers are within epsilon distance from each other.
  /// Based on http://floating-point-gui.de/errors/comparison/
  public static func fuzzyEqual(a: Double, b: Double, epsilon: Double = DBL_EPSILON) -> Bool {
    let absA = abs(a)
    let absB = abs(b)
    let diff = abs(a - b)

    if a == b {
      return true
    } else if ( a == 0 || b == 0 || diff < DBL_MIN) {
      return diff < (epsilon * DBL_MIN)
    } else {
      return diff / min((absA + absB), DBL_MAX) < epsilon
    }
  }

  public static func average(values: Double...) -> Double {
    return average(values)
  }

  public static func average(values: [Double]) -> Double {
    return values.reduce(0, combine: { $0 + $1}) / Double(values.count)
  }

  /// Round to the place by the provided base.
  /// - parameter value: The initial value.
  /// - parameter place: The decimal place you wish to round to.
  /// - parameter base: The base to round in, 10 is the default for decimals.
  public static func roundTo(value: Double, place: Int = 0, base: Int = 10) -> Double {
    let p = pow(Double(base), -1.0 * Double(place))
    return round(value * p) / p
  }

  public static func clamp(value: Double, min: Double, max: Double) -> Double {
    if value < min {
      return min
    } else if value > max {
      return max
    } else {
      return value
    }
  }

  public static func lerp(start: Double, end: Double, weight: Double) -> Double {
    return (1.0 - weight) * start + weight * end
  }
}
