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
    var test = true
    
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setBackground()
        setButtons()
        dropMap()
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
    
    func dropMap()
    {
        stateMap = SKSpriteNode(texture: SKTexture(imageNamed: "state_map"))
        let scaling = CGFloat.maximum(stateMap.size.width/UIScreen.main.bounds.width, CGFloat(stateMap.size.height/UIScreen.main.bounds.height))
       stateMap.setScale(1 / scaling)
        stateMap.zRotation = CGFloat(M_PI / 10)
        stateMap.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height + stateMap.size.height)
        addChild(stateMap)
        star = SKSpriteNode(texture: SKTexture(imageNamed: "star"))
        let starScale = CGFloat.maximum(stateMap.size.width/10/star.size.width, stateMap.size.height/10/star.size.height)
        star.setScale(starScale)
        star.position = CGPoint(x: -20, y: -100)
        stateMap.addChild(star)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            if(test)
            {
                let dropDown = SKAction.moveBy(x: 0,y: -(UIScreen.main.bounds.height + stateMap.size.height/2), duration: 1)
                stateMap.run(dropDown)
                test = false
            }
            //TODO: - Create a transition
            //if optionsButton.frame.contains(t.preciseLocation(in: inputView)){
            //    scene?.view?.presentScene(MapScreen(size: self.frame.size))
            //}
            
        }
    }
}
