//
//  fightView.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/20.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
import GCHelper

var skills1String = "剪刀"
var skills1StringData :NSData = skills1String.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData

var skills2String = "石頭"
var skills2StringData :NSData = skills2String.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData

var skills3String = "布"
var skills3StringData :NSData = skills3String.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData

var playIDAWinBool = false


class fightView: UIViewController {
    @IBOutlet weak var selfHPConstraint: NSLayoutConstraint!
    @IBOutlet weak var otherHPContraint: NSLayoutConstraint!
    @IBOutlet weak var selfATKConstraint: NSLayoutConstraint!
    @IBOutlet weak var selfLuckContraint: NSLayoutConstraint!
    @IBOutlet weak var otherATKContraint: NSLayoutConstraint!
    @IBOutlet weak var otherLuckConstraint: NSLayoutConstraint!

    
    @IBOutlet weak var LineHP: UIImageView!
    @IBOutlet weak var selfATK: UIImageView!
    
    @IBOutlet weak var skills1Btn: UIButton!
    
    @IBOutlet weak var skills2Btn: UIButton!
    
    @IBOutlet weak var skills3Btn: UIButton!
    
    
    @IBOutlet weak var selfSkillsLabel: UIImageView!
    @IBOutlet weak var otherSkillsLabel: UIImageView!

    
    
    
    @IBOutlet weak var fightSelfNameLabel: UILabel!
    @IBOutlet weak var fightOtherNameLabel: UILabel!
    
    
    @IBOutlet weak var selfAttackConstraint: NSLayoutConstraint!
    @IBOutlet weak var otherAttackConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var selfbl: UIImageView!
    @IBOutlet weak var otherbl: UIImageView!
    
    
    
    
    var fightViewLayoutDid = false
    var hPLine = CGFloat()
    var Line23 = CGFloat()
    
    var skills = ""
    
