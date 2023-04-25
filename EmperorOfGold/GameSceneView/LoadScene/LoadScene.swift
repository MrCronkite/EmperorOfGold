//
//  LoadScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import SpriteKit
import GameplayKit

final class LoadScene: SKScene {
    
    private let backgroudImg = SKSpriteNode(imageNamed: "background")
    private let icon = SKSpriteNode(imageNamed: "icon")
    private let loadBorder = SKSpriteNode(imageNamed: "loading1")
    private let loadLine = SKSpriteNode(imageNamed: "loading2")
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        backgroudImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroudImg.zPosition = -4
        backgroudImg.position = CGPoint(x: 0, y: 0)
        
        icon.position = CGPoint(x: 0, y: 0)
        icon.size = CGSize(width: icon.size.width/2.2, height: icon.size.height/2.2)
        
        loadBorder.position = CGPoint(x: 0, y: -200)
        loadBorder.size = CGSize(width: loadBorder.size.width/2.2, height: loadBorder.size.height/2.2)
        loadBorder.zPosition = -2
        
        loadLine.position = CGPoint(x: 0, y: -200)
        loadLine.size = CGSize(width: loadLine.size.width/2.2, height: loadLine.size.height/2.2)
        
        addChild(backgroudImg)
        addChild(icon)
        addChild(loadBorder)
        addChild(loadLine)
        
        loadMenu()
    }
    
    func loadMenu() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard let view = self.view else { return }
            guard let scene = SKScene(fileNamed: "MenuScene") else { return }
            
            view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
            view.ignoresSiblingOrder = true
        }
    }
}
