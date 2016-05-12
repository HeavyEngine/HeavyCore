//: [Previous](@previous)
import HeavyCore

var myEntity = Entity()

class MotionBehavior: Behavior {
  let id:Int = 0
  var position = Point()
  func update(delta: Double) {
    position.x += 0.1 * delta
  }
}
myEntity.add(MotionBehavior())

for time in 0.stride(to: 1, by: 1.0/15) {
  myEntity.update(time)
  let pos = myEntity.find(MotionBehavior).first as? MotionBehavior
  print(pos?.position)
}

//: [Next](@next)
