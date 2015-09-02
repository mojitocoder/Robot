//
//  GameScene.swift
//  Robot
//
//  Created by Quynh Nguyen on 02/09/2015.
//  Copyright (c) 2015 Quynh Nguyen. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    var _player : SKSpriteNode?
    var _foreground : SKSpriteNode?
    
    
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init (size: CGSize) {
        super.init(size: size)
        
        //dealing with the foreground
        _foreground = SKSpriteNode()
        self.addChild(_foreground!)
        
        
        //create the player here
        _player = SKSpriteNode(imageNamed: "Robot")
        _player!.position = CGPointMake(50, self.size.height / 2)
        _foreground!.addChild(_player!)
        
        
        createBlackHoles()
        
    }
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    func createBlackHoles() {
        println("Go off and create some black holes onto the scene")
        
        let textureAtlas = SKTextureAtlas(named: "sprites.atlas")
        let frame0 = textureAtlas.textureNamed("BlackHole0")
        let frame1 = textureAtlas.textureNamed("BlackHole1")
        let frame2 = textureAtlas.textureNamed("BlackHole2")
        let frame3 = textureAtlas.textureNamed("BlackHole3")
        let frame4 = textureAtlas.textureNamed("BlackHole4")
        let blackHoleTextures = [frame0, frame1, frame2, frame3, frame4]
        let animateAction = SKAction.animateWithTextures(blackHoleTextures, timePerFrame: 0.2)
        let rotateAction = SKAction.repeatActionForever(animateAction)
        
        //let moveLeftAction = SKAction.moveToX(0.0, duration: 2.0)
        //let moveRightAction = SKAction.moveToX(size.width, duration: 2.0)
        //let actionSequence = SKAction.sequence([moveLeftAction, moveRightAction])
        //let moveAction = SKAction.repeatActionForever(actionSequence)
        
        for i in 1...10 {
            
            var blackHoleNode = SKSpriteNode(imageNamed: "BlackHole0")
            blackHoleNode.position = CGPointMake(100 + CGFloat(i) * 150, 50)
            //blackHoleNode.physicsBody = SKPhysicsBody(circleOfRadius: blackHoleNode.size.width / 2)
            //blackHoleNode.physicsBody!.dynamic = false
            //blackHoleNode.physicsBody!.categoryBitMask = CollisionCategoryBlackHoles
            //blackHoleNode.physicsBody!.collisionBitMask = 0
            //blackHoleNode.name = BlackHoleName
            
            //blackHoleNode.runAction(moveAction)
            blackHoleNode.runAction(rotateAction)
            
            self._foreground!.addChild(blackHoleNode)
        }

    }
}
