//
//  Scene.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/28/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public class Scene {
  private var _children = Set<Entity>()

  public var children: Set<Entity> {
    return _children
  }

  public init() {}

  public func addChild(entity: Entity) {
    _children.insert(entity)
  }

  public func removeChild(entity: Entity) {
    _children.remove(entity)
  }

}
