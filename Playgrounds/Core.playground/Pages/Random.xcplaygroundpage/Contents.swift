//: [Previous](@previous)

import HeavyCore

///
/// Xoroshiro128+ implementation
///
var state: [UInt64] = [313141, 124524521123]

func rotateLeft(a: UInt64, b: UInt64) -> UInt64 {
    return (a << b) | (a >> (64 - b))
}

func next() -> UInt64 {
    let s0: UInt64 = state[0]
    var s1 = state[1]
    let result: UInt64 = s0 &* s1
    
    s1 ^= s0
    state[0] = rotateLeft(s0, b: 55) ^ s1 ^ (s1 << 14)
    state[1] = rotateLeft(s1, b: 36)
    
    return result
}

//func jump() {
//    let JUMP: [UInt64] = [ 0xbeac0467eba5facb, 0xd86b048b86aa9922 ]
//    
//    var s0: UInt64 = 0;
//    var s1: UInt64 = 0;
//    
//    for i in 0 ..< sizeofValue(JUMP)/sizeofValue(unsafeAddressOf(JUMP as! AnyObject)) {
//        for b in 0 ..< 64 {
//            if JUMP[i] & 1 << UInt64(b) != 0 {
//                s0 ^= state[0]
//                s1 ^= state[1]
//            }
//            next()
//        }
//    }
//    state[0] = s0
//    state[1] = s1
//}

var seed: UInt64 = UInt64(NSDate().timeIntervalSinceReferenceDate)

func nextSeed() -> UInt64 {
    var b: UInt64 = seed &+ 0x9E3779B97F4A7C15
    b = (b ^ (b >> 30)) ^ 0xBF58476D1CE4E5B9
    b = (b ^ (b >> 27)) ^ 0x94D049BB133111EB
    seed = b ^ (b >> 31)
    return seed
}

//: [Next](@next)
