//
//  GameViewController.swift
//  EmperorOfGold
//
//  Created by admin1 on 25.04.23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        let sceneView = SKView()
        self.view = sceneView
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "LoadScene") {
                scene.scaleMode = .aspectFill
                let bounds = UIScreen.main.bounds
                scene.size = CGSize(width: bounds.size.width, height: bounds.size.height)
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
