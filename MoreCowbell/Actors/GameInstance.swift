//
//  GameInstance.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation

struct GameInstance {
    static var currentSong = 0
    
    static var highscoreTable = [0,0,0]
    static var musicVolume:Float = 1.0
    static var sfxVolume:Float = 1.0
    static func updateHighscore(_ score:Int, level:Int){
       if(highscoreTable[level] < score){
                highscoreTable[level] = score
            }
        }
    
    static func sfxVolumeChange(_ vol:Float){
        sfxVolume = vol
    }
    
    static func musicVolumeChange(_ vol:Float){
        musicVolume = vol
    }
}
