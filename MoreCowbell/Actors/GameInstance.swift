//
//  GameInstance.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation

class GameInstance {
    var currentSong = 0
    
    var highscoreTable = [0,0,0]
    var musicVolume:Float = 1.0
    var sfxVolume:Float = 1.0
    
    init(){
        
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
