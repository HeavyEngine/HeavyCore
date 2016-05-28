//
//  CFUUID.swift
//  HeavyCore for iOS
//
//  Created by Dylan Wreggelsworth on 5/28/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

extension CFUUID {
  init() {
    return CFUUIDCreate(nil)
  }
}

public func ==(left: CFUUID, right: CFUUID) -> Bool {
  return CFEqual(left, right)
}
