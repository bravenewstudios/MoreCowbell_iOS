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
    
    let resultsFont = UIFont(name: "OLORT___", size: UIFont.labelFontSize)
    var accuracy:UILabel!
    var score:UILabel!
    var combo:UILabel!
    var grade:SKSpriteNode!
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setupResults()
        SetupBackground()
        GetResultData()
        
    }
    
    override func OnScenePresent() {
        
    }
    
    func setupResults() {
        NotePaper = SKSpriteNode(texture: SKTexture(imageNamed: "paper_narrow"))
    //NotePaper.size(screenHeight,screenWidth,0.8f,mainStage,"results_overlay.png");
        NotePaper.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height)
    
        accuracy = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        score = UILabel(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
        combo = UILabel(frame: CGRect(x: 0, y: 400, width: 100, height: 100))
//        accuracy.frame(to: CGPoint(x:UIScreen.main.bounds.width * 0.655, y:UIScreen.main.bounds.height * 0.659))
        accuracy.font = resultsFont
//    combo.closestPosition(to: CGPoint(x:UIScreen.main.bounds.width * 0.49, y:UIScreen.main.bounds.height * 0.59))
    combo.font = resultsFont
        //combo.setFontScale(2);
//    score.closestPosition(to: CGPoint(x:UIScreen.main.bounds.width * 0.7, y:UIScreen.main.bounds.height * 0.52))
    score.font = resultsFont
//        score.setFontScale(2);
        //grade.setFontScale(5);
        grade = SKSpriteNode(texture: SKTexture(imageNamed: "F.png"))
        grade.position = CGPoint(x: -NotePaper.size.width / 4, y: -NotePaper.size.height / 4)
        self.view?.addSubview(accuracy)
        self.view?.addSubview(score)
        self.view?.addSubview(combo)
        NotePaper.addChild(grade)
    }
    
    func GetResultData() {
        let pct = gameInstance.notesHit * 100 / gameInstance.songNotes
        let accPct = String(pct)
//    accuracy.setText(Integer.toString(pct));
        var letter:SKTexture!
        var music:SKAudioNode!
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
        music.run(SKAction.changeVolume(to: gameInstance.musicVolume, duration: 0.0))
        addChild(music)
        grade.texture = letter
        accuracy.text = accPct
        score.text = String(gameInstance.scoreInfo.currScore)
        combo.text = String(gameInstance.scoreInfo.maxCombo)
    }
    
    func SetupBackground() {
    background = SKSpriteNode(texture: SKTexture(imageNamed: "stage_dark.png"))
    addChild(background)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
