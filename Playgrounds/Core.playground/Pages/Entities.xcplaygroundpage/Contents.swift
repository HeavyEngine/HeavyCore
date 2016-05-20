//: [Previous](@previous)
import HeavyCore

class MotionBehavior: Behavior {
  var parent: Entity?
  var position = Point()
  func update(delta: Double) {
    position.x += 0.1 * delta
  }
}

class ColorBehavior: Behavior {
  var parent: Entity?
  enum Color {
    case Red
    case Blue
  }
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
let colorB = ColorBehavior()
myEntity.add(colorB)
myEntity.add(MotionBehavior())
myEntity.remove(colorB)
myEntity.has(MotionBehavior)
myEntity.has(ColorBehavior)
myEntity.add(colorB)
myEntity.add(ColorBehavior())


// Simulate a game loop...
for time in 0.stride(to: 1, by: 1.0/15) {
  myEntity.update(time)
//  myEntity.find(MotionBehavior) as? [MotionBehavior]
  myEntity.find(ColorBehavior) as? [ColorBehavior]
  guard let movers = myEntity.find(MotionBehavior) as? [MotionBehavior],
        let colors = myEntity.find(ColorBehavior) as? [ColorBehavior]
  else { continue }
  for move in movers {
    print(move.position)
  }
  for color in colors {
    print(color.color)
  }
}

//: [Next](@next)
