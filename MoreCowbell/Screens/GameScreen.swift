//
//  GameScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

// import Foundation
import SpriteKit
import GameplayKit

class GameScreen: SKScene {
    
    //TODO: - Use this to create a menu scene
    var background:SKSpriteNode!
    var exitButton:SKSpriteNode!
    var scoreCounter:SKSpriteNode!
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
        setupButtons()
    }
    
    func setupBackground()
    {
        background = SKSpriteNode(texture: SKTexture(imageNamed: "stage_dark"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
        
        scoreCounter = SKSpriteNode(texture: SKTexture(imageNamed: "score_counter"))
        scoreCounter.position = CGPoint(x: (UIScreen.main.bounds.width) / 4, y: UIScreen.main.bounds.height / 11)
        //scoreCounter.size.width =
        //scoreCounter.size.height =
        addChild(scoreCounter)
        
        comboCounter = SKSpriteNode(texture: SKTexture(imageNamed: "combo_counter"))
        comboCounter.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        comboCounter.setScale(0.1)
        addChild(comboCounter)
    }
    
    func setupCowbell()
    {
        cowbell = SKSpriteNode(texture: SKTexture(imageNamed: "cowbell"))
        cowbell.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        cowbell.setScale(1)
        addChild(cowbell)
    }
    
    func setupButtons()
    {
        exitButton = SKSpriteNode(texture: SKTexture(imageNamed: "exit"))
        exitButton.position = CGPoint(x: 9 * (UIScreen.main.bounds.width) / 10, y: UIScreen.main.bounds.height / 13)
        exitButton.setScale(0.2)
        addChild(exitButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            //TODO: - Create a transition
            if exitButton.frame.contains(t.preciseLocation(in: inputView)){
                scene?.view?.presentScene(MapScreen(size: self.frame.size))
            }
            
        }
    }
}
