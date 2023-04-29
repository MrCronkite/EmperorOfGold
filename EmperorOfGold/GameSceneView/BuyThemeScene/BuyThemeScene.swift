//
//  BuyThemeScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import SpriteKit

final class BuyThemeScene: SKScene {
    
    private let themesArrey = ["theme1", "theme2", "theme3", "theme4", "theme5", "theme6", "theme7", "theme8", "theme9", "theme10"]
    var index = 0
    
    private let storage: StorageManagerProtocol = StorageManager()
    
    private let backgroudImg = SKSpriteNode(imageNamed: "background")
    private let borderTheme = SKSpriteNode(imageNamed: "text box")
    private let themesSprite = SKSpriteNode(imageNamed: "theme1")
    private let buttonBuy = SKSpriteNode(imageNamed: "buy")
    private let backButton = SKSpriteNode(imageNamed: "back")
    private let buttonLeft = SKSpriteNode(imageNamed: "left")
    private let buttonRight = SKSpriteNode(imageNamed: "right")
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        backgroudImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroudImg.zPosition = -4
        backgroudImg.position = CGPoint(x: 0, y: 0)
        
        backButton.position = CGPoint(x: -(bounds.size.width/2-50), y: (bounds.size.height/2-50))
        backButton.size = CGSize(width: 50, height: 50)
        backButton.name = "backButton"
        backButton.zPosition = 3
        
        borderTheme.position = CGPoint(x: 0, y: 30)
        borderTheme.zPosition = -3
        borderTheme.size = CGSize(width: borderTheme.size.width/2.2, height: borderTheme.size.height/2.2)
        
        themesSprite.position = CGPoint(x: 2, y: 30)
        themesSprite.size = CGSize(width: themesSprite.size.width/2.2, height: themesSprite.size.height/2.2)
        
        buttonBuy.position = CGPoint(x: 0, y: -270)
        buttonBuy.size = CGSize(width: buttonBuy.size.width/2.2, height: buttonBuy.size.height/2.2)
        buttonBuy.name = "buy"
        
        buttonLeft.position = CGPoint(x: -135, y: 30)
        buttonLeft.size = CGSize(width: 25, height: 25)
        buttonLeft.zPosition = 2
        buttonLeft.name = "left"
        
        buttonRight.position = CGPoint(x: 135, y: 30)
        buttonRight.size = CGSize(width: 25, height: 25)
        buttonLeft.zPosition = 2
        buttonRight.name = "right"
        
        addChild(backgroudImg)
        addChild(borderTheme)
        addChild(themesSprite)
        addChild(buttonBuy)
        addChild(backButton)
        addChild(buttonLeft)
        addChild(buttonRight)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
       
        
        for node in touchedNodes.reversed() {
            switch node.name {
            case "backButton": openMenuScene()
                node.run(sequenceButton)
            case "left":
                if self.index == 10 { index = 0  }
                self.index += 1
                themesSprite.texture = SKTexture(imageNamed: themesArrey[self.index])
                node.run(sequence)
            case "right":
                if self.index <= 0 { self.index = 10 }
                self.index -= 1
                themesSprite.texture = SKTexture(imageNamed: themesArrey[self.index])
                node.run(sequence)
            case "buy": buyTheme(self.index)
                node.run(sequence)
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
    
    private func buyTheme(_ i: Int){
        let backgrounds = ["background6", "background1", "background2", "background3", "background4", "background5", "background7", "background8", "background9", "background10" ]
        storage.set(backgrounds[i], forKey: .background)
       // R.Themes.backgroundGame = backgrounds[i]
    }
}
