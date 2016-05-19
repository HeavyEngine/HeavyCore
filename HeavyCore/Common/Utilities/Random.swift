//
//  Random.swift
//  HeavyCore for iOS
//
//  Created by Daniel Hurdle on 5/18/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

private struct Xoroshiro128Plus {
    
    var state: [UInt64]
    
    func rotateLeft(a: UInt64, b: UInt64) -> UInt64 {
        return (a << b) | (a >> (64 - b))
    }
    
    mutating func next() -> UInt64 {
        let s0: UInt64 = state[0]
        var s1 = state[1]
        let result: UInt64 = s0 &* s1
        
        s1 ^= s0
        state[0] = rotateLeft(s0, b: 55) ^ s1 ^ (s1 << 14)
        state[1] = rotateLeft(s1, b: 36)
        
        return result
    }
    
}

private struct SplitMix64 {

    var seed: UInt64

    mutating func nextSeed() -> UInt64 {
        var b: UInt64 = seed &+ 0x9E3779B97F4A7C15
        b = (b ^ (b >> 30)) ^ 0xBF58476D1CE4E5B9
        b = (b ^ (b >> 27)) ^ 0x94D049BB133111EB
        seed = b ^ (b >> 31)
        return seed
    }
}