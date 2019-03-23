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
    
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setBackground()
        setButtons()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            //TODO: - Create a transition
            //if optionsButton.frame.contains(t.preciseLocation(in: inputView)){
            //    scene?.view?.presentScene(MapScreen(size: self.frame.size))
            //}
            
        }
    }
}
