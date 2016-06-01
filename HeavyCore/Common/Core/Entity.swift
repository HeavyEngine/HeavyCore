//
//  Entity.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/2/16.
//  Copyright © 2016 Heavy. All rights reserved.
//
import Foundation

public class Entity: Graph {
  var id = UUID()

  public var behaviors = BehaviorStore()

  public var parent: Graph? = nil

  private var _children = Set<Entity>()

  public var children: Set<Entity>? {
    return _children.count > 0 ? _children : nil
  }

  public func addChild(entity: Entity) {
    entity.parent = self
    _children.insert(entity)
  }

  public func removeChild(entity: Entity) {
    entity.parent = nil
    _children.remove(entity)
  }

  public init() {}

  ///  Used to remove a given `Behavior` from an `Entity`.
  ///
  ///  - parameter behavior: The `Behavior` that is to be removed.
  public func remove(behavior: Behavior) {
    behaviors.remove(behavior)
  }

  ///  Add a behavior to this entity to be processed on update.
  ///
  ///  - parameter behavior: A behavior to be processed on update.
  public func add<T: Behavior>(behavior: T) {
    behavior.parent = self
    behaviors.add(behavior)
  }

  ///  Gets run on scene update and passes the delta time to
  ///  any behaviors this entity has.
  ///
  ///  - parameter delta: The time difference between now and the last update.
  public func update(delta: Double) {
    for behavior in behaviors {
      behavior.update(delta)
    }
  }

  ///  Used to find any behaviors this entity has added to it.
  ///
  ///  - parameter type: The type of behavior that it should look for.
  ///
  ///  - returns: An `Array` of `Behavior` that match the type given.
  public func find<T: Behavior>(behavior: T.Type) -> [T]? {
    guard let results = behaviors.find(behavior) else {
      return nil
    }
    return results
  }

  public func has<T: Behavior>(behavior: T.Type) -> Bool {
    return find(behavior) != nil ? true : false
  }
}

// MARK: - String Extensions
extension Entity: CustomStringConvertible {
  public var description: String {
    return "{id: \(id.string) behaviors: \(behaviors), children: \(children)}"
  }
}

extension Entity: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "{id: \(id.string), behaviors: \(behaviors), children: \(children)}"
  }
}

extension Entity: Hashable {
  public var hashValue: Int {
    return id.string.hashValue

  }
}

public func ==(left: Entity, right: Entity) -> Bool {
  return left === right
}
