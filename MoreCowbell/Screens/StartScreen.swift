//
//  StartScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import AVFoundation
import SpriteKit
import GameplayKit

class StartScreen: BaseScene {
    
    var sliderActiveLength:CGFloat = 0.0
    var sliderActiveLength2:CGFloat = 0.0
    
    lazy var optionsButton:SpriteButton = {
        var button = SpriteButton(imageName: "gear", buttonAction: {
            //self.view?.presentScene(GameScene(size: self.frame.size))
            self.onButtonClick()
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
    var volumeBar:SKSpriteNode!
    var soundBar:SKSpriteNode!
    var volumeSlider:SKSpriteNode!
    var soundSlider:SKSpriteNode!
    var MMLabel:SKLabelNode!
    
    var paper:SKSpriteNode!
    var text:SKSpriteNode!
    var optionsDropDown:SKAction!
    var optionsSlideUp:SKAction!
    var isOptionsOpen = false
    var xPaper:SKSpriteNode!
    
    var musicPlayer = AVAudioPlayer()
    
//    private var spinnyNode : SKShapeNode?
//    private var label : SKLabelNode?
    
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize) {
        super.init(size: size)
      
        setBackground()
        setTitle()
        setOptionsMenu()
        setButtons()
        
        do {
            let songFile = Bundle.main.path(forResource: "title", ofType: "mp3")
            musicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: songFile!))
        }
        catch {
            print("failed to load startScreen musicPlayer")
        }
        //        sliderBar = SKSpriteNode(texture: SKTexture(imageNamed: "slider_bar"))
//        sliderBar.position = CGPoint(x: 2 * (UIScreen.main.bounds.width) / 3, y: UIScreen.main.bounds.height / 2)
//        addChild(sliderBar)
//
//        slider = SKSpriteNode(texture: SKTexture(imageNamed: "slider"))
//        slider.position = CGPoint(x: 2 * (UIScreen.main.bounds.width) / 3, y: UIScreen.main.bounds.height / 2)
//        addChild(slider)
    }
    
    override func OnScenePresent() {
        musicPlayer.volume = gameInstance.musicVolume
        musicPlayer.currentTime = 0.0
        musicPlayer.play()
    }
    
    override func OnSceneExit() {
        musicPlayer.stop()
    }
    
    // not sure of syntax for buttonAction, using this for now
    func onButtonClick()
    {
        if (isOptionsOpen)
        {
            paper.run(optionsSlideUp)
            isOptionsOpen = false
            
        }
        else
        {
            paper.run(optionsDropDown)
            isOptionsOpen = true
        }
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
        titleCowbell = SKSpriteNode(texture: SKTexture(imageNamed: "title_cowbell"))
        titleCowbell.setScale(0.3)
        titleCowbell.position = CGPoint(x: UIScreen.main.bounds.width / 2 - titleCowbell.size.width / 2.8, y: 3 * UIScreen.main.bounds.height / 4 - titleCowbell.size.height / 2)
        titleCowbell.anchorPoint = CGPoint(x: 0.2,y: 0.0)
        addChild(titleCowbell)
        
        titleMore = SKSpriteNode(texture: SKTexture(imageNamed: "title_more"))
        titleMore.setScale(0.3)
//        titleMore.zPosition = 5
        titleMore.position = CGPoint(x: titleCowbell.position.x + titleCowbell.size.width * 0.48 + titleMore.size.width * 0.33, y: titleCowbell.position.y + titleMore.size.height * 0.8)
        titleMore.anchorPoint = CGPoint(x: 1.0,y: 0.0)
        addChild(titleMore)
        
        let rotateMoreText = SKAction.rotate(byAngle: CGFloat(Double.pi / 9), duration: 0)
        let reverseMoreText = SKAction.rotate(byAngle: CGFloat(-Double.pi / 9), duration: 0)
        let rotateCowText = SKAction.rotate(byAngle: CGFloat(Double.pi / 36), duration: 0)
        let reverseCowText = SKAction.rotate(byAngle: CGFloat(-Double.pi / 36), duration: 0)
        let rotHead = SKAction.rotate(byAngle: CGFloat(-Double.pi / 9), duration: 0)
        let rotRevHead = SKAction.rotate(byAngle: CGFloat(Double.pi / 9), duration: 0)
        let delay = SKAction.wait(forDuration: 0.98)
        
        walkenHead = SKSpriteNode(texture: SKTexture(imageNamed: "Walken_head"))
        walkenHead.setScale(0.3)
        walkenHead.zRotation = CGFloat(Double.pi / 18)
        walkenHead.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        addChild(walkenHead)
        
        titleMore.run(SKAction.repeatForever(SKAction.sequence([reverseMoreText,delay,rotateMoreText,delay])))
        titleCowbell.run(SKAction.repeatForever(SKAction.sequence([delay,reverseCowText,delay,rotateCowText])))
        walkenHead.run(SKAction.repeatForever(SKAction.sequence([delay,rotHead,delay,rotRevHead])))
    }
    
