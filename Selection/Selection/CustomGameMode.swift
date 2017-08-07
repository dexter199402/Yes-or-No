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

var pressYes = "是"
var playerDataYes :NSData = pressYes.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
var pressNo = "否"
var playerDataNo :NSData = pressNo.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData


//答案鎖定
var lock = false
//自身答案
var yourAnswer = 9
//玩家ID
var playerID = "noting"

//人物動畫
var animatedManID = "A"

//答案倒數
var countdownNember = 20
var answerCountdown = Timer()
//人物動畫
var animated = Timer()
//屬性值
var aHP = 10
var aATK = 10
var aLuck = 10
var aGold = 10
var bHP = 10
var bATK = 10
var bLuck = 10
var bGold = 10

class CustomGameMode: UIViewController {
    
    @IBOutlet weak var colorButton: UIImageView!
    @IBOutlet weak var blackCircle: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var answerCountdownLabel: UILabel!
    @IBOutlet weak var blackMan: UIImageView!
    @IBOutlet weak var whiteMan: UIImageView!

    //屬性條 constraints
    @IBOutlet weak var selfLine1Constraints: NSLayoutConstraint!
    @IBOutlet weak var selfLine2Constraints: NSLayoutConstraint!
    @IBOutlet weak var selfLine3Constraints: NSLayoutConstraint!
    @IBOutlet weak var selfLine4Constraints: NSLayoutConstraint!
    @IBOutlet weak var otherLine1Constraints: NSLayoutConstraint!
    @IBOutlet weak var otherLine2Constraints: NSLayoutConstraint!
    @IBOutlet weak var otherLine3Constraints: NSLayoutConstraint!
    @IBOutlet weak var otherLine4Constraints: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 更改label監聽器 改變圖片回原本樣子 開始倒數
        NotificationCenter.default.addObserver(self, selector: #selector(labelText), name: NSNotification.Name(rawValue: "LabelText"), object: nil)
        
        // 對方玩家後選監聽器
        NotificationCenter.default.addObserver(self, selector: #selector(otherpley), name: NSNotification.Name(rawValue: "play"), object: nil)
        
        //遊戲結束監聽器
        NotificationCenter.default.addObserver(self, selector: #selector(gameOver), name: NSNotification.Name(rawValue: "GameOver"), object: nil)
        
        //第一題
        question1()
        questionsLabel.text = questionsLabelText
        
        //答案回答倒數
        answerCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        answerCountdown.fire()
        
        //人物動畫
        animated = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(animatedImage), userInfo: nil, repeats: true)
        animated.fire()
        
        print("我叫做:",playerName)
        print("對方叫做:",otherPlayerNameString)
        
        

        
        //改變數值條
//        self.selfLine1Constraints.constant = -(self.selfLine1.frame.width*0.5)
        
    }
    
    //人物動畫
    func animatedImage()  {
        if animatedManID == "A"{
            blackMan.image = UIImage.animatedImageNamed("一般裝態黑2.png", duration: 1)
            whiteMan.image = UIImage.animatedImageNamed("一般裝態白2.png", duration: 1)
            animatedManID = "B"
        }else if animatedManID == "B"{
            blackMan.image = UIImage.animatedImageNamed("一般裝態黑3.png", duration: 1)
            whiteMan.image = UIImage.animatedImageNamed("一般裝態白3.png", duration: 1)
            animatedManID = "C"
        }else if animatedManID == "C"{
            blackMan.image = UIImage.animatedImageNamed("一般裝態黑2.png", duration: 1)
            whiteMan.image = UIImage.animatedImageNamed("一般裝態白2.png", duration: 1)
            animatedManID = "D"
        }else if animatedManID == "D"{
            blackMan.image = UIImage.animatedImageNamed("一般裝態黑1.png", duration: 1)
            whiteMan.image = UIImage.animatedImageNamed("一般裝態白1.png", duration: 1)
            animatedManID = "A"
        }
    }
    
    //倒數結束隨機選擇答案
    func countdown() {
        countdownNember = countdownNember - 1
        if lock == false{
            answerCountdownLabel.text = String(format: "%d", countdownNember)
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
    //更改題目label方法 改變圖片回原本樣子 開始倒數
    func labelText(){
        questionsLabel.text = questionsLabelText
        colorButton.image = UIImage.animatedImageNamed("按鈕原圖.png", duration: 1)
        answerCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        countdownNember = 10
        answerCountdown.fire()

        
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
    }
//    判斷按下的按鈕
    @IBAction func customGameModeButton(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: sender.view)
        if buttonColorPath.contains(point) {
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
        }else{
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
        lock = true
        if othercheck {
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
        animated.invalidate()
        aHP = 10
        aATK = 10
        aLuck = 10
        aGold = 10
        bHP = 10
        bATK = 10
        bLuck = 10
        bGold = 10
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
