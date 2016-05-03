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

//: [Next](@next)
