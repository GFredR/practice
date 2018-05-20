//
//  BulletNode.swift


import SpriteKit

class BulletNode: SKNode {
    var thrust: CGVector = CGVector(dx: 0, dy: 0)
    
    override init() {
        super.init()
        
        let dot = SKLabelNode(fontNamed: "gxj")
        dot.fontColor = SKColor.black()
        dot.fontSize = 40
        dot.text = "."
        addChild(dot)
        
        let body = SKPhysicsBody(circleOfRadius: 1)
        body.isDynamic = true
        body.categoryBitMask = PlayerMissileCategory
        body.contactTestBitMask = EnemyCategory
        body.collisionBitMask = EnemyCategory
        body.fieldBitMask = GravityFieldCategory
        body.mass = 0.01
        
        physicsBody = body
        name = "炮弹 \(self)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let dx = aDecoder.decodeFloat(forKey: "thrustX")
        let dy = aDecoder.decodeFloat(forKey: "thrustY")
        thrust = CGVector(dx: CGFloat(dx), dy: CGFloat(dy))
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(Float(thrust.dx), forKey: "thrustX")
        aCoder.encode(Float(thrust.dy), forKey: "thrustY")
    }
    
    class func bullet(from start: CGPoint, toward destination: CGPoint) -> BulletNode {
        let bullet = BulletNode()
        bullet.position = start
        let movement = vectorBetweenPoints(start, destination)
        let magnitude = vectorLength(movement)
        let scaledMovement = vectorMultiply(movement, 1/magnitude)
        
        let thrustMagnitude = CGFloat(100.0)
        bullet.thrust = vectorMultiply(scaledMovement, thrustMagnitude)
        bullet.run(SKAction.playSoundFileNamed("shoot.wav",
                                    waitForCompletion: false))
        return bullet
    }
    
    func applyRecurringForce() {
        physicsBody!.applyForce(thrust)
    }
}