    func setOptionsMenu()
    {
        paper = SKSpriteNode(texture: SKTexture(imageNamed: "paper_narrow"))
        paper.setScale(1.25)
        paper.position = CGPoint(x:UIScreen.main.bounds.width/2, y:UIScreen.main.bounds.height + paper.size.height * 0.5)
        paper.zPosition = 10;
        
        xPaper = SKSpriteNode(texture: SKTexture(imageNamed: "Xbutton"))
        xPaper.setScale(0.1) //WIP
        xPaper.zPosition = 12
        xPaper.name = "x"
        xPaper.position = CGPoint(x:paper.size.width/2 - xPaper.size.width * 1.75, y:paper.size.height/2 - xPaper.size.height * 2)
        
        addChild(paper)
        paper.addChild(xPaper)
        
        text = SKSpriteNode(texture: SKTexture(imageNamed: "OptionsOverlay"))
        text.zPosition = 11
        paper.addChild(text)
        
        volumeBar = SKSpriteNode(texture: SKTexture(imageNamed: "slider_bar"))
        //volumeBar.setScale(0.9)
        volumeBar.position = CGPoint(x:(UIScreen.main.bounds.width/1.9), y:paper.size.height/4)
        volumeBar.anchorPoint = CGPoint(x:0.5, y:0.5)
        volumeBar.zPosition = 12;
        addChild(volumeBar)
        
        volumeSlider = SKSpriteNode(texture: SKTexture(imageNamed: "slider"))
        //volumeSlider.setScale(0.9)
        sliderActiveLength = volumeBar.size.width - 2*volumeSlider.size.width
        volumeSlider.position = CGPoint(x: volumeBar.position.x + (sliderActiveLength / 4), y:0)
        volumeSlider.zPosition = 13
        //volumeSlider.anchorPoint = CGPoint(x:0.5, y:0.5)
        addChild(volumeSlider)
        
        soundBar = SKSpriteNode(texture: SKTexture(imageNamed: "slider_bar"))
        //soundBar.setScale(0.9)
        soundBar.position = CGPoint(x:(UIScreen.main.bounds.width/1.9), y:paper.size.height/4)
        soundBar.anchorPoint = CGPoint(x:0.5, y:0.5)
        soundBar.zPosition = 12;
        addChild(soundBar)
        
        soundSlider = SKSpriteNode(texture: SKTexture(imageNamed: "slider"))
        //volumeSlider.setScale(0.9)
        sliderActiveLength2 = soundBar.size.width - 2*soundSlider.size.width
        soundSlider.position = CGPoint(x: soundBar.position.x + (sliderActiveLength2 / 4), y:0)
        soundSlider.zPosition = 13
        //soundSlider.anchorPoint = CGPoint(x:0.5, y:0.5)
        addChild(soundSlider)
        
        optionsDropDown = SKAction.moveTo(y: UIScreen.main.bounds.height * 0.5, duration: 0.3)
        optionsSlideUp = SKAction.moveTo(y: UIScreen.main.bounds.height + paper.size.height * 0.5, duration: 0.3)
    }
    
    func setButtons()
    {
        //optionsButton = SKSpriteNode(texture: SKTexture(imageNamed: "gear"))
        optionsButton.position = CGPoint(x: 5 * (UIScreen.main.bounds.width) / 6, y: UIScreen.main.bounds.height / 10)
        optionsButton.setScale(0.5)
        optionsButton.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(0.25), duration: 1)))
        addChild(optionsButton)
    }
    
    override func update(_ currentTime: TimeInterval) {
        //super.update(<#T##currentTime: TimeInterval##TimeInterval#>)
        volumeSlider.position.y = paper.position.y
        volumeBar.position.y = paper.position.y
        
        soundSlider.position.y = paper.position.y - (paper.size.height/3)
        soundBar.position.y = paper.position.y - (paper.size.height/3)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            let location = t.location(in: self)
            let location2 = t.location(in: self)
            
            for n in node {
                
                if (!isOptionsOpen)
                {
                    //print("YAY!")
                    scene?.view?.presentScene(gameInstance.mapScreen, transition: .fade(withDuration: 0))
                }
                else
                {
                    if volumeBar.frame.contains(t.preciseLocation(in: inputView))
                    {
                        volumeSlider.position.x = location.x
                    }
                    if soundBar.frame.contains(t.preciseLocation(in: inputView))
                    {
                        soundSlider.position.x = location2.x
                    }
                }
                if n.name == "x"
                { //WIP - closing the paper
                    paper.run(optionsSlideUp, completion: {self.isOptionsOpen = false})
                    //isOptionsOpen = false
                }
            }
            //TODO: - Create a transition
            //            if walkenHead.frame.contains(t.preciseLocation(in: inputView)){
            //                scene?.view?.presentScene(MapScreen(size: self.frame.size))
            //
            //            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches {
            let location = t.location(in: self)
            let location2 = t.location(in: self)
            
            volumeSlider.position.x = location.x //- volumeBar.size.width
            if (volumeSlider.position.x > volumeBar.position.x + sliderActiveLength*0.5)
            {
                volumeSlider.position.x = volumeBar.position.x + sliderActiveLength*0.5
            }
            else if (volumeSlider.position.x < volumeBar.position.x - sliderActiveLength*0.5)
            {
                volumeSlider.position.x = volumeBar.position.x - sliderActiveLength*0.5
            }
            
            soundSlider.position.x = location2.x //- soundBar.size.width
            if (soundSlider.position.x > soundBar.position.x + sliderActiveLength2*0.5)
            {
                soundSlider.position.x = soundBar.position.x + sliderActiveLength2*0.5
            }
            else if (soundSlider.position.x < soundBar.position.x - sliderActiveLength2*0.5)
            {
                soundSlider.position.x = soundBar.position.x - sliderActiveLength2*0.5
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
