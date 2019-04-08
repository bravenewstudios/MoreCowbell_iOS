//
//  Note.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation

class Note {
    
    // which type of note equals a beat is defined by the time signature
    // EXAMPLE:
    // >in 4/4 time the quarter note is one beat
    // >timeSigBottom (4.0f) * QUARTER (0.25f) * beat (60.0f/bpm) = duration of note
    
    static let WHOLE = 1.0;
    static let HALF = 0.5;
    static let QUARTER = 0.25;
    static let EIGHTH = 0.125;
    static let SIXTEENTH = 0.0625;
    static let THIRTYSECOND = 0.03125;
    
    var isRest = false;
    var time = 0.0;
    
    init() {
    }
    
    init (time:Double) {
    self.time = time;
    self.isRest = false;
    }
    
    init(time:Double, isRest:Bool) {
    self.time = time;
    self.isRest = isRest;
    }
}
