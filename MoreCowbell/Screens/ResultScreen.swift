//
//  ResultScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

// import Foundation
import SpriteKit
import GameplayKit

class ResultScreen: BaseScene {
    
    var background:SKSpriteNode!
    var NotePaper:SKSpriteNode!
    
//    guard let resultsFont = UIFont(name: "OLORT___.ttf", size: 50); else {
//    fatalError("Nope.")
//    }
    var accuracy:UILabel!; var score:UILabel!; var combo:UILabel!
    var labelArray: [UILabel] = [UILabel]()
    var grade = SKSpriteNode(texture: SKTexture(imageNamed: "RankF.png"))
    var exitButton:SKSpriteNode!
    
    override init(size: CGSize)
    {
        super.init(size: size)
        setupBackground()
        exit()
        setupResults()
    }
    
    override func OnScenePresent() {
        GetResultData()
    }
    
    func exit() {
        exitButton = SKSpriteNode(texture: SKTexture(imageNamed: "exit"))
        exitButton.position = CGPoint(x: 9 * (UIScreen.main.bounds.width) / 10, y: UIScreen.main.bounds.height / 13)
        exitButton.setScale(0.2)
        exitButton.name = "_exit"
        addChild(exitButton)
    }
    
    func setupResults() {
        NotePaper = SKSpriteNode(texture: SKTexture(imageNamed: "paper_narrow"))
        NotePaper.size = CGSize(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.6)
    //NotePaper.size(screenHeight,screenWidth,0.8f,mainStage,"results_overlay.png");
        NotePaper.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height/2)
        addChild(NotePaper)
    
        accuracy = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 2, y:UIScreen.main.bounds.height * 0.5, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 10)); labelArray.append(accuracy)
        score = UILabel(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)); labelArray.append(score)
//        score = UILabel(frame: CGRect(x: UIScreen.main.bounds.width * 0.49, y:UIScreen.main.bounds.height * 0.59, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 10)); labelArray.append(score)
        combo = UILabel(frame: CGRect(x: UIScreen.main.bounds.width * 0.7, y:UIScreen.main.bounds.height * 0.52, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 10)); labelArray.append(combo)
        
        grade.position = CGPoint(x: NotePaper.size.width / 4, y: -NotePaper.size.height / 4)
//        self.view?.addSubview(accuracy)
//        self.view?.addSubview(score)
//        self.view?.addSubview(combo)
        NotePaper.addChild(grade)
        
        for t in labelArray{
            t.font = UIFont(name: "AmericanTypewriter", size: 25)
            t.textColor = UIColor.white
            t.textAlignment = .center
            t.text = "TESTESETESETESTEST"
            self.view?.addSubview(t)
            self.view?.bringSubview(toFront: t)
        }
    }
    
    func GetResultData() {
        if(gameInstance.songNotes != 0)
        {
        let pct = gameInstance.notesHit * 100 / gameInstance.songNotes
        let accPct = String(pct)
//    accuracy.setText(Integer.toString(pct));
        var letter:SKTexture!
        var music = SKAudioNode(fileNamed: "cowbell.wav")
        if (pct >= 90) {
            music = SKAudioNode(fileNamed: "diapers.wav")
            letter = SKTexture(imageNamed: "RankAPlus.png")
        }
        else if (pct >= 80) {
            letter = SKTexture(imageNamed: "RankA.png")
            music = SKAudioNode(fileNamed: "dynamiteSound.wav")
        }
        else if (pct >= 70)
        {
            letter = SKTexture(imageNamed: "RankB.png")
            music = SKAudioNode(fileNamed: "couldusemore.wav")
        }
        else if (pct >= 60)
        {
            letter = SKTexture(imageNamed: "RankC.png")
            music = SKAudioNode(fileNamed: "couldusemore.wav")
        }
        else if (pct >= 50)
        {
            letter = SKTexture(imageNamed: "RankD.png")
            music = SKAudioNode(fileNamed: "couldusemore.wav")
        }
        else
        {
            letter = SKTexture(imageNamed: "RankF.png")
            music = SKAudioNode(fileNamed: "couldusemore.wav")
        }
        if (pct == 0)
        {
            letter = SKTexture(imageNamed: "RankF.png")
            music = SKAudioNode(fileNamed: "comeongene.wav")
        }
        music.autoplayLooped = false
        music.run(SKAction.changeVolume(to: gameInstance.musicVolume, duration: 0.0))
        addChild(music)
        music.run(SKAction.play())
        grade.texture = letter
        accuracy.text = accPct
//        score.text = String(gameInstance.scoreInfo.currScore)
//        combo.text = String(gameInstance.scoreInfo.maxCombo)
        }
    }
    
    func setupBackground()
    {
        background = SKSpriteNode(texture: SKTexture(imageNamed: "stage_dark"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            
            for n in node {
                
                //MARK: - If notification button is pressed
                if n.name == "_exit" {
                    //print("YAY!")
                    scene?.view?.presentScene(gameInstance.startScreen)
                    //                    let mapScene:SKScene = MapScreen(size: self.frame.size)
                    //                    let transition = SKTransition.push(with: .down, duration: 1)
                    //                    self.view?.presentScene(mapScene, transition: transition)
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
