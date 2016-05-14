//
//  Behavior.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/2/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

///  A class that defines the behavior of an `Entity` that
///  usually changes when `update` run given a time delta.
public protocol Behavior: class {
  var parent: Entity? { get set }
  func update(delta: Double)
}
