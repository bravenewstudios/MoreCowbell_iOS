//
//  Song.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit

public class Song {
    
    var bars:[Bar] = [Bar]()
    var numBars = 0;
    var totalNotes = 0;
    
    var beat = 0.0;
    var bpm = 0.0;
    var timeSigTop = 0.0;
    var timeSigBottom = 0.0;
    var startOffset = 0.0;
    
    var musicTrack:SKAudioNode!
    
    init(numBars:Int, bpm:Double, timeSigTop:Double, timeSigBottom:Double, startOffset:Double, filePath:String) {
        let music = SKAudioNode(fileNamed: filePath)
        musicTrack = music
        
        self.totalNotes = 0;
        self.numBars = numBars;
        self.bpm = bpm;
        self.timeSigTop = timeSigTop;
        self.timeSigBottom = timeSigBottom;
        self.startOffset = startOffset;
        //self.bars = new Bar[numBars];
        self.beat = 60.0 / bpm;
    }
}
