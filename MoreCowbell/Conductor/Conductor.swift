//
//  Conductor.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-25.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

// import Foundation
import SpriteKit
import GameplayKit

class Conductor {
    private var song : Song?
    
    let static DOTMOVETIME = 1.5
    
    private var nextBeatTime = 0.0
    
    private var noteIndex = 0
    private var barIndex = 0
    private var numBars = 0
    private var numNotes = 0
    private var dotIndex = 0
    
    private var isRest = false
    private var finished = false
    
    var dots : [Dots] = []
    
    Conductor() {
    dotIndex = 0;
    barIndex = 0;
    noteIndex = 0;
    }
    
    func Start() {
    finished = false;
    numBars = song.numBars;
    numNotes = song.bars[barIndex].numNotes;
    nextBeatTime = song.startOffset - DOTMOVETIME;
    isRest = song.bars[barIndex].notes[noteIndex].isRest;
    song.track.play();
    }
    
    func Stop() {
    dotIndex = 0;
    barIndex = 0;
    noteIndex = 0;
    finished = false;
    song.track.stop();
    }
    
    void SpawnDot() {
    dots[dotIndex].FireAction();
    dotIndex++;
    if (dotIndex >= dots.length)
    {
    dotIndex = 0;
    }
    }
    
    void AdvanceBeat() {
    noteIndex++;
    if (noteIndex >= numNotes)
    {
    barIndex++;
    if (barIndex >= numBars)
    {
    finished = true;
    return;
    }
    else
    {
    numNotes = song.bars[barIndex].numNotes;
    noteIndex = 0;
    }
    }
    nextBeatTime += song.bars[barIndex].notes[noteIndex].time;
    isRest = song.bars[barIndex].notes[noteIndex].isRest;
    }
    
    boolean Update() {
    if (song.track.isPlaying() && !finished)
    {
    if (song.track.getPosition() >= nextBeatTime)
    {
    if (!isRest) {
    //Gdx.app.error("Beat", "Index: " + Integer.toString(noteIndex) + "Time: " + Float.toString(nextBeatTime));
    SpawnDot();
    }
    else {
    //Gdx.app.error("Rest", "Index: " + Integer.toString(noteIndex) + "Time: " + Float.toString(nextBeatTime));
    }
    //Gdx.app.error("SongPosition", Float.toString(song.track.getPosition()));
    AdvanceBeat();
    }
    }
    return finished;
    }
}
