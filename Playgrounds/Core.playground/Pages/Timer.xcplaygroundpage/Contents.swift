//: [Previous](@previous)

import HeavyCore

let myTimer = Timer()

let start = myTimer.now //Start time

// Silly task
var foo = "foo"
for value in 0.stride(to: 100, by: 1) {
  foo += " bar"
}
foo += "."
let end = myTimer.now //End time
(end - start).milliseconds //ms to perform task

let fpsTimer = Timer()
var prng = PRNG()

let loopStart = fpsTimer.now
for frame in 0.stride(to: 5000, by: 1) {
  prng.nextUInt64()
}
let loopEnd = fpsTimer.now
loopEnd.elapsed(loopStart)
loopEnd - loopStart // The same as above

//: [Next](@next)
