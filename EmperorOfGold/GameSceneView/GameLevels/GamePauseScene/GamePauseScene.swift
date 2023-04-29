//
//  GamePauseScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 26.04.23.
//

import SpriteKit

let menuButtons = SKSpriteNode(imageNamed: "menu")
let restartButton = SKSpriteNode(imageNamed: "restart")
let backgroundSprite = SKSpriteNode(imageNamed: "playing field 5_8")

extension SKScene {
    
    func gamePause(){
        menuButtons.size = CGSize(width: 325, height: 77)
        menuButtons.position = CGPoint(x: 0, y: 70)
        menuButtons.zPosition = 4
        menuButtons.name = "menuButtons"
        
        backgroundSprite.size = CGSize(width: 1000, height: 1000)
        backgroundSprite.position = CGPoint(x: 0, y: 0)
        backgroundSprite.zPosition = 3
        
        restartButton.size = CGSize(width: 325, height: 77)
        restartButton.position = CGPoint(x: 0, y: -70)
        restartButton.zPosition = 4
        restartButton.name = "restartButton"
        
        self.addChild(menuButtons)
        self.addChild(backgroundSprite)
        self.addChild(restartButton)
    }
    
    func gamePauseAction(_ touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
        let scaleBtn1 = SKAction.scale(to: 0.7, duration: 0.5)
        let sequenceButton1 = SKAction.sequence([scaleBtn1])
        
        for node in touchedNodes.reversed() {
            switch node.name {
            case "menuButtons": openMenuScene()
                node.run(sequenceButton1)
            case "restartButton": restartScene()
                node.run(sequenceButton1)
            default: continue
            }
        }
        
        func openMenuScene() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                guard let view = self.view else { return }
                guard let scene = SKScene(fileNamed: "MenuScene") else { return }
                
                view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
                view.ignoresSiblingOrder = true
            }
        }
        
        func restartScene() {
                guard let view = self.view else { return }
                guard let nameScene = self.scene?.name else { return }
                guard let scene = SKScene(fileNamed: nameScene ) else { return }
                let transition = SKTransition.fade(withDuration: 0.5)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                view.presentScene(scene, transition: transition)
                view.ignoresSiblingOrder = true
            }
        }
    }
}


