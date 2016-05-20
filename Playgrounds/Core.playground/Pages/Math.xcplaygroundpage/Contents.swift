//: [Previous](@previous)

import HeavyCore

let a = 0.11023123
let b = 0.11025123

a.isAboutEqual(to: b)

Math.aboutEqual(a, b, delta: 0.0002)

let values = [1.0,2.0]
Math.average(values)

Math.round(M_PI, toPlace: -1)
Math.round(M_PI, toPlace: -2)
Math.round(M_PI, toPlace: -3)
Math.round(M_PI, toPlace: -4)
Math.round(M_PI, toPlace: -5)
Math.round(M_PI, toPlace: -6)
Math.round(M_PI, toPlace: -7)

M_PI.round(toPlace: -3)

1.5.clamp(min: 0, max: 1)

var percent = 0.00
for value in 0.stride(to: 20, by: 1) {
  percent = Double(value)/20
  Math.lerp(0, end: 20, weight: percent)
}

Math.closeOverLimit(13.9283, b: 15, delta: 1.1) //expected true
Math.closeOverLimit(12.9, b: 15, delta: 2) //expected false
Math.closeOverLimit(13, b: 15) // expected false
Math.closeOverLimit(17, b: 15) // expected true

Math.closeUnderLimit(13, b: 15, delta: 2) //expected true
Math.closeUnderLimit(16, b: 15) //expected false
Math.closeUnderLimit(18, b: 15, delta: 3) //expected true
Math.closeUnderLimit(18, b: 15, delta: 2) //expected false

//: [Next](@next)
