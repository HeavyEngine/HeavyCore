//
//  Random.swift
//  HeavyCore for iOS
//
//  Created by Daniel Hurdle on 5/18/16.
//  Copyright © 2016 Heavy. All rights reserved.
//

import Foundation

///  Main Pseudo-Random Number Generator
///  Translated from http://xoroshiro.di.unimi.it/xoroshiro128plus.c
public struct PRNG {
    ///  Main algorithm for generating pseudo-random numbers
    private struct Xoroshiro128Plus {

        var state: (UInt64, UInt64)

        func rotateLeft(a: UInt64, b: UInt64) -> UInt64 {
            return (a << b) | (a >> (64 - b))
        }

        mutating func next() -> UInt64 {
            let s0: UInt64 = state.0
            var s1 = state.1
            let result = s0 &+ s1

            s1 ^= s0
            state.0 = rotateLeft(s0, b: 55) ^ s1 ^ (s1 << 14)
            state.1 = rotateLeft(s1, b: 36)

            return result
        }

    }

    ///  Creates seed values to be used in Xoroshiro128Plus algorithm
    private struct SplitMix64 {

        var state: UInt64

        mutating func nextSeed() -> UInt64 {
            var b = state &+ 0x9E3779B97F4A7C15
            b = (b ^ (b >> 30)) ^ 0xBF58476D1CE4E5B9
            b = (b ^ (b >> 27)) ^ 0x94D049BB133111EB
            state = b ^ (b >> 31)
            return state
        }
    }

    public var seed: UInt64
    private var rngState: (UInt64, UInt64) = (0, 0)
    private var generator: Xoroshiro128Plus

    ///  Initialize a PRNG based on the given seed. If a seed is not given it uses Timer.time as the seed.
    ///  - parameter seed: UInt64
    ///  - returns: PRNG
    public init(seed: UInt64 = UInt64(Timer().time * 100000)) {
        self.seed = seed
        self.generator = Xoroshiro128Plus(state: (0, 0))
        generateSeeds(seed)
        self.generator.state = rngState
        nextUInt64()
    }

    private mutating func generateSeeds(seed: UInt64){
        var seeder = SplitMix64(state: seed)
        var statePart: UInt64

        for x in 0...10 {
            statePart = seeder.nextSeed()
            rngState.0 = x == 9 ? statePart : 0
            rngState.1 = x == 10 ? statePart : 0
        }
    }

    ///  Retrieves a random number with an optional range
    ///  - parameter min: (OPTIONAL) defines minimum value for a range that return value should be within
    ///  - parameter max: (OPTIONAL) defines maximum value for a range that return value should be within
    ///  - returns: returns the next random UInt64 in the sequence
    public mutating func nextUInt64(min: UInt64 = 0, max: UInt64 = UInt64.max - 1) -> UInt64 {
        return generator.next() % (max - min + 1) + min
    }
}

