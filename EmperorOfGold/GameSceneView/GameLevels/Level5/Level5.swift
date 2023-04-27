//
//  Level5.swift
//  EmperorOfGold
//
//  Created by admin1 on 26.04.23.
//

import SpriteKit

final class Level5: SKScene {
    
    private var arreySprites = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["10", "11", "12"]
    ]
    
    private var index1: [Int] = []
    private var index2: [Int]  = []
    
    private let storage: StorageManagerProtocol = StorageManager()
    
    private let backgroundImg = SKSpriteNode(imageNamed: "background1")
    private let pauseButton = SKSpriteNode(imageNamed: "pause")
    private let nameLevel = SKSpriteNode(imageNamed: "level5")
    private let borderSprite = SKSpriteNode(imageNamed: "playing field 3_4")
    private var sprites: [SKSpriteNode] = []
    private var allSpritesName: [SKSpriteNode] = []
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        let background = storage.string(forKey: .background)
        backgroundImg.texture = SKTexture(imageNamed: background ?? "background1")
        backgroundImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroundImg.zPosition = -4
        backgroundImg.position = CGPoint(x: 0, y: 0)
        
        pauseButton.position = CGPoint(x: -(bounds.size.width/2-50), y: (bounds.size.height/2-50))
        pauseButton.size = CGSize(width: 50, height: 50)
        pauseButton.name = "pauseButton"
        
        nameLevel.position = CGPoint(x: 0, y: (bounds.size.height/2-140))
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
        gameWinAction(touches, nextLvl: 6)
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            if index1.count == 2 {
                index2 = []
                index1 = []
            }
            for node in touchedNodes.reversed() {
                if node.name == "pauseButton" { gamePause() }
                if node.name != nil {
                    guard let sprite = node as? SKSpriteNode else { return }
                    for arrey in arreySprites {
                        for i in arrey {
                            if i == sprite.name {
                                index2.append( arrey.firstIndex(where: {$0 == i})!)
                                index1.append( arreySprites.firstIndex(where: {$0 == arrey})!)
                                
                            }
                        }
                    }
                    sprites.append(sprite)
                    if sprites.count == 1 {
                        return
                    } else if sprites[0].zPosition == sprites[1].zPosition && sprites[0].position != sprites[1].position {
                        if index1.count == 1 {
                            return
                        } else if arreySprites[index1[1]][index2[0]] == "" || arreySprites[index1[0]][index2[1]] == "" {
                            win()
                        } else if index1[0] == index1[1] || index2[0] == index2[1] {
                            win()
                        } else if index2[0] == 0 || index2[1] == 0 {
                            if arreySprites[index1[0]][1] == "" && arreySprites[index1[1]][1] == "" {
                                win()
                            } else {
                                sprites = []
                            }
                        } else {
                            sprites = []
                        }
                    } else {
                        sprites = []
                    }
                }
            }
        }
    }
    
    func win() {
        allSpritesName.append(sprites[0])
        arreySprites[index1[0]][index2[0]] = ""
        arreySprites[index1[1]][index2[1]] = ""
        sprites[0].isHidden = true
        sprites[1].isHidden = true
        if allSpritesName.count == 6 { gameWin() }
        sprites = []
        index2 = []
        index1 = []
    }
}
