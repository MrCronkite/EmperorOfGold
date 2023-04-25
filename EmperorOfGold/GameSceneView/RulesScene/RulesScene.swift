//
//  RulesScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import SpriteKit
import GameplayKit

final class RulesScene: SKScene {
    
    private let backgroudImg = SKSpriteNode(imageNamed: "background")
    private let backButton = SKSpriteNode(imageNamed: "back")
    private let rulesBackgroundView = SKSpriteNode(imageNamed: "rules")
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        backgroudImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroudImg.zPosition = -4
        backgroudImg.position = CGPoint(x: 0, y: 0)
        
        rulesBackgroundView.position = CGPoint(x: 0, y: -30)
        rulesBackgroundView.size = CGSize(width: rulesBackgroundView.size.width/2.2, height: rulesBackgroundView.size.height/2.2)
        
        backButton.position = CGPoint(x: -(bounds.size.width/2-50), y: (bounds.size.height/2-50))
        backButton.size = CGSize(width: 50, height: 50)
        backButton.name = "backButton"
        
        addChild(backgroudImg)
        addChild(backButton)
        addChild(rulesBackgroundView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
        touchedNodes.reversed().forEach {
            if $0.name == "backButton" {
                guard let view = self.view else { return }
                guard let scene = SKScene(fileNamed: "MenuScene") else { return }
                
                view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
                view.ignoresSiblingOrder = true
            }
        }
    }
    
}
