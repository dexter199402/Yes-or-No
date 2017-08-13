//
//  CustomGameMode.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/7/20.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
import GameKit
import GCHelper
import Hero

var pressYes = "是"
var playerDataYes :NSData = pressYes.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
var pressNo = "否"
var playerDataNo :NSData = pressNo.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData

var lock = false

var yourAnswer = 9

var playerID = "noting"

//答案倒數
var countdownNember = 20
var answerCountdown = Timer()

var aHP = 50
var aATK = 10
var aLuck = 10
var aGold = 200
var bHP = 50
var bATK = 10
var bLuck = 10
var bGold = 200

//個數值條autolayout之後的長度
var autolayoutLock = false
var countDownImageWidthValue = CGFloat()
var Line1Value = CGFloat()
var Line2Value = CGFloat()
var Line3Value = CGFloat()

class CustomGameMode: UIViewController {
    
    //倒數計時條
    @IBOutlet weak var countDownImage: UIImageView!
    @IBOutlet weak var countDownImageWidth: NSLayoutConstraint!
    
    @IBOutlet weak var colorButton: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var answerCountdownLabel: UILabel!
    @IBOutlet weak var blackMan: UIImageView!
    @IBOutlet weak var whiteMan: UIImageView!
    
    //屬刑調 image
    
    @IBOutlet weak var selfLine1: UIImageView!
    @IBOutlet weak var selfLine2: UIImageView!
    @IBOutlet weak var selfLine3: UIImageView!
    @IBOutlet weak var selfGold: UILabel!
    @IBOutlet weak var otherLine1: UIImageView!
    @IBOutlet weak var otherLine2: UIImageView!
    @IBOutlet weak var otherLine3: UIImageView!
    @IBOutlet weak var otherGold: UILabel!
    
    //屬性條 constraints
    
    @IBOutlet weak var selfLine1Constraints: NSLayoutConstraint!
    @IBOutlet weak var selfLine2Constraints: NSLayoutConstraint!
    @IBOutlet weak var selfLine3Constraints: NSLayoutConstraint!
    @IBOutlet weak var otherLine1Constraints: NSLayoutConstraint!
    @IBOutlet weak var otherLine2Constraints: NSLayoutConstraint!
    @IBOutlet weak var otherLine3Constraints: NSLayoutConstraint!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 更改label監聽器 改變圖片回原本樣子 開始倒數
        NotificationCenter.default.addObserver(self, selector: #selector(labelText), name: NSNotification.Name(rawValue: "LabelText"), object: nil)
        
        // 對方玩家後選監聽器
        NotificationCenter.default.addObserver(self, selector: #selector(otherpley), name: NSNotification.Name(rawValue: "play"), object: nil)
        
        //遊戲結束監聽器
        NotificationCenter.default.addObserver(self, selector: #selector(gameOver), name: NSNotification.Name(rawValue: "GameOver"), object: nil)
        
        //第一題
        question1_1()
        questionsLabel.text = questionsLabelText
        
        
        if onlineMode == true {
            answerCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
            answerCountdown.fire()
        }else if onlineMode == false {
            countDownImage.alpha = 0
            answerCountdownLabel.alpha = 0
        }
        
        
        //人物動畫
        manAnimation()
        
        statsLine()
        
        //hero動畫
        isHeroEnabled = true
        self.heroModalAnimationType = .selectBy(presenting: .zoomSlide(direction: .left), dismissing: .zoomOut)
    }
    
    //改變數值條顯示
    func statsLine()  {
        if playerID == "A" {
            self.selfLine1Constraints.constant = -(Line1Value*CGFloat(50-aHP)/50)
            self.selfLine2Constraints.constant = -(Line2Value*CGFloat(20-aATK)/20)
            self.selfLine3Constraints.constant = -(Line3Value*CGFloat(20-aLuck)/20)
            if aATK <= 0 {
                selfLine2.alpha = 0
            }else{
                selfLine2.alpha = 1
            }
            if aLuck <= 0 {
                selfLine3.alpha = 0
            }else{
                selfLine3.alpha = 1
            }
            selfGold.text = "\(aGold)"
            self.otherLine1Constraints.constant = -(Line1Value*CGFloat(50-bHP)/50)
            self.otherLine2Constraints.constant = -(Line2Value*CGFloat(20-bATK)/20)
            self.otherLine3Constraints.constant = -(Line3Value*CGFloat(20-bLuck)/20)
            if bATK <= 0 {
                otherLine2.alpha = 0
            }else{
                otherLine2.alpha = 1
            }
            if bLuck <= 0 {
                otherLine3.alpha = 0
            }else{
                otherLine3.alpha = 1
            }
            otherGold.text = "\(bGold)"
        }else if playerID == "B" {
            self.selfLine1Constraints.constant = -(Line1Value*CGFloat(50-bHP)/50)
            self.selfLine2Constraints.constant = -(Line2Value*CGFloat(20-bATK)/20)
            self.selfLine3Constraints.constant = -(Line3Value*CGFloat(20-bLuck)/20)
            if bATK <= 0 {
                selfLine2.alpha = 0
            }else{
                selfLine2.alpha = 1
            }
            if bLuck <= 0 {
                selfLine3.alpha = 0
            }else{
                selfLine3.alpha = 1
            }
            selfGold.text = "\(bGold)"
            self.otherLine1Constraints.constant = -(Line1Value*CGFloat(50-aHP)/50)
            self.otherLine2Constraints.constant = -(Line2Value*CGFloat(20-aATK)/20)
            self.otherLine3Constraints.constant = -(Line3Value*CGFloat(20-aLuck)/20)
            if aATK <= 0 {
                otherLine2.alpha = 0
            }else{
                otherLine2.alpha = 1
            }
            if aLuck <= 0{
                otherLine3.alpha = 0
            }else{
                otherLine3.alpha = 1
            }
            otherGold.text = "\(aGold)"
        }
    }
    
    //人物動畫
    func manAnimation() {
        whiteMan.animationImages = [UIImage(named:"一般裝態白1.png")!,UIImage(named:"一般裝態白2.png")!,UIImage(named:"一般裝態白3.png")!,UIImage(named:"一般裝態白2.png")!]
        whiteMan.animationDuration = 1
        whiteMan.animationRepeatCount = 0
        whiteMan.startAnimating()
        blackMan.animationImages = [UIImage(named:"一般裝態黑1.png")!,UIImage(named:"一般裝態黑2.png")!,UIImage(named:"一般裝態黑3.png")!,UIImage(named:"一般裝態黑2.png")!]
        blackMan.animationDuration = 1
        blackMan.animationRepeatCount = 0
        blackMan.startAnimating()
    }
    
    //倒數結束隨機選擇答案
    func countdown() {
        countdownNember = countdownNember - 1
        if lock == false{
            answerCountdownLabel.text = String(format: "%d", countdownNember)
            self.countDownImageWidth.constant = -(countDownImageWidthValue*CGFloat(20-countdownNember)/20)
            if countdownNember <= 0 {
                countDownImage.alpha = 0
            }else{
                countDownImage.alpha = 0.1
            }
        }else if lock {
            answerCountdown.invalidate()
        }
        print(countdownNember)
        if countdownNember <= 0{
            answerCountdownLabel.text = String(0.0)
            //隨機選擇一個答案
            if lock != true {
                let yesOrNo = arc4random_uniform(2)
                if yesOrNo == 0 {
                    do {
                        //                上傳是的Data
                        _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: playerDataYes as Data, with: .reliable)
                        print("是")
                        lock = true
                        yourAnswer = 1
                        colorButton.image = UIImage.animatedImageNamed("按鈕選擇藍.png", duration: 1)
                        answerCountdownLabel.text = "等待對方選擇..."
                    }catch{
                        print(error)
                    }
                }else if yesOrNo == 1 {
                    do {
                        //                上傳否的Data
                        _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: playerDataNo as Data, with: .reliable)
                        print("否")
                        lock = true
                        yourAnswer = 0
                        colorButton.image = UIImage.animatedImageNamed("按鈕選擇紅.png", duration: 1)
                        answerCountdownLabel.text = "等待對方選擇..."
                    }catch{
                        print(error)
                    }
                }
                if othercheck {
                    result(vv:self)
                }
            }
        }
    }
    
