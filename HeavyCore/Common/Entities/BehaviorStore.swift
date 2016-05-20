//
//  BehaviorStore.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/18/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public struct BehaviorStore {
  typealias BehaviorID   = Int
  typealias Behaviors    = [Behavior]

  private var storageIDs = [Behavior.Type]()
  private var storage    = [BehaviorID: [Behavior]]()

  public init() {}

  public func find<T: Behavior>(type: T.Type) -> [Behavior]? {
    guard let id = has(type) else {
      return nil
    }
    return storage[id]
  }

  private func has(type: Behavior.Type) -> BehaviorID? {
    guard let id    = storageIDs.indexOf({$0 == type}),
          let count = storage[id]?.count
    else { return nil}
    print(count)
    return  count > 0 ? id : nil
  }

  public mutating func add(behavior: Behavior) {
    let type  = behavior.dynamicType
    let hasID = has(type)
    let id    = hasID ?? storageIDs.count

    if hasID == nil {
      storageIDs.append(type)
    }

    if storage[id] == nil {
      storage[id] = [Behavior]()
    }

    storage[id]?.append(behavior)
  }

  public mutating func remove(behavior: Behavior) {
    guard let id = has(behavior.dynamicType)
          where storage[id] != nil
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
