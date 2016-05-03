//: [Previous](@previous)

import HeavyCore

let myVector = Vector(dx: 1,dy: 1)
normalize(myVector)
let myAltVector = invert(myVector)
cross(myVector, right: myAltVector)
dot(myVector, right: myAltVector)

let radians = 16.0

let radVector = Vector(radians: radians)
let degVector = Vector(degrees: radians.inDegrees)
let oVector = Vector(radians: radians.inDegrees.inRadians)

radVector == degVector && degVector == oVector

angle(myVector).inDegrees

// These precision errors may be an issue?
angle(rotate(myVector, theta: 45.inRadians)).inDegrees
// OR
myVector.rotate(45.inRadians).angle().inDegrees


var percent = 0.00
for frame in 0.stride(through: 100, by: 1) {
  percent = Double(frame)/100
  let lerpVector = myVector.lerp(to: Vector(dx: 2, dy: 2), by:percent)
  print(lerpVector, "\(percent * 100)%")

}

//: [Next](@next)