    //結束過場後執行
    func labelText(){
        questionsLabel.text = questionsLabelText
        colorButton.image = UIImage.animatedImageNamed("按鈕原圖.png", duration: 1)
        if onlineMode {
            answerCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
            countdownNember = 20
            answerCountdown.fire()
        }
        statsLine()
    }
    
    // ==對方後選結果方法=====>>
    func otherpley() {
        result(vv: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        buttonPath(path: colorButton)
        if autolayoutLock == false {
            countDownImageWidthValue = (self.countDownImage.frame.width)
            Line1Value = self.selfLine1.frame.height
            Line2Value = self.selfLine2.frame.width
            Line3Value = self.selfLine3.frame.width
            autolayoutLock = true
            
        }
        
    }
//    判斷按下的按鈕
    @IBAction func customGameModeButton(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: sender.view)
        if buttonColorPath.contains(point) {
            
            if  onlineMode == true {
                do {
                if lock != true{
//                上傳是的Data
                _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: playerDataYes as Data, with: .reliable)
                    print("是")
                    lock = true
                    yourAnswer = 1
                    colorButton.image = UIImage.animatedImageNamed("按鈕選擇藍.png", duration: 1)
                    answerCountdownLabel.text = "等待對方選擇..."
                    }
                }catch{
                    print(error)
                }
            }
            
            if onlineMode == false {
                print("是")
                yourAnswer = 1
                
                let r = arc4random_uniform(2)
                if r == 1 {
                    otherAnswer = pressYes.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
                }else{
                    otherAnswer = pressNo.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
                }
            }
            
        }else{
            
            if onlineMode == true {
                do {
                if lock != true{
//                上傳否的Data
                _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: playerDataNo as Data, with: .reliable)
                    print("否")
                    lock = true
                    yourAnswer = 0
                    colorButton.image = UIImage.animatedImageNamed("按鈕選擇紅.png", duration: 1)
                    answerCountdownLabel.text = "等待對方選擇..."
                    }
                }catch{
                    print(error)
                }
            }
            
            if onlineMode == false {
                print("否")
                yourAnswer = 0
                
                let r = arc4random_uniform(2)
                if r == 1 {
                    otherAnswer = pressYes.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
                }else{
                    otherAnswer = pressNo.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
                }
            }
        }
        lock = true
        if othercheck || !onlineMode {
            result(vv:self)
        }
    }
    
    func gameOver() {
        let alert = UIAlertController(title: "GameOver", message: "遊戲結束了按OK繼續", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.performSegue(withIdentifier: "backFirstView", sender: self)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        answerCountdown.invalidate()
        playerID = "noting"
        otherNameLock = false
        nameLock = false
        whiteMan.stopAnimating()
        blackMan.stopAnimating()
        aHP = 50
        aATK = 10
        aLuck = 10
        aGold = 200
        bHP = 50
        bATK = 10
        bLuck = 10
        bGold = 200
        countDownImage.alpha = 1
        answerCountdownLabel.alpha = 1
        
        //答案不重複
        iD1Lock = false
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
