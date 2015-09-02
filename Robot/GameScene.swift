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
            
            let movementTimeInSecs: Double = Double(randomInt(2, max: 10))
            
            //put the black hole in a random y position
            // then work out a random movement speed for it
            let lowerYBound: Int = Int(blackHoleNode.size.height / 2)
            let upperYBound: Int = Int(self.size.height - blackHoleNode.size.height / 2)
            var randomYPos = randomInt(lowerYBound, max: upperYBound)
            
            var moveAction: SKAction
            
            //generate a random moving direction
            var moveUp: Bool = randomYPos % 2 == Int(0)
            if (moveUp) {
                //calculate the proportional time to travel the rest of the distance
                var timeTaken = (Double(upperYBound - randomYPos) / Double(upperYBound - lowerYBound)) * movementTimeInSecs;
                
                let moveUp: SKAction = SKAction.moveToY(CGFloat(upperYBound), duration: NSTimeInterval(timeTaken))
                let moveDown: SKAction = SKAction.moveToY(CGFloat(lowerYBound), duration: movementTimeInSecs)
                let moveUpAgain: SKAction = SKAction.moveToY(CGFloat(upperYBound), duration: movementTimeInSecs)
                let moveUpDown: SKAction = SKAction.repeatActionForever(SKAction.sequence([moveDown, moveUpAgain]))
                moveAction = SKAction.sequence([moveUp, moveUpDown])
            }
            else {
                //calculate the proportional time to travel the rest of the distance
                var timeTaken = (Double(randomYPos - lowerYBound) / Double(upperYBound - lowerYBound)) * movementTimeInSecs;
                
                let moveDown: SKAction = SKAction.moveToY(CGFloat(lowerYBound), duration: NSTimeInterval(timeTaken))
                let moveUp: SKAction = SKAction.moveToY(CGFloat(upperYBound), duration: movementTimeInSecs)
                let moveDownAgain: SKAction = SKAction.moveToY(CGFloat(lowerYBound), duration: movementTimeInSecs)
                let moveUpDown: SKAction = SKAction.repeatActionForever(SKAction.sequence([moveUp, moveDownAgain]))
                moveAction = SKAction.sequence([moveDown, moveUpDown])
            }
            
            blackHoleNode.position = CGPointMake(100 + CGFloat(i) * 100, CGFloat(randomYPos))
            
            //blackHoleNode.physicsBody = SKPhysicsBody(circleOfRadius: blackHoleNode.size.width / 2)
            //blackHoleNode.physicsBody!.dynamic = false
            //blackHoleNode.physicsBody!.categoryBitMask = CollisionCategoryBlackHoles
            //blackHoleNode.physicsBody!.collisionBitMask = 0
            //blackHoleNode.name = BlackHoleName
            
            blackHoleNode.runAction(moveAction)
            blackHoleNode.runAction(rotateAction)
            
            self._foreground!.addChild(blackHoleNode)
        }
        
        
        
        for i in 1...20 {
            var k: Int = randomInt(1, max: 10)
            var moveUp: Bool = k % 2 == Int(0)

            println("Random number = \(k), odd = \(moveUp)")
        }
    }
    
    /* Function to generate a random integer between two inclusive bounds
        http://stackoverflow.com/questions/24007129/how-does-one-generate-a-random-number-in-apples-swift-language
    */
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}
