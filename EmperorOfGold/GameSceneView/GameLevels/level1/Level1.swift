//
//  Level1.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import SpriteKit

final class Level1: SKScene {
    
    private let backgroundImg = SKSpriteNode(imageNamed: R.Themes.backgroundGame)
    private let pauseButton = SKSpriteNode(imageNamed: "pause")
    private let nameLevel = SKSpriteNode(imageNamed: "level1")
    private let borderSprite = SKSpriteNode(imageNamed: "playing field 5_8")
    var firstSprite: [SKSpriteNode] = []
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        backgroundImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroundImg.zPosition = -4
        backgroundImg.position = CGPoint(x: 0, y: 0)
        
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
        gameOvertrue()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gamePauseAction(touches)
        gameWinAction(touches)
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            
            for node in touchedNodes.reversed() {
                if node.name != nil {
                    guard let sprite = node as? SKSpriteNode else { return }
                    firstSprite.append(sprite)
                    if firstSprite.count == 1 {
                        return
                    } else if firstSprite[0].name == firstSprite[1].name {
                        firstSprite[0].isHidden = true
                        firstSprite[1].isHidden = true
                        firstSprite = []
                    } else if firstSprite.count > 2 {
                        firstSprite = []
                    }
                }
                
                if node.name == "pauseButton" { gamePause() }
            }
        }
    }
    
    func gameOvertrue() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
//            self.gameWin()
//        }
    }
    
}
