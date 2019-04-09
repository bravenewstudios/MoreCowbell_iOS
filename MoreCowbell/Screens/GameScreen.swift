//
//  GameScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScreen: SKScene {
    
    //TODO: - Use this to create a menu scene
    var background:SKSpriteNode!
    var exitButton:SKSpriteNode!
    var scoreCounter:SKSpriteNode!
    var score0:SKSpriteNode!; var score1:SKSpriteNode!; var score2:SKSpriteNode!;
    var score3:SKSpriteNode!; var score4:SKSpriteNode!; var score5:SKSpriteNode!;
    var combo0:SKSpriteNode!; var combo1:SKSpriteNode!; var combo2:SKSpriteNode!;
    var scoreCountArray: [SKSpriteNode] = [SKSpriteNode]()
    var comboCountArray: [SKSpriteNode] = [SKSpriteNode]()
    var comboCounter:SKSpriteNode!
    var beatBar:SKSpriteNode!
    var cowbell:SKSpriteNode!
    var MMLabel:SKLabelNode!
    
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setupBackground()
        setupCowbell()
        setupBar()
        setupButtons()
    }
    
    func setupBackground()
    {
        background = SKSpriteNode(texture: SKTexture(imageNamed: "stage_dark"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
        
        
        
//        scoreCounter = SKSpriteNode(texture: SKTexture(imageNamed: "score_counter"))
//        scoreCounter.position = CGPoint(x: (UIScreen.main.bounds.width) / 4, y: UIScreen.main.bounds.height / 13)
//        //scoreCounter.size.width =
//        //scoreCounter.size.height =
//        scoreCounter.setScale(0.2)
//        scoreCounter.yScale = 0.15
//        addChild(scoreCounter)
//
//        comboCounter = SKSpriteNode(texture: SKTexture(imageNamed: "combo_counter"))
//        comboCounter.position = CGPoint(x: scoreCounter.position.x * 0.60, y: scoreCounter.position.y + scoreCounter.size.height)
//        comboCounter.setScale(0.2)
//        comboCounter.yScale = 0.15
//        addChild(comboCounter)
    }
    
    func setupCowbell()
    {
        cowbell = SKSpriteNode(texture: SKTexture(imageNamed: "cowbell"))
        cowbell.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        cowbell.setScale(1)
        addChild(cowbell)
    }
    
    func setupBar()
    {
        beatBar = SKSpriteNode(texture: SKTexture(imageNamed: "beat_bar"))
        beatBar.position = CGPoint(x:(UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        beatBar.setScale(0.8)
        addChild(beatBar)
    }
    
    func setupButtons()
    {
        exitButton = SKSpriteNode(texture: SKTexture(imageNamed: "exit"))
        exitButton.position = CGPoint(x: 9 * (UIScreen.main.bounds.width) / 10, y: UIScreen.main.bounds.height / 13)
        exitButton.setScale(0.2)
        exitButton.name = "_exit"
        addChild(exitButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            
            for n in node {
                
                //MARK: - If notification button is pressed
                if n.name == "_exit" {
                    //print("YAY!")
                    scene?.view?.presentScene(MapScreen(size: self.frame.size))
//                    let mapScene:SKScene = MapScreen(size: self.frame.size)
//                    let transition = SKTransition.push(with: .down, duration: 1)
//                    self.view?.presentScene(mapScene, transition: transition)
                }
            }
        }
    }
}
