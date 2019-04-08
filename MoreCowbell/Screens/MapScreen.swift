//
//  MapScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

// import Foundation
import SpriteKit
import GameplayKit

class levelStar : SKSpriteNode
{
    init()
    {
        let texture = SKTexture(imageNamed: "star")
        super.init(texture: texture, color:UIColor.clear, size:texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MapScreen: SKScene {
    
    //TODO: - Use this to create a menu scene
    var exitButton:SKSpriteNode!
    var playButton:SKSpriteNode!
    var background:SKSpriteNode!
    var MMLabel:SKLabelNode!
    var stateMap:SKSpriteNode!
    var starSize: SKSpriteNode!
    var star1:levelStar!
    var star2:levelStar!
    var star3:levelStar!
    var levels: [levelStar] = [levelStar]()
    var exitSign:SKSpriteNode!
    var startSign:SKSpriteNode!
    var paper:SKSpriteNode!
    var text1:SKSpriteNode!
    var text2:SKSpriteNode!
    var text3:SKSpriteNode!
    var xPaper:SKSpriteNode!
    var starActive = true
    var dropDown:SKAction!
    var signMove:SKAction!
    
    var mapMusic:SKAudioNode!

    //TODO: - Add a main menu and play button
    override init(size: CGSize)
    {
        super.init(size: size)
        let music = SKAudioNode(fileNamed: "surf.mp3")
        addChild(music)
        mapMusic = music // save reference for outside of this scope
        
        setBackground()
        setButtons()
        mapSetup()
    }
    
    func setBackground()
    {
        background = SKSpriteNode(texture: SKTexture(imageNamed: "dashboard"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        //background.setScale(1)
        addChild(background)
    }
    
    func setButtons()
    {
        //optionsButton = SKSpriteNode(texture: SKTexture(imageNamed: "gear"))
        //optionsButton.position = CGPoint(x: 5 * (UIScreen.main.bounds.width) / 6, y: //UIScreen.main.bounds.height / 10)
        //optionsButton.setScale(0.5)
        //optionsButton.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(0.25), duration: 1)))
        //addChild(optionsButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapSetup()
    {
        stateMap = SKSpriteNode(texture: SKTexture(imageNamed: "state_map"))
        let scaling = CGFloat.minimum(UIScreen.main.bounds.width/stateMap.size.width, CGFloat(UIScreen.main.bounds.height/stateMap.size.height))
        stateMap.zPosition = background.zPosition + 2
        stateMap.setScale(1.1 * scaling)
        stateMap.zRotation = CGFloat(-Double.pi / 18)//or 10
        stateMap.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height + stateMap.size.height)
        addChild(stateMap)
        
        dropDown = SKAction.moveBy(x: 0,y: -(UIScreen.main.bounds.height + stateMap.size.height/2), duration: 0.3)
        let delay = SKAction.wait(forDuration: 1)
        
        starSize = SKSpriteNode(texture: SKTexture(imageNamed: "star"))
        let starScale = CGFloat.maximum(stateMap.size.width/5/starSize.size.width, stateMap.size.height/5/starSize.size.height)
        let starGrow = SKAction.scale(to: starScale, duration: 0.3)
        
        star1 = levelStar()
        star1.name = "star1"
        star1.position = CGPoint(x: 90, y: -180)
        levels.append(star1)
        
        star2 = levelStar()
        star2.name = "star2"
        star2.position = CGPoint(x: -140, y: 80)
        levels.append(star2)
        
        star3 = levelStar()
        star3.name = "star3"
        star3.position = CGPoint(x:10, y: 0)
        levels.append(star3)
        
        for levelStar in levels
        {
            levelStar.setScale(0.01)
        }
        
        exitSign = SKSpriteNode(texture: SKTexture(imageNamed: "exit_sign"))
        let signScale = CGFloat.maximum(UIScreen.main.bounds.width/3/exitSign.size.width, UIScreen.main.bounds.width/3/exitSign.size.height)
        exitSign.name = "exit"
        exitSign.setScale(signScale)
        exitSign.zPosition = stateMap.zPosition - 1
        exitSign.position = CGPoint(x:exitSign.size.width/2 + 10, y: UIScreen.main.bounds.height / 2)
                                    //y:UIScreen.main.bounds.height - exitSign.size.height)
        signMove = SKAction.moveBy(x: 0, y: (UIScreen.main.bounds.height / 2.25) - exitSign.size.height, duration: 0.3)
        
        startSign = SKSpriteNode(texture: SKTexture(imageNamed: "play_sign"))
        startSign.setScale(signScale)
        startSign.name = "start"
        startSign.zPosition = stateMap.zPosition - 1
        startSign.position = CGPoint(x:UIScreen.main.bounds.width - (startSign.size.width/2 + 10), y: UIScreen.main.bounds.height / 2 - startSign.size.height / 8)//y:UIScreen.main.bounds.height - startSign.size.height)
        
        paper = SKSpriteNode(texture: SKTexture(imageNamed: "paper_narrow"))
        paper.setScale(1.25)
        paper.position = CGPoint(x:UIScreen.main.bounds.width/2, y:UIScreen.main.bounds.height/2.75 + (UIScreen.main.bounds.height + stateMap.size.height/2))
        paper.zPosition = 10;
        addChild(paper)
        
        text1 = SKSpriteNode(texture: SKTexture(imageNamed: "venue_overlay"))
        text1.zPosition = 11;
        
        text2 = SKSpriteNode(texture: SKTexture(imageNamed: "venue_overlay"))
        text2.zPosition = 11;
        
        text3 = SKSpriteNode(texture: SKTexture(imageNamed: "venue_overlay"))
        text3.zPosition = 11;
        
        xPaper = SKSpriteNode(texture: SKTexture(imageNamed: "Xbutton"))
        xPaper.setScale(0.1) //WIP
        xPaper.zPosition = 12;
        xPaper.name = "x"
        xPaper.position = CGPoint(x:paper.size.width/2 - xPaper.size.width * 1.75, y:paper.size.height/2 - xPaper.size.height * 2)
        
        stateMap.run(SKAction.sequence([delay, dropDown, delay, delay]), completion: {
            for levelStar in self.levels
            {
                self.stateMap.addChild(levelStar)
                levelStar.run(starGrow)
            }
            self.addChild(self.exitSign)
            self.exitSign.run(self.signMove)
        })
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            
            for n in node {
                if (n.name == "star1" && starActive){
                    addChild(startSign)
                    startSign.run(signMove)
                    starActive = false
                    paper.addChild(text1)
                    paper.addChild(xPaper)
                    paper.run(dropDown)
                }
                if (n.name == "star2" && starActive){
                    addChild(startSign)
                    startSign.run(signMove)
                    starActive = false
                    paper.addChild(text2)
                    paper.addChild(xPaper)
                    paper.run(dropDown)
                }
                if (n.name == "star3" && starActive){
                    addChild(startSign)
                    startSign.run(signMove)
                    starActive = false
                    paper.addChild(text3)
                    paper.addChild(xPaper)
                    paper.run(dropDown)
                }
                if (n.name == "x" && !starActive)
                { //WIP - closing the paper
                    startSign.run(signMove.reversed(), completion:
                        { self.startSign.removeFromParent() })
                    paper.run(dropDown.reversed(), completion:
                        { self.paper.removeAllChildren() })
                    
                    starActive = true
                }
                if n.name == "start" {
                    //print("YAY!")
                    let gameScreen:SKScene = GameScreen(size: self.frame.size)
                    let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                    self.view?.presentScene(gameScreen, transition: transition)
//                    scene?.view?.presentScene(GameScreen(size: self.frame.size))
                }
                if n.name == "exit" {
                    //print("YAY!")
                    let gameScreen:SKScene = StartScreen(size: self.frame.size)
                    let transition = SKTransition.doorsOpenHorizontal(withDuration: 0.5)
                    self.view?.presentScene(gameScreen, transition: transition)
                    //                    scene?.view?.presentScene(GameScreen(size: self.frame.size))
                }
            }
            //TODO: - Create a transition
            //if optionsButton.frame.contains(t.preciseLocation(in: inputView)){
            //    scene?.view?.presentScene(MapScreen(size: self.frame.size))
            //}
            
        }
    }
}
