//
//  SettingsScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import SpriteKit

final class SettingsScene: SKScene {
    
    private let backgroudImg = SKSpriteNode(imageNamed: "background")
    private let backButton = SKSpriteNode(imageNamed: "back")
    private let soundSprite = SKSpriteNode(imageNamed: "sound")
    private let musicSprite = SKSpriteNode(imageNamed: "music")
    private let stripSprite = SKSpriteNode(imageNamed: "stripe")
    private let stripSprit1 = SKSpriteNode(imageNamed: "stripe")
    private let circleSprite = SKSpriteNode(imageNamed: "circle")
    private let circleSprite1 = SKSpriteNode(imageNamed: "circle")
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        backgroudImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroudImg.zPosition = -4
        backgroudImg.position = CGPoint(x: 0, y: 0)
        
        soundSprite.position = CGPoint(x: 0, y: 150)
        soundSprite.size = CGSize(width: soundSprite.size.width/2.2, height: soundSprite.size.height/2.2)
        
        stripSprite.position = CGPoint(x: 0, y: 80)
        stripSprite.size = CGSize(width: stripSprite.size.width/2.2, height: stripSprite.size.height/2.2)
        stripSprite.zPosition = -3
        
        circleSprite.position = CGPoint(x: 50, y: 78)
        circleSprite.size = CGSize(width: circleSprite.size.width/2.2, height: circleSprite.size.height/2.2)
        
        musicSprite.position = CGPoint(x: 0, y: -80)
        musicSprite.size = CGSize(width: musicSprite.size.width/2.2, height: musicSprite.size.height/2.2)
        
        stripSprit1.position = CGPoint(x: 0, y: -150)
        stripSprit1.size = CGSize(width: stripSprit1.size.width/2.2, height: stripSprit1.size.height/2.2)
        stripSprit1.zPosition = -3
        
        circleSprite1.position = CGPoint(x: -20, y: -152)
        circleSprite1.size = CGSize(width: circleSprite1.size.width/2.2, height: circleSprite1.size.height/2.2)
        
        backButton.position = CGPoint(x: -(bounds.size.width/2-50), y: (bounds.size.height/2-50))
        backButton.size = CGSize(width: 50, height: 50)
        backButton.name = "backButton"
        
        addChild(backgroudImg)
        addChild(backButton)
        addChild(soundSprite)
        addChild(musicSprite)
        addChild(stripSprit1)
        addChild(stripSprite)
        addChild(circleSprite)
        addChild(circleSprite1)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
        
        for node in touchedNodes.reversed() {
            switch node.name {
            case "backButton": openMenuScene()
            case "left": print("sdsds")
            case "right": print("sdsdsds")
            case "buy": print("buy")
            default: continue
            }
        }
    }
    
    private func openMenuScene() {
        guard let view = self.view else { return }
        guard let scene = SKScene(fileNamed: "MenuScene") else { return }
        
        view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
        view.ignoresSiblingOrder = true
    }
    
    
}
