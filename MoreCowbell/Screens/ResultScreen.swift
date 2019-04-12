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
    var grade:UILabel!
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setupResults()
        setupCowbell()
        setupBar()
        setupButtons()
        setupScore()
    }
    
    func SetupResults() {
    NotePaper = SKSpriteNode(texture: SKTexture(imageNamed: "paper_narrow"))
    NotePaper.size(screenHeight,screenWidth,0.8f,mainStage,"results_overlay.png");
    result.SetStartPosition(screenWidth * 0.5f - result.getWidth()*0.5f, screenHeight);
    
    resultsFont = new BitmapFont(Gdx.files.internal("fonts/jitters.fnt"), Gdx.files.internal("fonts/jitters.png"), false);
    percentage = new Label("00", new Label.LabelStyle(resultsFont, Color.BLACK));
    score = new Label("00", new Label.LabelStyle(resultsFont, Color.BLACK));
    combo = new Label("00", new Label.LabelStyle(resultsFont, Color.BLACK));
    grade = new Label("B", new Label.LabelStyle(resultsFont, Color.RED));
    percentage.setPosition(screenWidth*0.655f,screenHeight * 0.659f);
    percentage.setFontScale(2);
    combo.setPosition(screenWidth*0.49f,screenHeight * 0.59f);
    combo.setFontScale(2);
    score.setPosition(screenWidth*0.7f,screenHeight * 0.52f);
    score.setFontScale(2);
    grade.setPosition(screenWidth*0.61f,screenHeight * 0.38f);
    grade.setFontScale(5);
    mainStage.addActor(percentage);
    mainStage.addActor(score);
    mainStage.addActor(combo);
    mainStage.addActor(grade);
    }
    
    void GetResultData() {
    int pct = game.result.notesHit * 100 / game.result.totalNotes;
    percentage.setText(Integer.toString(pct));
    String letter;
    if (pct >= 80)
    {
    letter = "A";
    if (pct >= 90)
    game.diapers.play();
    else
    game.dynamiteSound.play();
    }
    else if (pct >= 70)
    {
    letter = "B";
    game.couldUseMore.play();
    }
    else if (pct >= 60)
    {
    letter = "C";
    game.couldUseMore.play();
    }
    else if (pct >= 50)
    {
    letter = "D";
    game.couldUseMore.play();
    }
    else
    {
    letter = "F";
    game.couldUseMore.play();
    }
    if (!game.result.win)
    {
    letter = "F";
    game.comeOnGene.play();
    }
    grade.setText(letter);
    score.setText(Integer.toString(game.result.score));
    combo.setText(Integer.toString(game.result.maxCombo));
    }
    
    void SetupBackground() {
    background = new ActorBeta();
    background.loadTexture("stage_dark.png");
    background.setSize(screenWidth,screenHeight);
    mainStage.addActor(background);
    }
    
    @Override
    public void initialize() {
    ActorBeta.setWorldBounds(Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
    
    SetupBackground();
    SetupResults();
    }
    
    @Override
    public void show() {
    super.show();
    if (game.result != null)
    GetResultData();
    result.SlideToPosition(screenWidth*0.5f-result.getWidth()*0.5f, screenHeight * 0.2f);
    }
}
