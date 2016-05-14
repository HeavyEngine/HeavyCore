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

  ///  Used to remove a given `Behavior` from an `Entity`.
  ///
  ///  - parameter behavior: The `Behavior` that is to be removed.
  public mutating func remove(behavior: Behavior) {
    guard let index = behaviors.indexOf({ $0 === behavior }) else {
      return
    }
    behaviors.removeAtIndex(index)
  }

  ///  Add a behavior to this entity to be processed on update.
  ///
  ///  - parameter behavior: A behavior to be processed on update.
  public mutating func add(behavior: Behavior) {
    behavior.parent = self
    behaviors.append(behavior)
  }

  ///  Gets run on scene update and passes the delta time to
  ///  any behaviors this entity has.
  ///
  ///  - parameter delta: The time difference between now and the last update.
  public mutating func update(delta: Double) {
    for behavior in behaviors {
      behavior.update(delta)
    }
  }

  ///  Used to find any behaviors this entity has added to it.
  ///
  ///  - parameter type: The type of behavior that it should look for.
  ///
  ///  - returns: An `Array` of `Behavior` that match the type given.
  public func find<T: Behavior>(type: T.Type) -> [Behavior] {
    return behaviors.filter { (element: Behavior) -> Bool in
      return element.dynamicType == type
    }
  }

}
