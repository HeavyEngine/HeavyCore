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
foo
let end = myTimer.time //End time

1000 * (end - start) //ms to perform task

//: [Next](@next)