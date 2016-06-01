//
//  UUID.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/28/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

///  Used for unique IDs. Uses CFUUID as it's base.
public struct UUID {
  public let cfuuid = CFUUIDCreate(nil)

  /// Return the ```String``` value of this UUID.
  public var string: String {
    return CFUUIDCreateString(nil, cfuuid) as String
  }

  public init() {}
}

func ==(left: UUID, right: UUID) -> Bool {
  return left.cfuuid == right.cfuuid
}
