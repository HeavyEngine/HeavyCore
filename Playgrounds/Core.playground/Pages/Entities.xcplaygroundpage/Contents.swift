//: [Previous](@previous)
import HeavyCore

class MotionBehavior: Behavior {
  var id:Int?
  var position = Point()
  func update(delta: Double) {
    position.x += 0.1 * delta
  }
}

class ColorBehavior: Behavior {
  enum Colors {
    case Red
    case Blue
  }

  var id: Int?
  var color: Colors = .Red
  var tick: Bool = false
  func update(delta: Double) {
    //alternate colors
    tick = tick ? false : true
    color = tick ? .Blue : .Red
  }
}

// Make our entity...
var myEntity = Entity()

// Add the behaviors to the entity...
myEntity.add(ColorBehavior())
myEntity.add(MotionBehavior())

// Simulate a game loop...
for time in 0.stride(to: 1, by: 1.0/15) {
  myEntity.update(time)
  let pos = myEntity.find(MotionBehavior).first as? MotionBehavior
  let color = myEntity.find(ColorBehavior).first as? ColorBehavior
  print(pos?.position)
  print(color?.color)
}

//: [Next](@next)
