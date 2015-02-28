//
//  GameViewController.swift
//  swiftris
//
//  Created by giaunv on 2/27/15.
//  Copyright (c) 2015. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: GameScene!
    var swiftirs: Swiftris!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure the view
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        
        //Create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        scene.tick = didTick
        
        swiftirs = Swiftris()
        swiftirs.beginGame()
        
        //Present the scene
        skView.presentScene(scene)
        
        scene.addPreviewShapeToScene(swiftirs.nextShape!){
            self.swiftirs.nextShape?.moveTo(StartingColumn, row: StartingRow)
            self.scene.movePreviewShape(self.swiftirs.nextShape!){
                let nextShapes = self.swiftirs.newShape()
                self.scene.startTicking()
                self.scene.addPreviewShapeToScene(nextShapes.nextShape!){}
            }
        }
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func didTick(){
        swiftirs.fallingShape?.lowerShapeByOneRow()
        scene.redrawShape(swiftirs.fallingShape!, completion: {})
    }
}
