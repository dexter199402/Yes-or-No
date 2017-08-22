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


class fightView: UIViewController {
    @IBOutlet weak var selfHPConstraint: NSLayoutConstraint!
    @IBOutlet weak var otherHPContraint: NSLayoutConstraint!
    @IBOutlet weak var selfName: UILabel!
    @IBOutlet weak var otherName: UILabel!
    @IBOutlet weak var selfATKConstraint: NSLayoutConstraint!
    @IBOutlet weak var selfLuckContraint: NSLayoutConstraint!
    @IBOutlet weak var otherATKContraint: NSLayoutConstraint!
    @IBOutlet weak var otherLuckConstraint: NSLayoutConstraint!

    
    @IBOutlet weak var LineHP: UIImageView!
    @IBOutlet weak var selfATK: UIImageView!
    
    @IBOutlet weak var skills1Btn: UIButton!
    
    @IBOutlet weak var skills2Btn: UIButton!
    
    @IBOutlet weak var skills3Btn: UIButton!
    
    @IBOutlet weak var selfSkillsLabel: UILabel!
    @IBOutlet weak var otherSkillsLabel: UILabel!
    
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.settlement), name: NSNotification.Name(rawValue: "skills"), object: nil)
    }
    
    

    @IBAction func skills1(_ sender: Any) {
        selfSkillBool = true
        skills = skills1String
        do {
            _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: skills1StringData as Data,with: .reliable)
        }catch{
            print(error)
        }
        skills1Btn.alpha = 0
        skills2Btn.alpha = 0
        skills3Btn.alpha = 0
        if otherSkillsBool {
            settlement()
        }
        
    }
    @IBAction func skills2(_ sender: Any) {
        selfSkillBool = true
        skills = skills2String
        do {
            _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: skills2StringData as Data,with: .reliable)
        }catch{
            print(error)
        }
        skills1Btn.alpha = 0
        skills2Btn.alpha = 0
        skills3Btn.alpha = 0
        if otherSkillsBool {
            settlement()
        }
        
    }
    @IBAction func skills3(_ sender: Any) {
        selfSkillBool = true
        skills = skills3String
        do {
            _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: skills3StringData as Data,with: .reliable)
        }catch{
            print(error)
        }
        skills1Btn.alpha = 0
        skills2Btn.alpha = 0
        skills3Btn.alpha = 0
        if otherSkillsBool {
            settlement()
        }
        
    }
    
    
    func settlement()  {
        DispatchQueue.main.async {
            
            otherSkillsBool = false
            if self.skills == "剪刀" && otherSkillsString == "剪刀" {
                self.selfSkillsLabel.alpha = 1
                self.otherSkillsLabel.alpha = 1
                self.selfSkillsLabel.text = "剪刀"
                self.otherSkillsLabel.text = "剪刀"
                
                self.showSkillsTimeUp.fire()
            }else if self.skills == "石頭" && otherSkillsString == "石頭" {
                self.selfSkillsLabel.alpha = 1
                self.otherSkillsLabel.alpha = 1
                self.selfSkillsLabel.text = "石頭"
                 self.otherSkillsLabel.text = "石頭"
                
            }else if self.skills == "布" && otherSkillsString == "布" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.text = "布"
                 self.otherSkillsLabel.text = "布"
                
            }else if  self.skills == "剪刀" && otherSkillsString == "石頭" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.text = "剪刀"
                 self.otherSkillsLabel.text = "石頭"
                
                if playerID == "A" {
                    aHP -= bATK
                }else{
                    bHP -= aATK
                }
            } else if self.skills == "剪刀" && otherSkillsString == "布" {
                self.selfSkillsLabel.alpha = 1
                self.otherSkillsLabel.alpha = 1
                self.selfSkillsLabel.text = "剪刀"
                 self.otherSkillsLabel.text = "布"
                
                if playerID == "A" {
                    bHP -= aATK
                }else{
                    aHP -= bATK
                }
            }else if  self.skills == "石頭" && otherSkillsString == "剪刀" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.text = "石頭"
                 self.otherSkillsLabel.text = "剪刀"
                
                if playerID == "A" {
                    bHP -= aATK
                }else{
                    aHP -= bATK
                }
            }else if  self.skills == "布" && otherSkillsString == "剪刀" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.text = "布"
                self.otherSkillsLabel.text = "剪刀"
                
                if playerID == "A" {
                    aHP -= bATK
                }else{
                    bHP -= aATK
                }
            }else if  self.skills == "布" && otherSkillsString == "石頭" {
                 self.selfSkillsLabel.alpha = 1
                 self.otherSkillsLabel.alpha = 1
                 self.selfSkillsLabel.text = "布"
                 self.otherSkillsLabel.text = "石頭"
                
                if playerID == "A" {
                    bHP -= aATK
                }else{
                    aHP -= bATK
                }
            }else if self.skills == "石頭" && otherSkillsString == "布" {
                self.selfSkillsLabel.alpha = 1
                self.otherSkillsLabel.alpha = 1
                self.selfSkillsLabel.text = "石頭"
                self.otherSkillsLabel.text = "布"
                
                if playerID == "B" {
                    bHP -= aATK
                }else{
                    aHP -= bATK
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
        if aHP <= 0 || bHP <= 0 {
            let v = storyboard?.instantiateViewController(withIdentifier:"gameOver")
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
