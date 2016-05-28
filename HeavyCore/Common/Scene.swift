//
//  Scene.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/28/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public class Scene: Graph {
  public var parent: Graph? = nil
  private var _children = Set<Entity>()

  public init() {}

  public var children: Set<Entity> {
    return _children
  }

  public func addChild(entity: Entity) {
    entity.parent = self
    _children.insert(entity)
  }

  public func removeChild(entity: Entity) {
    entity.parent = nil
    _children.remove(entity)
  }
}
