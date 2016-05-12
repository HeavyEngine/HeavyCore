//
//  Entity.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/2/16.
//  Copyright © 2016 Heavy. All rights reserved.
//


public struct Entity {
  var id: String = NSUUID().UUIDString
  public var behaviors = [Behavior]()
  public init() {}
  public mutating func remove(behavior: Behavior) {
    guard let index = behaviors.indexOf({ $0.id == behavior.id }) else {
      return
    }
    behaviors.removeAtIndex(index)
  }
  public mutating func add(behavior: Behavior) {
    behaviors.append(behavior)
  }
  public mutating func update(delta: Double) {
    for behavior in behaviors {
      behavior.update(delta)
    }
  }
  public func find<T: Behavior>(type: T.Type) -> [Behavior] {
    return behaviors.filter { (element: Behavior) -> Bool in
      return element.dynamicType == type
    }
  }
}
