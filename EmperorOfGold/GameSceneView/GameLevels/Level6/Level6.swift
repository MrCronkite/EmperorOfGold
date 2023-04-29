//
//  Level6.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import SpriteKit

final class Level6: SKScene {
    
    private let storage: StorageManagerProtocol = StorageManager()
    
    private let backgroundImg = SKSpriteNode(imageNamed: "background1")
    private let pauseButton = SKSpriteNode(imageNamed: "pause")
    private let nameLevel = SKSpriteNode(imageNamed: "level1")
    private let borderSprite = SKSpriteNode(imageNamed: "playing field 5_8")
    var sprites: [SKSpriteNode] = []
    var allSpritesName: [SKSpriteNode] = []
    
    override func didMove(to view: SKView) {
        let background = storage.string(forKey: .background)
        let bounds = UIScreen.main.bounds
        backgroundImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroundImg.zPosition = -4
        backgroundImg.position = CGPoint(x: 0, y: 0)
        backgroundImg.texture = SKTexture(imageNamed: background ?? "background1")
        
        pauseButton.position = CGPoint(x: -(bounds.size.width/2-50), y: (bounds.size.height/2-50))
        pauseButton.size = CGSize(width: 50, height: 50)
        pauseButton.name = "pauseButton"
        
        nameLevel.position = CGPoint(x: 0, y: (bounds.size.height/2-70))
        nameLevel.size = CGSize(width: nameLevel.size.width/2, height: nameLevel.size.height/2)
        
        borderSprite.position = CGPoint(x: 0, y: 0)
        borderSprite.size = CGSize(width: borderSprite.size.width/2.4, height: borderSprite.size.height/2.4)
        
        addChild(nameLevel)
        addChild(pauseButton)
        addChild(borderSprite)
        addChild(backgroundImg)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gamePauseAction(touches)
        gameWinAction(touches, nextLvl: 7)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
        
        for node in touchedNodes.reversed() {
            if node.name == "pauseButton" { gamePause() }
            if node.name != nil {
                node.run(sequence)
                guard let sprite = node as? SKSpriteNode else { return }
                sprites.append(sprite)
                if sprites.count == 1 {
                    return
                } else if sprites[0].name == sprites[1].name && sprites[0].position != sprites[1].position {
                    allSpritesName.append(sprites[0])
                    sprites[0].isHidden = true
                    sprites[1].isHidden = true
                    if allSpritesName.count == 20 { gameWin() }
                    sprites = []
                } else {
                    sprites = []
                }
            }
        }
    }
}
