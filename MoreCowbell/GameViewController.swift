//
//  GameViewController.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var gameInstance = GameInstance()

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            gameInstance.LoadSongs()
            gameInstance.LoadScenes(viewSize: self.view.frame.size)

            view.presentScene(gameInstance.startScreen)
            
//            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
