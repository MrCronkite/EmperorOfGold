//
//  GameWinScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 26.04.23.
//

import SpriteKit

let nextLvlButton = SKSpriteNode(imageNamed: "next")
let superWinSprite = SKSpriteNode(imageNamed: "win")

let scale = SKAction.scale(to: 1.3, duration: 0.1)
let scale1 = SKAction.scale(to: 1, duration: 0.5)
let sequence = SKAction.sequence([scale, scale1])

let scaleBtn = SKAction.scale(to: 0.9, duration: 0)
let sequenceButton = SKAction.sequence([scaleBtn])

private let storage: StorageManagerProtocol = StorageManager()

extension SKScene {
    
    
    
    func gameWin(){
        nextLvlButton.size = CGSize(width: 325, height: 77)
        nextLvlButton.position = CGPoint(x: 0, y: -170)
        nextLvlButton.zPosition = 5
        nextLvlButton.name = "nextLvlButton"
        
        backgroundSprite.size = CGSize(width: 1000, height: 1000)
        backgroundSprite.position = CGPoint(x: 0, y: 0)
        backgroundSprite.zPosition = 4
        
        superWinSprite.size = CGSize(width: 346.81, height: 216.81)
        superWinSprite.position = CGPoint(x: 0, y: 0)
        superWinSprite.zPosition = 5
        
        self.addChild(backgroundSprite)
        self.addChild(nextLvlButton)
        self.addChild(superWinSprite)
    }
    
    func gameWinAction(_ touches: Set<UITouch>, nextLvl: Int) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
        
        for node in touchedNodes.reversed() {
            switch node.name {
            case "nextLvlButton": openNextLevel()
            default: continue
            }
        }
        
        func openNextLevel() {
            storage.set("Level\(nextLvl)", forKey: .curentLvl)
            let level = storage.string(forKey: .curentLvl)
            guard let view = self.view else { return }
            guard let scene = SKScene(fileNamed: level ?? "Level1") else { return }
            
            view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
            view.ignoresSiblingOrder = true
        }
    }
}
