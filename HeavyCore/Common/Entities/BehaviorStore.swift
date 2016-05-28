//
//  BehaviorStore.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/18/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

///  Used for storing different behavior types so they can be retrieved easily.
///  - Todo: Add pooling
public struct BehaviorStore {
  typealias BehaviorID   = Int
  typealias Behaviors    = [Behavior]

  private var storageIDs = [Behavior.Type]()
  private var storage    = [BehaviorID: [Behavior]]()
  public var values: Array<Behavior> {
    return self.flatMap({return $0})
  }

  public init() {}

  private func has(type: Behavior.Type) -> BehaviorID? {
    guard let id = hasIndex(type) where storage[id] != nil else { return nil }
    return id
  }

  private func hasIndex(type: Behavior.Type) -> BehaviorID? {
    guard let id = storageIDs.indexOf({$0 == type}) else { return nil }
    return id
  }

  ///  Find all of the `Behavior.Type` this particular store contains.
  ///
  ///  - parameter type: The `Behavior.Type` you wish to find.
  ///
  ///  - returns: A collection of the `Behavior.Type` you are looking for or `nil`.
  public func find<T: Behavior>(type: T.Type) -> [T]? {
    guard let id    = has(type),
              store = storage[id] else { return nil }
    return store.flatMap { $0 as? T }
  }

  ///  Add a reference to a given `Behavior` to the store.
  ///
  ///  - parameter behavior: The `Behavior` reference you wish to store.
  public mutating func add<T: Behavior>(behavior: T) {
    let type  = behavior.dynamicType
    let index = hasIndex(type)
    let id = index ?? storageIDs.count
    if index == nil {
      storageIDs.append(type)
    }
    if storage[id] == nil {
      storage[id] = [T]()
    }
    storage[id]?.append(behavior)
  }

  ///  Remove this `Behavior` from the store.
  ///
  ///  - parameter behavior: A reference to the behavior you wish to remove.
  public mutating func remove(behavior: Behavior) {
    guard let id = has(behavior.dynamicType)
          where storage[id]?.count > 0
    else {
      return
    }
    guard let index = storage[id]?.indexOf({$0 === behavior}) else {
      return
    }
    storage[id]?.removeAtIndex(index)
  }
}

public struct BehaviorStoreGenerator: GeneratorType {
  var store: BehaviorStore
  var index = 0
  var localIndex = 0
  public init(store: BehaviorStore) {
    self.store = store
  }
  mutating public func next() -> Behavior? {
    guard let localStore = store.storage[index] else {
      return nil
    }
    if localIndex == localStore.count {
      index += 1
      localIndex = 0
    }
    let result = store.storage[index]?[localIndex]
    localIndex += 1
    return result
  }
}

extension BehaviorStore: SequenceType {
  public func generate() -> BehaviorStoreGenerator {
    return BehaviorStoreGenerator(store: self)
  }
}

public func ==(left: BehaviorStore, right: BehaviorStore) -> Bool {
  return left.elementsEqual(right, isEquivalent: {$0 === $1})
}
