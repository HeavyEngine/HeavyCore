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
  private var indefinite: Bool
  private var count: Int
  private var closure: Closure

  ///  Creates a `Task` that will run a number of times.
  ///
  ///  - parameter every: How long between the times this task should be run.
  ///  - parameter repeatCount: How many times this task should be repeat.
  ///  - parameter closure:  A closure that takes in the current time that we can use for time based side effects.
  public init(every interval: Time, repeatCount count: Int, closure: Closure) {
    self.interval = interval
    self.count = count
    self.indefinite = false
    self.closure = closure
  }

  ///  Creates a `Task` that will indefinitely until it is cancelled.
  ///
  ///  - parameter every: How long between the times this task should be run.
  ///  - parameter closure:  A closure that takes in the current time that we can use for time based side effects.
  public init(every interval: Time, closure: Closure) {
    self.closure = closure
    self.interval = interval
    self.count = 0
    self.indefinite = true
  }

  ///  Creates a `Task` that will run once after a set time.
  ///
  ///  - parameter delay: How long before this task is run.
  ///  - parameter closure:  A closure that takes in the current time that we can use for time based side effects.
  public init(after delay: Time, closure: Closure) {
    self.closure = closure
    self.interval = delay
    self.count = 1
    self.indefinite = false
  }

  ///  Start the task.
  public func start() {
    let timer = Timer()
    var currentTime = timer.now
    var accumulator = Time()
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
          self.cancelled = (self.count == 0 && self.indefinite == false)  || self.cancelled == true ? true : false
          accumulator = accumulator - self.interval
        }
      } while !self.cancelled
    }
  }

  ///  Stop the task.
  public func stop() {
    self.cancelled = true
  }
}
