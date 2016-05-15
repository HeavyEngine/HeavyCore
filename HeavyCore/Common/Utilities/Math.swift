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
  public static func aboutEqual(a: Double, _ b: Double, delta: Double = DBL_EPSILON) -> Bool {
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
  public static func round(value: Double, toPlace place: Int = 0, by base: Int = 10) -> Double {
    let p = pow(Double(base), -1.0 * Double(place))
    return Foundation.round(value * p) / p
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
  
  //Determine if two numbers are within a distance of each other
  //Not sure if i'm missing something but may be cleaner than current version : aboutEqual
  public static func closeToEqual(a: Double, b: Double, delta: Double? = 0) -> Bool {
    
    return abs(a-b) <= delta!;
    
  }
  
  //Determine if a number is no more than a specific distance above another
  public static func closeUnderLimit(a: Double, b: Double, delta: Double? = 0) -> Bool {
    
    return a <= (b + delta!);
    
  }
  
  //Determine if a number is no less than a specific distance below another
  public static func closeOverLimit(a: Double, b: Double, delta: Double? = 0) -> Bool {
   
    return a >= (b - delta!);
    
  }
  
  //Rounds to specific number of decimal places
  public static func trimDecimal(a: Double, places: Int? = 1) -> Double {
    
    if places! <= 0 {
        return a - (a % 1);
    }
    
    var x = Double(10 << (places! - 1));
    return (round(x * a) / x);
    
  }
  
  //Snapping to a grid position, one dimension
  // - parameter pos : current position
  // - parameter gridUnitSize : multiple to snap to
  // - parameter offset : optional starting offset
  public static func snapToClosestGrid(pos: Double, gridUnitSize: Double, offset: Double? = 0) -> Double {
    
    if gridUnitSize == 0 {
      return pos;
    }
    
    var currentPos = trimDecimal(pos);
    
    currentPos -= offset!;
    currentPos = gridUnitSize * round(currentPos / gridUnitSize);
    
    return offset! + currentPos;
  }
  
  //Snapping down to grid position, one dimension
  // - parameter pos : current position
  // - parameter gridUnitSize : multiple to snap to
  // - parameter offset : optional starting offset
  public static func snapDownToGrid(pos: Double, gridUnitSize: Double, offset: Double? = 0) -> Double {
   
   if gridUnitSize == 0 {
      return pos;
    }
    
    var currentPos = trimDecimal(pos);
    
    currentPos -= offset!;
    currentPos = gridUnitSize * floor(currentPos / gridUnitSize);
    
    return offset! + currentPos;
  }
  
  //Snapping up to grid position, one dimension
  // - parameter pos : current position
  // - parameter gridUnitSize : multiple to snap to
  // - parameter offset : optional starting offset
  public static func snapUpToGrid(pos: Double, gridUnitSize: Double, offset: Double? = 0) -> Double {
    
    if gridUnitSize == 0 {
      return pos;
    }
    
    var currentPos = trimDecimal(pos);
    
    currentPos -= offset!;
    currentPos = gridUnitSize * ceil(currentPos / gridUnitSize);
    
    return offset! + currentPos;
  }

  public static func lerp(start: Double, end: Double, weight: Double) -> Double {
    return (1.0 - weight) * start + weight * end
  }

}

public extension Double {

  func isAboutEqual(to b: Double, within delta: Double = DBL_EPSILON) -> Bool {
    return Math.aboutEqual(self, b, delta: delta)
  }

  func round(toPlace place: Int, base: Int = 10) -> Double {
    return Math.round(self, toPlace: place, by: base)
  }

  func clamp(min min: Double, max: Double) -> Double {
    return Math.clamp(self, min: min, max: max)
  }

  func lerp(to end: Double, weight: Double) -> Double {
    return Math.lerp(self, end: end, weight: weight)
  }
}

public extension _ArrayType where Generator.Element == Double {
  func average() -> Double {
    return Math.average(self as! [Double])
  }
}
