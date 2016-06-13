//
//  Timer.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/12/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public struct Timer {
  var started = Time()
  private var period: UInt64 {
    var info = mach_timebase_info_data_t(numer: 0, denom: 0)
    mach_timebase_info(&info)
    return UInt64(info.numer / info.denom)
  }
  public var now: Time {
    return Time(Double(mach_absolute_time() * period))
  }
  public var age: Time {
    return now - started
  }
  public init() {
    started = now
  }
}

// MARK: - String Extensions
extension Timer: CustomStringConvertible {
  public var description: String {
    return "(started: \(started.nanoseconds), now: \(now.nanoseconds), age: \(age))"
  }
}

extension Timer: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "(started: \(started.nanoseconds), now: \(now.nanoseconds), age: \(age))"
  }
}
