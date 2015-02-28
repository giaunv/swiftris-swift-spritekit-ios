//
//  GameScene.swift
//  swiftris
//
//  Created by giaunv on 2/27/15.
//  Copyright (c) 2015. All rights reserved.
//

import SpriteKit

// #1
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {
// #2
    var tick: (()->())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick: NSDate?
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
// #3
        if(lastTick == nil){
            return
        }
        
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis{
            lastTick = NSDate()
            tick?()
        }
    }
    
// #4
    func startTicking(){
        lastTick = NSDate()
    }
    
    func stopTicking(){
        lastTick = nil
    }
    
    required init(coder aDecoder:NSCoder){
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize){
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y:1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x:0, y:0)
        background.anchorPoint = CGPoint(x:0, y:1.0)
        addChild(background)
    }
}
