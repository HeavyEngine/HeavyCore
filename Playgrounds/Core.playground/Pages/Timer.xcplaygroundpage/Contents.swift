//: [Previous](@previous)
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

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
loopEnd - loopStart

var startT: Time?
var lastT: Time?
var priorT: Time?

Task(interval: 1.seconds, count: 5) { time in
  if startT == nil {
    startT = time
  }
  priorT = lastT
  lastT = time
  if let start = startT, last = lastT, prior = priorT {
    "currentDuration \((last - start).milliseconds)"
    "\n delta \((last - prior).milliseconds)"
  }
}.start()

//: [Next](@next)