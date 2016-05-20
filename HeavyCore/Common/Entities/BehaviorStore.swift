//
//  BehaviorStore.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/18/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

public struct BehaviorStore {
  typealias BehaviorID   = Int
  typealias Behaviors    = [Behavior]

  private var storageIDs = [Behavior.Type]()
  private var storage    = [BehaviorID: [Behavior]]()

  public init() {}

  public func find<T: Behavior>(type: T.Type) -> [T]? {
    guard let id = has(type),
          let store = storage[id]
    else { return nil }
    return store.flatMap { $0 as? T }
  }

  private func has(type: Behavior.Type) -> BehaviorID? {
    guard let id = hasID(type) where hasStored(id) else { return nil }
    return id
  }

  private func hasID(type: Behavior.Type) -> BehaviorID? {
    guard let id = storageIDs.indexOf({$0 == type}) else { return nil }
    return id
  }

  private func hasStored(id: BehaviorID) -> Bool {
    guard let results = storage[id] else { return false }
    return !results.isEmpty
  }

  public mutating func add<T: Behavior>(behavior: T) {
    let type  = behavior.dynamicType
    let doesHaveID = hasID(type)
    let id = doesHaveID ?? storageIDs.count

    if doesHaveID == nil {
      storageIDs.append(type)
    }

    if storage[id] == nil {
      storage[id] = [T]()
    }
    storage[id]?.append(behavior)
  }

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
