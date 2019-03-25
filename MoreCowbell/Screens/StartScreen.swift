//
//  StartScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class StartScreen: SKScene {
    
    lazy var optionsButton:SpriteButton = {
        var button = SpriteButton(imageName: "gear", buttonAction: {
            //self.view?.presentScene(GameScene(size: self.frame.size))
        })
        button.zPosition = 4
        return button
    }()
    
    //TODO: - Use this to create a menu scene
    //var optionsButton:SKSpriteNode!
    var background:SKSpriteNode!
    var titleMore:SKSpriteNode!
    var titleCowbell:SKSpriteNode!
    var walkenHead:SKSpriteNode!
    var sliderBar:SKSpriteNode!
    var slider:SKSpriteNode!
    var MMLabel:SKLabelNode!
    var objPlayer2:SKAudioNode! //= nil
//    private var spinnyNode : SKShapeNode?
//    private var label : SKLabelNode?
    
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize) {
        super.init(size: size)
        
        objPlayer2 = SKAudioNode(fileNamed: "surf.mp3")
        //print(objPlayer2?.avAudioNode!)
        addChild(objPlayer2)
        objPlayer2.run(SKAction.play())
        
        setBackground()
        setTitle()
        setButtons()

//        sliderBar = SKSpriteNode(texture: SKTexture(imageNamed: "slider_bar"))
//        sliderBar.position = CGPoint(x: 2 * (UIScreen.main.bounds.width) / 3, y: UIScreen.main.bounds.height / 2)
//        addChild(sliderBar)
//
//        slider = SKSpriteNode(texture: SKTexture(imageNamed: "slider"))
//        slider.position = CGPoint(x: 2 * (UIScreen.main.bounds.width) / 3, y: UIScreen.main.bounds.height / 2)
//        addChild(slider)
    }
    
    func setBackground()
    {
        background = SKSpriteNode(texture: SKTexture(imageNamed: "sunburst"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        background.name = "_background"
        background.setScale(1)
        background.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(-0.3), duration: 1)))
        addChild(background)
        
    }
    
    func setTitle()
    {
        titleMore = SKSpriteNode(texture: SKTexture(imageNamed: "title_more"))
        titleMore.setScale(0.3)
        titleMore.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: 5 * UIScreen.main.bounds.height / 6.1)
        addChild(titleMore)
        
        titleCowbell = SKSpriteNode(texture: SKTexture(imageNamed: "title_cowbell"))
        titleCowbell.setScale(0.3)
        titleCowbell.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: 3 * UIScreen.main.bounds.height / 4)
        addChild(titleCowbell)
        
        walkenHead = SKSpriteNode(texture: SKTexture(imageNamed: "Walken_head"))
        walkenHead.setScale(0.3)
        walkenHead.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        addChild(walkenHead)
    }
    
    func setButtons()
    {
        //optionsButton = SKSpriteNode(texture: SKTexture(imageNamed: "gear"))
        optionsButton.position = CGPoint(x: 5 * (UIScreen.main.bounds.width) / 6, y: UIScreen.main.bounds.height / 10)
        optionsButton.setScale(0.5)
        optionsButton.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(0.25), duration: 1)))
        addChild(optionsButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            
            for n in node {
                if n.name == "_background" {
                    //print("YAY!")
                    scene?.view?.presentScene(MapScreen(size: self.frame.size))
                }
            }
            //TODO: - Create a transition
            if walkenHead.frame.contains(t.preciseLocation(in: inputView)){
                scene?.view?.presentScene(MapScreen(size: self.frame.size))
                
            }
            
        }
    }
}
