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
    
    var name = "null"
    
    var bars:[Bar] = [Bar]()
    var numBars = 0;
    var totalNotes = 0;
    
    var beat = 0.0;
    var bpm = 0.0;
    var timeSigTop = 0.0;
    var timeSigBottom = 0.0;
    var startOffset = 0.0;
    
    var songFile:String?
    
    init(name:String, bpm:Double, timeSigTop:Double, timeSigBottom:Double, startOffset:Double, fileName:String, fileType:String) {
        
        songFile = Bundle.main.path(forResource: fileName, ofType: fileType)
        
        self.totalNotes = 0;
        self.name = name
        self.bpm = bpm;
        self.timeSigTop = timeSigTop;
        self.timeSigBottom = timeSigBottom;
        self.startOffset = startOffset;
        //self.bars = new Bar[numBars];
        self.beat = 60.0 / bpm;
    }
}
