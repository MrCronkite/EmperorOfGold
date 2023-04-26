//
//  MenuScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import SpriteKit

final class MenuScene: SKScene {
    
    private let backgroudImg = SKSpriteNode(imageNamed: "background")
    private let themesButton = SKSpriteNode(imageNamed: "themes")
    private let startButton = SKSpriteNode(imageNamed: "start")
    private let howToPlayButton = SKSpriteNode(imageNamed: "how to play")
    private let settingsButton = SKSpriteNode(imageNamed: "settings")
    private let wheelOfFortuneButton = SKSpriteNode(imageNamed: "wheel of fortune")
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        backgroudImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroudImg.zPosition = -4
        backgroudImg.position = CGPoint(x: 0, y: 0)
        
        themesButton.position = CGPoint(x: 0, y: 0)
        themesButton.size = CGSize(width: themesButton.size.width/2.2, height: themesButton.size.height/2.2)
        themesButton.name = "themesButton"
        
        howToPlayButton.position = CGPoint(x: 0, y: 100)
        howToPlayButton.size = CGSize(width: howToPlayButton.size.width/2.2, height: howToPlayButton.size.height/2.2)
        howToPlayButton.name = "howToPlayButton"
        
        startButton.position = CGPoint(x: 0, y: 200)
        startButton.size = CGSize(width: startButton.size.width/2.2, height: startButton.size.height/2.2)
        startButton.name = "startButton"
        
        settingsButton.position = CGPoint(x: 0, y: -100)
        settingsButton.size = CGSize(width: settingsButton.size.width/2.2, height: settingsButton.size.height/2.2)
        settingsButton.name = "settingsButton"
        
        wheelOfFortuneButton.position = CGPoint(x: 0, y: -200)
        wheelOfFortuneButton.size = CGSize(width: wheelOfFortuneButton.size.width/2.2, height: wheelOfFortuneButton.size.height/2.2)
        wheelOfFortuneButton.name = "wheelOfFortuneButton"
        
        addChild(backgroudImg)
        addChild(themesButton)
        addChild(startButton)
        addChild(howToPlayButton)
        addChild(settingsButton)
        addChild(wheelOfFortuneButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
        
        for node in touchedNodes.reversed() {
            switch node.name {
            case "themesButton": openBuyThemeScene()
            case "howToPlayButton": openRulesScene()
            case "startButton": openLevelsScene()
            case "settingsButton": openSettingsScene()
            case "wheelOfFortuneButton": openWheelOfFortuneScene()
            default: continue
            }
        }
    }
    
    private func openRulesScene() {
        guard let view = self.view else { return }
        guard let scene = SKScene(fileNamed: "RulesScene") else { return }
        
        view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
        view.ignoresSiblingOrder = true
    }
    
    private func openLevelsScene() {
        guard let view = self.view else { return }
        guard let scene = SKScene(fileNamed: "Level1") else { return }
        
        view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
        view.ignoresSiblingOrder = true
    }
    
    private func openBuyThemeScene() {
        guard let view = self.view else { return }
        guard let scene = SKScene(fileNamed: "BuyThemeScene") else { return }
        
        view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
        view.ignoresSiblingOrder = true
    }
    
    private func openSettingsScene() {
        guard let view = self.view else { return }
        guard let scene = SKScene(fileNamed: "SettingsScene") else { return }
        
        view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
        view.ignoresSiblingOrder = true
    }
    
    private func openWheelOfFortuneScene() {
        guard let view = self.view else { return }
        guard let scene = SKScene(fileNamed: "WheelOfFortuneScene") else { return }
        
        view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
        view.ignoresSiblingOrder = true
    }
}
