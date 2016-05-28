//
//  Scene.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/28/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public struct Scene {
  private var _children = Set<Entity>()

  public var children: Set<Entity> {
    return _children
  }

  public init() {}

  public mutating func addChild(entity: Entity) {
    _children.insert(entity)
  }

  public mutating func removeChild(entity: Entity) {
    _children.remove(entity)
  }

}
