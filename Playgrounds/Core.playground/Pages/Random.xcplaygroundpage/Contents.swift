//: [Previous](@previous)

import HeavyCore

//
// Initialize unseeded RNG
//

//Test that seeds are changed based on system time in milliseconds
var x = RNG()
sleep(1)
var y = RNG()
sleep(1)
var z = RNG()

var a = x.getRandomNumber()
var b = y.getRandomNumber()
var c = z.getRandomNumber()


"** EXPECT TO BE TRUE **"
a != b && a != c && b != c // Expected to be true


// View distribution over 1000 numbers with no range
for i in 0...999 {
    x.getRandomNumber()
}


// View distribution over 1000 numbers with max number of 1000
var maxCheckResults: [UInt64] = []
var maxRangeCheck: Bool = true
for i in 0...999 {
    // Performance hit with append
    var value = x.getRandomNumber(max: 1000) // Added to vew distribution
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
var tightRangeResults: [UInt64] = []
var rangeCheck: Bool = true
for i in 0...999 {
    // Performance hit with append
    var value = x.getRandomNumber(100, max: 200) // Added to vew distribution
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

var r = RNG(seed: 2345) // Seed is the same as {s} below
sleep(1)
var s = RNG(seed: 2345) // Seed is the same as {r} above
sleep(1)
var t = RNG(seed: 3456) // Seed is different from {s} and {r}

var sameSeedCheck: Bool = true
var diffSeedCheck: Bool = true
// Verify both RNGs with same seed produce the same numbers
// Verify the RNG with the different seed produces a different sequence
for i in 0...999 {
    var sameSeedR = r.getRandomNumber()
    var sameSeedS = s.getRandomNumber()
    var diffSeedT = t.getRandomNumber()
    
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
//: [Next](@next)
