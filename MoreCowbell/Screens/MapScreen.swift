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

class MapScreen: SKScene {
    
    //TODO: - Use this to create a menu scene
    var exitButton:SKSpriteNode!
    var playButton:SKSpriteNode!
    var background:SKSpriteNode!
    var MMLabel:SKLabelNode!
    var stateMap:SKSpriteNode!
    var star:SKSpriteNode!
    var exitSign:SKSpriteNode!
    var startSign:SKSpriteNode!
    var test = true
    
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize)
    {
        super.init(size: size)
        
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
        
        star = SKSpriteNode(texture: SKTexture(imageNamed: "star"))
        let starScale = CGFloat.maximum(stateMap.size.width/5/star.size.width, stateMap.size.height/5/star.size.height)
        star.setScale(starScale)
        star.position = CGPoint(x: 25, y: -200)
//        stateMap.addChild(star)
        
        exitSign = SKSpriteNode(texture: SKTexture(imageNamed: "exit_sign"))
        let signScale = CGFloat.maximum(UIScreen.main.bounds.width/3/exitSign.size.width, UIScreen.main.bounds.width/3/exitSign.size.height)
        exitSign.setScale(signScale)
        exitSign.zPosition = stateMap.zPosition - 1
        exitSign.position = CGPoint(x:exitSign.size.width/2 + 10, y:UIScreen.main.bounds.height - exitSign.size.height)
        addChild(exitSign)
        
        startSign = SKSpriteNode(texture: SKTexture(imageNamed: "play_sign"))
        startSign.setScale(signScale)
        startSign.zPosition = stateMap.zPosition - 1
        startSign.position = CGPoint(x:UIScreen.main.bounds.width - (startSign.size.width/2 + 10), y:UIScreen.main.bounds.height - startSign.size.height)
        addChild(startSign)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            if(test)
            {
                let dropDown = SKAction.moveBy(x: 0,y: -(UIScreen.main.bounds.height + stateMap.size.height/2), duration: 1)
                stateMap.run(dropDown)
                stateMap.addChild(star)
                test = false
            }
            //TODO: - Create a transition
            //if optionsButton.frame.contains(t.preciseLocation(in: inputView)){
            //    scene?.view?.presentScene(MapScreen(size: self.frame.size))
            //}
            
        }
    }
}
