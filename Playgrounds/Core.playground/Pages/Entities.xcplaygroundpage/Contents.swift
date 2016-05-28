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
myEntity.add(MotionBehavior())
myEntity.remove(colorB)
myEntity.has(MotionBehavior)
myEntity.has(ColorBehavior)
myEntity.add(colorB)
myEntity.add(ColorBehavior())
myEntity.add(ColorBehavior())

// Simulate a game loop...
for time in 0.stride(to: 1, by: 1.0/15) {
  myEntity.update(time)
  guard let movers = myEntity.find(MotionBehavior),
        let colors = myEntity.find(ColorBehavior)
  else { continue }
  for color in colors {
    print(color.color)
  }
  for mover in movers {
    print(mover.position)
  }
}

var newEntity = Entity()
var anotherE = newEntity
myEntity == newEntity

newEntity == anotherE
newEntity
anotherE

var myScene = Scene()
myScene.addChild(newEntity)
myScene.addChild(anotherE)
myScene.addChild(myEntity)

myScene.children.forEach { element in
  print(element)
}


//: [Next](@next)
