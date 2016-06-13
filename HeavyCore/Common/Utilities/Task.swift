//
//  Task.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 6/12/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public class Task {
  public typealias Closure = (current: Time) -> ()
  private var cancelled = false
  private var interval: Time
  private var count: Int
  private var closure: Closure
  public init(interval: Time, count: Int, closure: Closure) {
    self.interval = interval
    self.count = count
    self.closure = closure
  }
  public init(interval: Time, closure: Closure) {
    self.closure = closure
    self.interval = interval
    self.count = 0
  }
  public func start() {
    let timer = Timer()
    var currentTime = timer.now
    var accumulator = Time(0)
    let operationQueue = NSOperationQueue()
    operationQueue.addOperationWithBlock {
      repeat {
        let newTime = timer.now
        var frameTime = newTime - currentTime
        if frameTime > self.interval {
          frameTime = self.interval
        }
        currentTime = newTime
        accumulator = accumulator + frameTime
        while(accumulator >= self.interval) {
          self.closure(current: currentTime)
          self.count = self.count >= 1 ? self.count - 1 : 0
          self.cancelled = self.count == 0 || self.cancelled == true ? true : false
          accumulator = accumulator - self.interval
        }
      } while !self.cancelled
    }
  }
}
