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

var startT = Time()
var priorT = Time()
var lastT  = Time()
let task1: Task
task1 = Task(every: 1.seconds) { time in
  print("Task1: Runs indefinitely.")
}
task1.start()

Task(after: 5.seconds) { _ in
  print("Task2: Five second delayed task, stops Task1.")
  task1.stop()
}.start()

Task(every: 1.seconds, repeatCount: 3) { _ in
  print("Task3: Runs after 1 second, three times.")
}.start()

//: [Next](@next)
