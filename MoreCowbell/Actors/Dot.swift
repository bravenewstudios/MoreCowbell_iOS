//
//  Dot.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit

class Dot:SKSpriteNode {
    
    MoveToAction movein;
    MoveToAction moveout;
    AlphaAction fadeout;
    AlphaAction fadein;
    ParallelAction enter;
    ParallelAction exit;
    SequenceAction sequence;
    
    var startPoint:CGPoint!;
    var hit = false;
    
    init(ActorBeta bar, float screenHeight){
        loadTexture("dot.png");
        setSize(bar.getWidth()*0.1f,bar.getWidth()*0.1f);
        startX = bar.getX()+bar.getWidth();
        startY = screenHeight*0.5f-getHeight()*0.5f;
        setPosition(startX,startY);
        getColor().a = 0.0f;
        fadein = Actions.fadeIn(0.2f);
        fadeout = Actions.fadeOut(0.2f);
        movein = Actions.moveTo(bar.getX()+bar.getWidth()*0.07f,getY(),Conductor.DOTMOVETIME);
        moveout = Actions.moveTo(bar.getX()-getWidth(),getY(),Conductor.DOTMOVETIME*0.2f);
        enter = Actions.parallel(fadein, movein);
        exit = Actions.parallel(fadeout, moveout);
        sequence = Actions.sequence(enter,exit);
    }
    
    void FireAction() {
        hit = false;
        setPosition(startX,startY);
        enter = Actions.parallel(fadein, movein);
        exit = Actions.parallel(fadeout, moveout);
        sequence = Actions.sequence(enter,exit);
        addAction(sequence);
    }
}
