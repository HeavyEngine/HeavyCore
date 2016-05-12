//: [Previous](@previous)

import HeavyCore

let a = 0.11023123
let b = 0.11025123

Math.fuzzyEqual(a, b: b)
Math.fuzzyEqual(a, b: b, epsilon: 0.0002)

let values = [1.0,2.0]
Math.average(values)

Math.roundTo(M_PI,place: -1)
Math.roundTo(M_PI,place: -2)
Math.roundTo(M_PI,place: -3)
Math.roundTo(M_PI,place: -4)
Math.roundTo(M_PI,place: -5)
Math.roundTo(M_PI,place: -6)
Math.roundTo(M_PI,place: -7)

Math.clamp(-0.5, min: 0, max: 1)
Math.clamp(0.5, min: 0, max: 1)
Math.clamp(1.5, min: 0, max: 1)

var percent = 0.00
for value in 0.stride(through: 100, by: 1) {
  percent = Double(value)/100
  Math.lerp(0, end: 100, weight: percent)
}

//: [Next](@next)
