//
//  GameInstance.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit

class GameInstance {
    var currentSong = 0
    
    var highscoreTable = [0,0,0]
    var musicVolume:Float = 1.0
    var sfxVolume:Float = 1.0
    
    var viewSize:CGSize!
    
    var startScreen:StartScreen!
    var mapScreen:MapScreen!
    var gameScreen:GameScreen!
    var resultScreen:ResultScreen!
    
    init(viewSize:CGSize){
        self.viewSize = viewSize
    }
    
    func LoadScenes() {
        startScreen = StartScreen(size: viewSize)
        mapScreen = MapScreen(size: viewSize)
        gameScreen = GameScreen(size: viewSize)
        resultScreen = ResultScreen(size: viewSize)
        
        startScreen.SetGameInstance(inst: self)
        mapScreen.SetGameInstance(inst: self)
        gameScreen.SetGameInstance(inst: self)
        resultScreen.SetGameInstance(inst: self)
    }
    
    func updateHighscore(_ score:Int, level:Int){
       if(highscoreTable[level] < score){
                highscoreTable[level] = score
            }
        }
    
    func sfxVolumeChange(_ vol:Float){
        sfxVolume = vol
    }
    
    func musicVolumeChange(_ vol:Float){
        musicVolume = vol
    }
}
