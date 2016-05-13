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
  enum Color {
    case Red
    case Blue
  }

  var id: Int?
  var color: Color = .Red
  var flip = false
  func update(delta: Double) {
    //alternate colors
    flip = flip ? false : true
    color = flip ? .Blue : .Red
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
  guard let pos   = myEntity.find(MotionBehavior).first as? MotionBehavior,
            color = myEntity.find(ColorBehavior).first as? ColorBehavior
  else {
      continue
  }
  pos.position
  color.color // Should alternate
}

//: [Next](@next)