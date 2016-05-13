//
//  Timer.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/12/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

public struct Timer {
  private var previousTime: Double = 0

  private var period: Double {
    var info = mach_timebase_info_data_t(numer: 0, denom: 0)
    mach_timebase_info(&info)
    return Double(info.numer) / Double(info.denom) / 1000000000.0
  }

  public var time: Double {
    return Double(mach_absolute_time()) * period
  }

  public var currentTime: Double = 0
  public var averageDelta: Double = 0
  public var deltaTime: Double = 0

  public init() {} // Dumb swift/playgrounds compiler!
}

public extension Timer {
  mutating func update() {
    previousTime = currentTime
    deltaTime = currentTime - previousTime
  }

}
