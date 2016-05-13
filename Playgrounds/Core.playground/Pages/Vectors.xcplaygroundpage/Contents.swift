//: [Previous](@previous)

import HeavyCore

let myVector = Vector(dx: 1,dy: 1)
myVector.normalize()
let myAltVector = myVector.invert()
myVector.cross(myAltVector)
myVector.dot(myAltVector)

let radians = 16.0

let radVector = Vector(radians: radians)
let degVector = Vector(degrees: radians.inDegrees)
let oVector = Vector(radians: radians.inDegrees.inRadians)

radVector == degVector && degVector == oVector

myVector.angle.inDegrees

// These precision errors may be an issue?
//myVector.rotate(45.radian).angle.inDegrees

var percent = 0.00
for frame in 0.stride(to: 100, by: 1) {
  percent = Double(frame)/100
  let lerpVector = myVector.lerp(to: Vector(dx: 2, dy: 2), by:percent)
  lerpVector.dx
  lerpVector.dy
  lerpVector.magnitude
}


//: [Next](@next)
