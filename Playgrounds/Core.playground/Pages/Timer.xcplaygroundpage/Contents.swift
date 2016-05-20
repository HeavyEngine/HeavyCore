//: [Previous](@previous)

import HeavyCore

let myTimer = Timer()

let start = myTimer.time //Start time

// Silly task
var foo = "foo"
for value in 0.stride(to: 100, by: 1) {
  foo += " bar"
}
foo += "."
let end = myTimer.time //End time

1000 * (end - start) //ms to perform task


var fpsTimer = Timer()
var prng = PRNG()
var loopStart = fpsTimer.time

for frame in 0.stride(to: 5000, by: 1) {
//  prng.nextUInt()
  fpsTimer.update()
  fpsTimer.deltaTime
}
var loopEnd = fpsTimer.time

(loopEnd-loopStart)

fpsTimer.fps
fpsTimer.averageDelta

//: [Next](@next)
