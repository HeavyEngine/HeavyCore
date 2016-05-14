//
//  Numeric.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/13/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

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

public func ==(lhs: Numeric, rhs: Numeric) -> Bool {
  return lhs.value() == rhs.value()
}

public func +(lhs: Numeric, rhs: Numeric) -> Double {
  return lhs.value() + rhs.value()
}

public func -(lhs: Numeric, rhs: Numeric) -> Double {
  return lhs.value() - rhs.value()
}

public func /(lhs: Numeric, rhs: Numeric) -> Double {
  return lhs.value() / rhs.value()
}

public func *(lhs: Numeric, rhs: Numeric) -> Double {
  return lhs.value() * rhs.value()
}
