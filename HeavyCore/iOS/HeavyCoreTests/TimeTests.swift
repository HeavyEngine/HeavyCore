//
//  TimeTests.swift
//  HeavyCoreTests
//
//  Created by Dylan Wreggelsworth on 6/13/16.
//  Copyright © 2016 Heavy. All rights reserved.
//
import Quick
import Nimble
@testable import HeavyCore

class TimeTests: QuickSpec {
  override func spec() {

    describe("Time") {
      it("converts minutes to seconds") {
        let minutes: Time = 1.minutes
        let seconds: Time = 60.seconds
        expect(minutes == seconds).to(beTrue())
      }
    }

  }
}
