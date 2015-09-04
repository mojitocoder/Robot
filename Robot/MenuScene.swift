//
//  MenuScene.swift
//  Robot
//
//  Created by Quynh Nguyen on 04/09/2015.
//  Copyright (c) 2015 Quynh Nguyen. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(size: CGSize, score: Int) {
        super.init(size: size)
        
        let scoreTextNode = SKLabelNode(fontNamed: "Copperplate")
        scoreTextNode.text = "SCORE :  \(score)"
        scoreTextNode.horizontalAlignmentMode =
            SKLabelHorizontalAlignmentMode.Center
        scoreTextNode.verticalAlignmentMode =
            SKLabelVerticalAlignmentMode.Center
        scoreTextNode.fontSize = 20
        scoreTextNode.fontColor = SKColor.whiteColor()
        scoreTextNode.position = CGPointMake(size.width / 2, size.height / 2)
        addChild(scoreTextNode)
        
        let tryAgainTextNodeLine1 = SKLabelNode(fontNamed: "Copperplate")
        tryAgainTextNodeLine1.text = "TAP ANYWHERE"
        tryAgainTextNodeLine1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        tryAgainTextNodeLine1.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        tryAgainTextNodeLine1.fontSize = 20
        tryAgainTextNodeLine1.fontColor = SKColor.whiteColor()
        tryAgainTextNodeLine1.position = CGPointMake(size.width / 2.0, scoreTextNode.position.y - 100.0)
        addChild(tryAgainTextNodeLine1)
        
        let tryAgainTextNodeLine2 = SKLabelNode(fontNamed: "Copperplate")
        tryAgainTextNodeLine2.text = "TO PLAY AGAIN!"
        tryAgainTextNodeLine2.horizontalAlignmentMode =
            SKLabelHorizontalAlignmentMode.Center
        tryAgainTextNodeLine2.verticalAlignmentMode =
            SKLabelVerticalAlignmentMode.Center
        tryAgainTextNodeLine2.fontSize = 20
        tryAgainTextNodeLine2.fontColor = SKColor.whiteColor()
        tryAgainTextNodeLine2.position = CGPointMake(size.width / 2.0,
            tryAgainTextNodeLine1.position.y - 40.0)
        addChild(tryAgainTextNodeLine2)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let transition = SKTransition.doorsOpenHorizontalWithDuration(2.0)
        let gameScene = GameScene(size: size)
        view!.presentScene(gameScene, transition: transition)
    }
}