    var timeBool = true
    var showSkillsTimeUp:Timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始值
        fightViewLayoutDid = false
        selfSkillBool = false
        otherSkillsBool = false
        timeBool = true
        self.view.backgroundColor = UIColor.white
        if playerID == "A" {
            fightSelfNameLabel.text = aName
            fightOtherNameLabel.text = bName
        }else{
            fightSelfNameLabel.text = bName
            fightOtherNameLabel.text = aName
        }
        skills1Btn.alpha = 1
        skills2Btn.alpha = 1
        skills3Btn.alpha = 1
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.settlement), name: NSNotification.Name(rawValue: "skills"), object: nil)
    }
    
    

    @IBAction func skills1(_ sender: Any) {
        
        if onlineMode {
            selfSkillBool = true
            skills = skills1String
            do {
                _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: skills1StringData as Data,with: .reliable)
            }catch{
                print(error)
            }
            if otherSkillsBool {
                settlement()
            }
        }else{
            skills = skills1String
            computerSkills()
            settlement()
        }
        skills1Btn.alpha = 0
        skills2Btn.alpha = 0
        skills3Btn.alpha = 0
    }
    @IBAction func skills2(_ sender: Any) {
        
        if onlineMode {
            selfSkillBool = true
            skills = skills2String
            do {
                _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: skills2StringData as Data,with: .reliable)
            }catch{
                print(error)
            }
            if otherSkillsBool {
                settlement()
            }
        }else{
            skills = skills2String
            computerSkills()
            settlement()
        }
        skills1Btn.alpha = 0
        skills2Btn.alpha = 0
        skills3Btn.alpha = 0
        
    }
    @IBAction func skills3(_ sender: Any) {
        
        if onlineMode {
            selfSkillBool = true
            skills = skills3String
            do {
                _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: skills3StringData as Data,with: .reliable)
            }catch{
                print(error)
            }
            if otherSkillsBool {
                settlement()
            }
        }else{
            skills = skills3String
            computerSkills()
            settlement()
        }
        skills1Btn.alpha = 0
        skills2Btn.alpha = 0
        skills3Btn.alpha = 0
    }
    
    func computerSkills()  {
        let skill = arc4random_uniform(3)
        if skill == 0 {
            otherSkillsString = "剪刀"
        }else if skill == 1 {
            otherSkillsString = "石頭"
        }else if skill == 2 {
            otherSkillsString = "布"
        }
    }
    
    
    func settlement()  {
        DispatchQueue.main.async {
            
            if self.skills == "剪刀" && otherSkillsString == "剪刀" {
                self.selfSkillsLabel.alpha = 1
                self.otherSkillsLabel.alpha = 1
                self.selfSkillsLabel.image = UIImage(named: "attack")
                self.otherSkillsLabel.image = UIImage(named: "attack")
                
                //動畫
                UIView.animate(withDuration: 0.3) {
                    self.selfAttackConstraint.constant = self.view.frame.width/3
                    self.otherAttackConstraint.constant = -self.view.frame.width/3
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                        UIView.animate(withDuration: 0.3){
                        self.selfAttackConstraint.constant = 0
                        self.otherAttackConstraint.constant = 0
                        self.view.layoutIfNeeded()
                        }
                    }
                    self.view.layoutIfNeeded()
                }
                //
                
                self.showSkillsTimeUp.fire()
            }else if self.skills == "石頭" && otherSkillsString == "石頭" {
                self.selfSkillsLabel.alpha = 1
                self.otherSkillsLabel.alpha = 1
                self.selfSkillsLabel.image = UIImage(named: "defense")
                 self.otherSkillsLabel.image = UIImage(named: "defense")
                
            }else if self.skills == "布" && otherSkillsString == "布" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.image = UIImage(named: "bandage")
                 self.otherSkillsLabel.image = UIImage(named: "bandage")
                
                
                aHP += aLuck
                bHP += bLuck
                
                
            }else if  self.skills == "剪刀" && otherSkillsString == "石頭" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.image = UIImage(named: "attack")
                 self.otherSkillsLabel.image = UIImage(named: "defense")
                
                if playerID == "A" {
                    aHP -= bATK
                    bHP -= aATK/2
                }else{
                    bHP -= aATK
                    aHP -= bATK/2
                }
                //動畫
                UIView.animate(withDuration: 0.3) {
                    self.selfbl.image = UIImage(named: "bl.png")
                    self.selfbl.alpha = 1
                    self.selfAttackConstraint.constant = self.view.frame.width/3
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                        UIView.animate(withDuration: 0.3){
                            self.selfbl.alpha = 0
                            self.selfAttackConstraint.constant = 0
                            self.view.layoutIfNeeded()
                        }
                    }
                    self.view.layoutIfNeeded()
                }
                //
                
                
            } else if self.skills == "剪刀" && otherSkillsString == "布" {
                self.selfSkillsLabel.alpha = 1
                self.otherSkillsLabel.alpha = 1
                self.selfSkillsLabel.image = UIImage(named: "attack")
                 self.otherSkillsLabel.image = UIImage(named: "bandage")
                
                if playerID == "A" {
                    bHP -= aATK
                }else{
                    aHP -= bATK
                }
                //動畫
                UIView.animate(withDuration: 0.3) {
                    self.otherbl.image = UIImage(named: "bl.png")
                    self.otherbl.alpha = 1
                    self.selfAttackConstraint.constant = self.view.frame.width/3
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                        UIView.animate(withDuration: 0.3){
                            self.otherbl.alpha = 0
                            self.selfAttackConstraint.constant = 0
                            self.view.layoutIfNeeded()
                        }
                    }
                    self.view.layoutIfNeeded()
                }
                //
            }else if  self.skills == "石頭" && otherSkillsString == "剪刀" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.image = UIImage(named: "defense")
                 self.otherSkillsLabel.image = UIImage(named: "attack")
                
                if playerID == "A" {
                    bHP -= aATK
                    aHP -= bATK/2
                }else{
                    aHP -= bATK
                    bHP -= aATK/2
                }
                //動畫
                UIView.animate(withDuration: 0.3) {
                    self.otherbl.image = UIImage(named: "bl.png")
                    self.otherbl.alpha = 1
                    self.otherAttackConstraint.constant = -self.view.frame.width/3
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                        UIView.animate(withDuration: 0.3){
                            self.otherbl.alpha = 0
                            self.otherAttackConstraint.constant = 0
                            self.view.layoutIfNeeded()
                        }
                    }
                    self.view.layoutIfNeeded()
                }
                //
            }else if  self.skills == "布" && otherSkillsString == "剪刀" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.image = UIImage(named: "bandage")
                self.otherSkillsLabel.image = UIImage(named: "attack")
                
                if playerID == "A" {
                    aHP -= bATK
                }else{
                    bHP -= aATK
                }
                //動畫
                UIView.animate(withDuration: 0.3) {
                    self.selfbl.image = UIImage(named: "bl.png")
                    self.selfbl.alpha = 1
                    self.otherAttackConstraint.constant = -self.view.frame.width/3
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                        self.selfbl.alpha = 0
                        UIView.animate(withDuration: 0.3){
                            self.otherAttackConstraint.constant = 0
                            self.view.layoutIfNeeded()
                        }
                    }
                    self.view.layoutIfNeeded()
                }
                //
            }else if  self.skills == "布" && otherSkillsString == "石頭" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.image = UIImage(named: "bandage")
                 self.otherSkillsLabel.image = UIImage(named: "defense")
                
                if playerID == "A" {
                    aHP += aLuck
                }else{
                    bHP += bLuck
                }
            }else if self.skills == "石頭" && otherSkillsString == "布" {
                self.selfSkillsLabel.alpha = 1
                self.otherSkillsLabel.alpha = 1
                self.selfSkillsLabel.image = UIImage(named: "defense")
                self.otherSkillsLabel.image = UIImage(named: "bandage")
                
                if playerID == "A" {
                    bHP += bLuck
                }else{
                    aHP += aLuck
                }
            }
            
            self.showSkillsTimeUp = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector( self.showSKills), userInfo: nil, repeats: true)
            self.showSkillsTimeUp.fire()
            self.fightViewStats()
        }
    }
    
    
    func showSKills()  {
        if timeBool  {
            timeBool = false
        }else{
            skills1Btn.alpha = 1
            skills2Btn.alpha = 1
            skills3Btn.alpha = 1
            selfSkillsLabel.alpha = 0
            otherSkillsLabel.alpha = 0
            showSkillsTimeUp.invalidate()
            selfSkillBool = false
            otherSkillsBool = false
            timeBool = true
        }
    }
    func fightViewStats()  {
        
        if aHP >= 50{
            aHP = 50
        }
        if bHP >= 50{
            bHP = 50
        }
            if playerID == "A" {
                
                self.selfHPConstraint.constant = -(self.hPLine*CGFloat(50-aHP)/50)
                self.selfATKConstraint.constant = -(self.Line23*CGFloat(20-aATK)/20)
                self.selfLuckContraint.constant = -(self.Line23*CGFloat(20-aLuck)/20)
                
                self.otherHPContraint.constant = -(self.hPLine*CGFloat(50-bHP)/50)
                self.otherATKContraint.constant = -(self.Line23*CGFloat(20-bATK)/20)
                self.otherLuckConstraint.constant = -(self.Line23*CGFloat(20-bLuck)/20)
                
            }else{
                
                self.selfHPConstraint.constant = -(self.hPLine*CGFloat(50-bHP)/50)
                self.selfATKConstraint.constant = -(self.Line23*CGFloat(20-bATK)/20)
                self.selfLuckContraint.constant = -(self.Line23*CGFloat(20-bLuck)/20)
                
                self.otherHPContraint.constant = -(self.hPLine*CGFloat(50-aHP)/50)
                self.otherATKContraint.constant = -(self.Line23*CGFloat(20-aATK)/20)
                self.otherLuckConstraint.constant = -(self.Line23*CGFloat(20-aLuck)/20)
                
            }
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
        if aHP <= 0{
            skills1Btn.alpha = 0
            skills2Btn.alpha = 0
            skills3Btn.alpha = 0
            playIDAWinBool = false
            goGameOverView()
        }else if bHP <= 0 {
            skills1Btn.alpha = 0
            skills2Btn.alpha = 0
            skills3Btn.alpha = 0
            playIDAWinBool = true
            goGameOverView()
        }
    }
    
    func goGameOverView()  {
        DispatchQueue.main.asyncAfter(deadline: .now()+2){
            themeMusic.stop()
            let v = self.storyboard?.instantiateViewController(withIdentifier:"gameOver")
            self.present(v!, animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        if fightViewLayoutDid == false {
            fightViewLayoutDid = true
            hPLine = self.LineHP.frame.width
            Line23 = self.selfATK.frame.width
            self.selfHPConstraint.constant = -self.LineHP.frame.width
            self.selfATKConstraint.constant = -self.selfATK.frame.width
            self.selfLuckContraint.constant = -self.selfATK.frame.width
            self.otherHPContraint.constant = -self.LineHP.frame.width
            self.otherATKContraint.constant = -self.selfATK.frame.width
            self.otherLuckConstraint.constant = -self.selfATK.frame.width
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.fightViewStats()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
