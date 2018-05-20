//
//  GameOverScene.swift


import SpriteKit

class GameOverScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor.purple()
        let text = SKLabelNode(fontNamed: "gxj")
        text.text = "Game Over"
        text.fontColor = SKColor.white()
        text.fontSize = 50
        text.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to view: SKView) {
        DispatchQueue.main.after(
            when: DispatchTime.now() + Double(3 * Int64(NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
                let transition = SKTransition.flipVertical(withDuration: 1)
                let start = StartScene(size: self.frame.size)
                view.presentScene(start, transition: transition)
            }
    }

}
