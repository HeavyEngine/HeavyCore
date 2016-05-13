//: [Previous](@previous)

import HeavyCore

var myVector = Vector(dx: 2,dy: 1)
myVector.normalize()
let myAltVector = Vector(angle: 45.degrees, magnitude: sqrt(2.0))
myVector.cross(myAltVector)
myVector.dot(myAltVector)

myVector.angle.degrees

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
