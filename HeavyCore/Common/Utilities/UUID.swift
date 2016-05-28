//
//  UUID.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/28/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

public struct UUID {
  public let cfuuid = CFUUIDCreate(nil)

  public let string: String {
    return CFUUIDCreateString(nil, cfuuid)
  }

  public init() {}
}

func ==(left: UUID, right: UUID) -> Bool {
  return left.cfuuid == right.cfuuid
}
