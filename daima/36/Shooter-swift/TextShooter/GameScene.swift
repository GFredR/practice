//
//  GameScene.swift


import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate  {
    private var levelNumber: Int
    private var playerLives: Int {
        didSet {
            let lives = childNode(withName: "生命值") as! SKLabelNode
            lives.text = "Lives: \(playerLives)"
        }
    }
    private var finished = false
    private let playerNode: PlayerNode = PlayerNode()
    private let enemies = SKNode()
    private let playerBullets = SKNode()
    private let forceFields = SKNode()
    
    class func scene(_ size:CGSize, levelNumber:Int) -> GameScene {
        return GameScene(size: size, levelNumber: levelNumber)
    }
    
    override convenience init(size:CGSize) {
        self.init(size: size, levelNumber: 1)
    }
    
    init(size:CGSize, levelNumber:Int) {
        self.levelNumber = levelNumber
        self.playerLives = 5
        super.init(size: size)
        
        backgroundColor = SKColor.lightGray()
        
        let lives = SKLabelNode(fontNamed: "gxj")
        lives.fontSize = 16
        lives.fontColor = SKColor.black()
        lives.name = "生命值"
        lives.text = "生命: \(playerLives)"
        lives.verticalAlignmentMode = .top
        lives.horizontalAlignmentMode = .right
        lives.position = CGPoint(x: frame.size.width,
        y: frame.size.height)
        addChild(lives)
        
        let level = SKLabelNode(fontNamed: "gxj")
        level.fontSize = 16
        level.fontColor = SKColor.black()
        level.name = "等级"
        level.text = "级别 \(levelNumber)"
        level.verticalAlignmentMode = .top
        level.horizontalAlignmentMode = .left
        level.position = CGPoint(x: 0, y: frame.height)
        addChild(level)
        
        playerNode.position = CGPoint(x: frame.midX,
                                          y: frame.height * 0.1)
        addChild(playerNode)
        
        addChild(enemies)
        spawnEnemies()
        
        addChild(playerBullets)
        
        addChild(forceFields)
        createForceFields()
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        physicsWorld.contactDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        levelNumber = aDecoder.decodeInteger(forKey: "级别")
        playerLives = aDecoder.decodeInteger(forKey: "生命值")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(Int(levelNumber), forKey: "级别")
        aCoder.encode(playerLives, forKey: "生命值")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            if location.y < frame.height * 0.2 {
                let target = CGPoint(x: location.x, y: playerNode.position.y)
                playerNode.moveToward(target)
            } else {
                let bullet = BulletNode.bullet(from: playerNode.position, toward: location)
                playerBullets.addChild(bullet)
            }
        }
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        if finished {
            return
        }
        updateBullets()
        
        updateEnemies()
        if (!checkForGameOver()) {
            checkForNextLevel()
        }
    }
    
    private func spawnEnemies() {
        let count = Int(log(Float(levelNumber))) + levelNumber
        for _ in 0..<count {
            let enemy = EnemyNode()
            let size = frame.size;
            let x = arc4random_uniform(UInt32(size.width * 0.8))
                                       + UInt32(size.width * 0.1)
            let y = arc4random_uniform(UInt32(size.height * 0.5))
                                        + UInt32(size.height * 0.5)
            enemy.position = CGPoint(x: CGFloat(x), y: CGFloat(y))
            enemies.addChild(enemy)
        }
    }
    
    private func updateBullets() {
        var bulletsToRemove:[BulletNode] = []
        for bullet in playerBullets.children as! [BulletNode] {
            // Remove any bullets that have moved off-screen
            if !frame.contains(bullet.position) {
                // Mark bullet for removal
                bulletsToRemove.append(bullet)
                continue
            }
                
            // Apply thrust to remaining bullets
            bullet.applyRecurringForce()
        }
                
        playerBullets.removeChildren(in: bulletsToRemove)
    }
    
    private func updateEnemies() {
        var enemiesToRemove:[EnemyNode] = []
        for node in enemies.children as! [EnemyNode] {
            if !frame.contains(node.position) {
                // Mark enemy for removal
                enemiesToRemove.append(node)
            }
        }
        enemies.removeChildren(in: enemiesToRemove)
    }
    
    private func checkForNextLevel() {
        if enemies.children.isEmpty {
            goToNextLevel()
        }
    }
    
    private func goToNextLevel() {
        finished = true
            
        let label = SKLabelNode(fontNamed: "gxj")
        label.text = "完成任务！"
        label.fontColor = SKColor.blue()
        label.fontSize = 32
        label.position = CGPoint(x: frame.size.width * 0.5,
                                     y: frame.size.height * 0.5)
        addChild(label)
        
        let nextLevel = GameScene(size: frame.size, levelNumber: levelNumber + 1)
        nextLevel.playerLives = playerLives
        view!.presentScene(nextLevel, transition:
                            SKTransition.flipHorizontal(withDuration: 1.0))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == contact.bodyB.categoryBitMask {
            // Both bodies are in the same category
            let nodeA = contact.bodyA.node!
            let nodeB = contact.bodyB.node!
        
            // What do we do with these nodes?
            nodeA.friendlyBumpFrom(nodeB)
            nodeB.friendlyBumpFrom(nodeA)
        } else {
            var attacker: SKNode
            var attackee: SKNode
        
            if contact.bodyA.categoryBitMask
                    > contact.bodyB.categoryBitMask {
                // Body A is attacking Body B
                attacker = contact.bodyA.node!
                attackee = contact.bodyB.node!
            } else {
                // Body B is attacking Body A
                attacker = contact.bodyB.node!
                attackee = contact.bodyA.node!
            }
        
            if attackee is PlayerNode {
                playerLives -= 1
            }
        
            // What do we do with the attacker and the attackee?
            attackee.receiveAttacker(attacker, contact: contact)
            playerBullets.removeChildren(in: [attacker])
            enemies.removeChildren(in: [attacker])
        }
    }
    private func triggerGameOver() {
        finished = true
                                
        let path = Bundle.main().pathForResource("EnemyExplosion",
                                ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObject(withFile: path!)
                                as! SKEmitterNode
        explosion.numParticlesToEmit = 200
        explosion.position = playerNode.position
        scene!.addChild(explosion)
        playerNode.removeFromParent()
                                
        let transition = SKTransition.doorsOpenVertical(withDuration: 1)
        let gameOver = GameOverScene(size: frame.size)
        view!.presentScene(gameOver, transition: transition)
        
        run(SKAction.playSoundFileNamed("gameOver.wav",
                                waitForCompletion: false))
    }
    
    private func checkForGameOver() -> Bool {
        if playerLives == 0 {
            triggerGameOver()
            return true
        }
        return false
    }
    private func createForceFields() {
        let fieldCount = 3
        let size = frame.size
        let sectionWidth = Int(size.width)/fieldCount
        for i in 0..<fieldCount {
            let x = CGFloat(UInt32(i * sectionWidth) +
                            arc4random_uniform(UInt32(sectionWidth)))
            let y = CGFloat(arc4random_uniform(UInt32(size.height * 0.25))
                            + UInt32(size.height * 0.25))
            
            let gravityField = SKFieldNode.radialGravityField()
            gravityField.position = CGPoint(x: x, y: y)
            gravityField.categoryBitMask = GravityFieldCategory
            gravityField.strength = 4
            gravityField.falloff = 2
            gravityField.region = SKRegion(size: CGSize(width: size.width * 0.3,
            height: size.height * 0.1))
            forceFields.addChild(gravityField)
            
            let fieldLocationNode = SKLabelNode(fontNamed: "gxj")
            fieldLocationNode.fontSize = 16
            fieldLocationNode.fontColor = SKColor.red()
            fieldLocationNode.name = "重力区域"
            fieldLocationNode.text = "*"
            fieldLocationNode.position = CGPoint(x: x, y: y)
            forceFields.addChild(fieldLocationNode)
        }
    }
}
