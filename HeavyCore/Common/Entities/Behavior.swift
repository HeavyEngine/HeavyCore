//
//  Behavior.swift
//  HeavyCore
//
//  Created by Dylan Wreggelsworth on 5/2/16.
//  Copyright © 2016 Heavy. All rights reserved.
//
public typealias Update = (delta: Double) -> ()

public protocol Behavior: class {
  var id: Int? { get set }
  func update(delta: Double)
}
