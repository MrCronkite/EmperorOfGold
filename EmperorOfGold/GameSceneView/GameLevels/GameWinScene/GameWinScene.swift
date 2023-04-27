//
//  GameWinScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 26.04.23.
//

import SpriteKit

let nextLvlButton = SKSpriteNode(imageNamed: "next")
let superWinSprite = SKSpriteNode(imageNamed: "win")

private let storage: StorageManagerProtocol = StorageManager()

extension SKScene {
    
    func gameWin(){
        nextLvlButton.size = CGSize(width: 325, height: 77)
        nextLvlButton.position = CGPoint(x: 0, y: -170)
        nextLvlButton.zPosition = 4
        nextLvlButton.name = "nextLvlButton"
        
        backgroundSprite.size = CGSize(width: 1000, height: 1000)
        backgroundSprite.position = CGPoint(x: 0, y: 0)
        backgroundSprite.zPosition = 3
        
        superWinSprite.size = CGSize(width: 346.81, height: 216.81)
        superWinSprite.position = CGPoint(x: 0, y: 0)
        superWinSprite.zPosition = 4
        
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
