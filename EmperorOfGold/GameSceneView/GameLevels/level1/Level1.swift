//
//  Level1.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import SpriteKit

final class Level1: SKScene {
    
    private let backgroundImg = SKSpriteNode(imageNamed: "background1")
    private let pauseButton = SKSpriteNode(imageNamed: "pause")
    private let nameLevel = SKSpriteNode(imageNamed: "level1")
    private let borderSprite = SKSpriteNode(imageNamed: "playing field 5_8")
    
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
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
        
        for node in touchedNodes.reversed() {
            switch node.name {
            case "pauseButton": gamePause()
            default: continue
            }
        }
    }
    
    func gameOvertrue() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
//            self.gameWin()
//        }
    }
    
}
