//
//  Graph.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/28/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

public protocol Graph {
  var parent: Graph? { get set }
  var children: Set<Entity>? { get }
  func addChild(entity: Entity)
  func removeChild(entity: Entity)
}
