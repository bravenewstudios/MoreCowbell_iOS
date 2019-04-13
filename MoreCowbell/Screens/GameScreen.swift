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

class GameScreen: BaseScene {
    
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
    var scoreAssets:Score!
    
    var dots:[Dot] = [Dot]()
    var dotIndex = 0
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setupBackground()
        setupCowbell()
        setupBar()
        setupButtons()
        setupScore()
    }
    
    override func OnScenePresent() {
        
    }
    
    func SpawnDot() {
        //called by conductor
        dots[dotIndex].FireAction()
        dotIndex += 1
        if (dotIndex >= dots.count)
        {
            dotIndex = 0;
        }
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
        cowbell.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height * 9 / 16)
        cowbell.setScale(1)
        cowbell.name = "cowbell"
        addChild(cowbell)
    }
    
    func setupBar()
    {
        beatBar = SKSpriteNode(texture: SKTexture(imageNamed: "beat_bar"))
        beatBar.position = CGPoint(x:(UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height * 9 / 16)
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
    
    func setupScore()
    {
        scoreAssets = Score()
        score0 = scoreAssets.scoreCountArray[0]; scoreCountArray.append(score0)
        score1 = scoreAssets.scoreCountArray[1]; scoreCountArray.append(score1)
        score2 = scoreAssets.scoreCountArray[2]; scoreCountArray.append(score2)
        score3 = scoreAssets.scoreCountArray[3]; scoreCountArray.append(score3)
        score4 = scoreAssets.scoreCountArray[4]; scoreCountArray.append(score4)
        score5 = scoreAssets.scoreCountArray[5]; scoreCountArray.append(score5)
        combo0 = scoreAssets.comboCountArray[0]; comboCountArray.append(combo0)
        combo1 = scoreAssets.comboCountArray[1]; comboCountArray.append(combo1)
        combo2 = scoreAssets.comboCountArray[2]; comboCountArray.append(combo2)
        
        for s in 0...5 {
            scoreCountArray[s].setScale(0.3)
            let i = scoreCountArray[s].size.width * CGFloat(2 * s + 2)
            let r = 3 * (0.5 - drand48())
            scoreCountArray[s].position = CGPoint(x: i / 2, y: UIScreen.main.bounds.height / 7 - scoreCountArray[s].size.height * 1.5 + CGFloat(r))
            addChild(scoreCountArray[s])
        }
        
        for c in 0...2 {
            comboCountArray[c].setScale(0.3)
            let i = comboCountArray[c].size.width * CGFloat(2 * c + 2)
            let r = 3 * (0.5 - drand48())
            comboCountArray[c].position = CGPoint(x: i / 2, y: UIScreen.main.bounds.height / 7 + comboCountArray[c].size.height * 1.5 + CGFloat(r))
            addChild(comboCountArray[c])
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            
            for n in node {
                
                //MARK: - If notification button is pressed
                if n.name == "_exit" {
                    //print("YAY!")
                    scene?.view?.presentScene(gameInstance.gameScreen)
//                    let mapScene:SKScene = MapScreen(size: self.frame.size)
//                    let transition = SKTransition.push(with: .down, duration: 1)
//                    self.view?.presentScene(mapScene, transition: transition)
                }
                
                if n.name == "cowbell" {
                    //if it's a valid "hit"
                    scoreAssets.gainPoints(1)
                    //else
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
