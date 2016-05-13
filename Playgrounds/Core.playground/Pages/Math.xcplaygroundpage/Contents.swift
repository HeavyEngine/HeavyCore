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

Math.clamp(-0.5, min: 0, max: 1)

1.5.clamp(min: 0, max: 1)

var percent = 0.00
for value in 0.stride(to: 20, by: 1) {
  percent = Double(value)/20
  Math.lerp(0, end: 20, weight: percent)
}

//: [Next](@next)
