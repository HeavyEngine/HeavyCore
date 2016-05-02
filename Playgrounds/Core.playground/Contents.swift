//: Playground - noun: a place where people can play

import HeavyCore

struct Lander: Entity {
  var position = Point()
}

var myLander = Lander()
myLander.position = Point(x: 1, y: 1)
myLander.position.distanceTo(Point())

