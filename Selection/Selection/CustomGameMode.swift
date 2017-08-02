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

//答案倒數
var countdownNember = 10.0
var answerCountdown = Timer()

//屬性值
var selfHP = 10
var selfATK = 10
var selfLuck = 10
var selfGold = 10
var otherHP = 10
var otherATK = 10
var otherLuck = 10
var otherGold = 10

class CustomGameMode: UIViewController {
    
    @IBOutlet weak var colorButton: UIImageView!
    @IBOutlet weak var blackCircle: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var answerCountdownLabel: UILabel!
    
    //屬性條
    @IBOutlet weak var selfLine1: UIImageView!
    @IBOutlet weak var selfLine2: UIImageView!
    @IBOutlet weak var selfLine3: UIImageView!
    @IBOutlet weak var selfLine4: UIImageView!
    @IBOutlet weak var otherLine1: UIImageView!
    @IBOutlet weak var otherLine2: UIImageView!
    @IBOutlet weak var otherLine3: UIImageView!
    @IBOutlet weak var otherLine4: UIImageView!
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
        question()
        questionsLabel.text = questionsLabelText
        
        //答案回答倒數
        answerCountdown = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        answerCountdown.fire()

        //改變數值條
//        self.selfLine1Constraints.constant = -(self.selfLine1.frame.width*0.5)
        
    }
    
    //倒數結束隨機選擇答案
    func countdown() {
        countdownNember = countdownNember - 0.1
        answerCountdownLabel.text = String(format: "%.1f", countdownNember)
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
                    }catch{
                        print(error)
                    }
                }
                if othercheck {
                    result(view:self)
                    if playerID == "noting"{
                        playerID = "B"
                    }
                }
            }
        }
    }
    //更改題目label方法 改變圖片回原本樣子 開始倒數
    func labelText(){
        questionsLabel.text = questionsLabelText
        colorButton.image = UIImage.animatedImageNamed("按鈕原圖.png", duration: 1)
        answerCountdown = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        countdownNember = 10.5
        answerCountdown.fire()
    }
    
    
    // ==對方後選結果方法=====>>
    func otherpley() {
        result(view: self)
        if playerID == "noting"{
            playerID = "A"
        }
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
                }
            }catch{
                print(error)
            }
        }
        lock = true
        if othercheck {
            result(view:self)
            if playerID == "noting" {
                playerID = "B"
            }
        }
    }
    
    func gameOver() {
        let alert = UIAlertController(title: "GameOver", message: "遊戲結束了按OK繼續", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        answerCountdown.invalidate()
        playerID = "noting"
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
