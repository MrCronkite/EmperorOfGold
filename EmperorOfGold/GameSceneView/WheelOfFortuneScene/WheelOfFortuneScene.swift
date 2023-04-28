//
//  WheelOfFortuneScene.swift
//  EmperorOfGold
//
//  Created by admin1 on 26.04.23.
//

import SpriteKit

final class WheelOfFortuneScene: SKScene {
    
    var randomNumberGlobal = 0
    
    private let backgroudImg = SKSpriteNode(imageNamed: "background")
    private let backButton = SKSpriteNode(imageNamed: "back")
    private let wheelOfFortune = SKSpriteNode(imageNamed: "wheel1")
    private let betButton = SKSpriteNode(imageNamed: "bet")
    private let rollButton = SKSpriteNode(imageNamed: "roll")
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        backgroudImg.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        backgroudImg.zPosition = -4
        backgroudImg.position = CGPoint(x: 0, y: 0)
        
        backButton.position = CGPoint(x: -(bounds.size.width/2-60), y: (bounds.size.height/2-60))
        backButton.size = CGSize(width: 50, height: 50)
        backButton.name = "backButton"
        
        wheelOfFortune.position = CGPoint(x: 0, y: 40)
        wheelOfFortune.size = CGSize(width: wheelOfFortune.size.width/2.2, height: wheelOfFortune.size.height/2.2)
        wheelOfFortune.zRotation = .pi*0.3
        wheelOfFortune.name = "wheelOfFortune"
        
        betButton.position = CGPoint(x: 0, y: -190)
        betButton.size = CGSize(width: betButton.size.width/2.2, height: betButton.size.height/2.2)
        betButton.name = "betButton"
        
        rollButton.position = CGPoint(x: 0, y: -280)
        rollButton.size = CGSize(width: rollButton.size.width/2.2, height: rollButton.size.height/2.2)
        rollButton.name = "rollButton"
        
        [backButton, backgroudImg, wheelOfFortune, betButton, rollButton].forEach {
            addChild($0)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = self.nodes(at: location)
        
        for node in touchedNodes.reversed() {
            switch node.name {
            case "backButton": openMenuScene()
                node.run(sequenceButton)
            case "betButton": stopSprite()
                node.run(sequence)
            case "rollButton": rollSprite()
                node.run(sequence)
            default: continue
            }
        }
    }
    
    private func rollSprite() {
        let randomNumber = Int.random(in: 15..<27)
        self.randomNumberGlobal = randomNumber
        wheelOfFortune.zRotation = .pi*0.3
        let rotate = SKAction.rotate(byAngle: CGFloat(randomNumber), duration: 1)
        wheelOfFortune.run(rotate)
    }
    
    private func stopSprite() {
        switch randomNumberGlobal {
        case 15: print("x3")
        case 16: print("x7")
        case 17: print("x4")
        case 18: print("x2")
        case 19: print("x5")
        case 20: print("x6")
        case 21: print("lose")
        case 22: print("lose")
        case 23: print("lose")
        case 24: print("lose")
        case 25: print("lose")
        case 26: print("lose")
        default: return
        }
    }
    
    private func openMenuScene() {
        guard let view = self.view else { return }
        guard let scene = SKScene(fileNamed: "MenuScene") else { return }
        
        view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
        view.ignoresSiblingOrder = true
    }
    
}
