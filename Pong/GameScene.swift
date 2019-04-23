//
//  GameScene.swift
//  Pong
//
//  Created by Bailey Carlson on 4/16/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
   var topPaddle = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
       let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        
        let topLeft = CGPoint(x: frame.origin.x, y: -frame.origin.y)
        let topRight = CGPoint(x: -frame.origin.x, y: -frame.origin.y)
        
        let top = SKNode()
        top.name = "top"
        top.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        self.addChild(top)
        
        topPaddle = self.childNode(withName: "topPaddle") as! SKSpriteNode
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact.bodyA.node?.name)
        print(contact.bodyB.node?.name)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        topPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        topPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
    }
}
