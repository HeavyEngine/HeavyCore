//
//  Timer.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/12/16.
//  Copyright © 2016 Heavy. All rights reserved.
//
import Foundation

public struct Timer {

  private var period: Double {
    var info = mach_timebase_info_data_t(numer: 0, denom: 0)
    mach_timebase_info(&info)
    return Double(info.numer) / Double(info.denom) / 1000000000.0
  }

  public var time: Double {
    return Double(mach_absolute_time()) * period
  }

  public var previousTime = 0.0,
             currentTime  = 0.0,
             averageDelta = 0.0,
             deltaTime    = 0.0,
             fps          = 0


  private var totalFrames         = 0,
              priorFPSUpdateTime  = 0.0,
              fpsUpdateFrequency  = 1.0,
              timeSinceLastUpdate = 0.0

  public init() {
    self.priorFPSUpdateTime = time
    self.currentTime = time
  }
}

public extension Timer {

  /// Update the timer to help measure fps, latency etc.
  /// - TODO: Turn this into something useful for actions, update ticks for the game loop...
  /// - TODO: Survey it and make sure we're robust enough, maybe improve to something like http://gafferongames.com/game-physics/fix-your-timestep/

  mutating func update() {
    totalFrames += 1
    previousTime = currentTime
    currentTime = self.time
    deltaTime = currentTime - previousTime
    timeSinceLastUpdate = currentTime - priorFPSUpdateTime

    if timeSinceLastUpdate > fpsUpdateFrequency {
      fps = Int((Double(totalFrames) / timeSinceLastUpdate) + 0.5)
      averageDelta = timeSinceLastUpdate / Double(totalFrames)
      priorFPSUpdateTime = currentTime
      totalFrames = 0
    }
  }

}
