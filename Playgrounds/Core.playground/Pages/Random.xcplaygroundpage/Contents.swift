//: [Previous](@previous)

import HeavyCore

//
// Initialize unseeded RNG
//

//Test that seeds are changed based on system time in milliseconds
var x = PRNG()
sleep(1)
var y = PRNG()
sleep(1)
var z = PRNG()

var a = x.nextUInt()
var b = y.nextUInt()
var c = z.nextUInt()

"** EXPECT TO BE TRUE **"
a != b && a != c && b != c // Expected to be true


// View distribution over 1000 numbers with no range
for i in 0...999 {
    x.nextUInt()
}


// View distribution over 1000 numbers with max number of 1000
var maxCheckResults: [UInt] = []
var maxRangeCheck: Bool = true
for i in 0...999 {
    // Performance hit with append
    var value = x.nextUInt(max: 1000) // Added to vew distribution
    maxCheckResults.append(value)
}
for i in 0...(maxCheckResults.count - 1) {
    if(maxCheckResults[i] > 1000){
        maxRangeCheck = false
    }
}
"** EXPECT TO BE TRUE **"
maxRangeCheck // Expected to be true


// View distribution over 1000 numbers with min of 100 and max of 200
var tightRangeResults: [UInt] = []
var rangeCheck: Bool = true
for i in 0...999 {
    // Performance hit with append
    var value = x.nextUInt(100, max: 200) // Added to vew distribution
    tightRangeResults.append(value)
}
for i in 0...(tightRangeResults.count - 1) {
    if(tightRangeResults[i] < 100 || tightRangeResults[i] > 200){
        rangeCheck = false
    }
}
"** EXPECT TO BE TRUE **"
rangeCheck // Expected to be true


//
// Initialize seeded RNG
//

var r = PRNG(seed: 2345) // Seed is the same as {s} below
sleep(1)
var s = PRNG(seed: 2345) // Seed is the same as {r} above
sleep(1)
var t = PRNG(seed: 3456) // Seed is different from {s} and {r}

var sameSeedCheck: Bool = true
var diffSeedCheck: Bool = true
// Verify both RNGs with same seed produce the same numbers
// Verify the RNG with the different seed produces a different sequence
for i in 0...999 {
    var sameSeedR = r.nextUInt()
    var sameSeedS = s.nextUInt()
    var diffSeedT = t.nextUInt()
    
    if sameSeedR != sameSeedS {
        sameSeedCheck = false
    }
    
    if diffSeedT == sameSeedR || diffSeedT == sameSeedS {
        diffSeedCheck = false
    }
}

"** EXPECT TO BE TRUE **"
sameSeedCheck // Expected to be true

"** EXPECT TO BE TRUE **"
diffSeedCheck // Expected to be true


x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
x.nextUInt(0, max: 1)
//: [Next](@next)
