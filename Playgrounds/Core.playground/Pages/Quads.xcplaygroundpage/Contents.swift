//: [Previous](@previous)

import HeavyCore

let myScreen = Quad(x: 0, y: 0, width: 640, height: 480)

let myScreen2 = Quad(x: 0, y: 0, width: 320, height: 240)

myScreen.center
myScreen.midX
myScreen.midY
myScreen.contains(myScreen2)

let F = Quad(x: 0, y: 0, width: 1, height: 1)
let G = Quad(x: 0.9998, y: 0, width: 1, height: 1)

F.intersects(G)
F.contains(G)

//: [Next](@next)