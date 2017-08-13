//
//  SelectPlayerMenu.swift
//  Selection
//
//  Created by 陳韋傑 on 2017/7/20.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
import GameKit
import GCHelper
//故事背景倒數
var nameCheckTimer = Timer()
var nameCheckTimerFirstRun = true

var playerName = "吳明寺"
var otherPlayerName:NSData?
var otherPlayerNameString : String = NSString(data: otherPlayerName!as Data, encoding: String.Encoding.utf8.rawValue)! as String
var nameLock = false
var otherNameLock = false

let playerNameData :NSData = playerName.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData

var aName = ""
var bName = ""

//autolayOut之後尺寸
var countDownWidth1:CGFloat = 0.0
var sizeLock = false

class SelectPlayerMenu: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var checkNameView: UITextView!
    @IBOutlet weak var checkNameViewBackground: UIImageView!
    @IBOutlet weak var yourNameLabel: UILabel!
    
    @IBOutlet weak var countDownImage: UIImageView!
    @IBOutlet weak var countDownWidth: NSLayoutConstraint!
    
    var playName : NSMutableArray = []
    
    //名字選擇倒數
    var nameCountDownTimer = Timer()
    var countDownTimerNember = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //名字
        playName = ["佛羅多·巴金斯","菜菜子","賽佛勒斯·石內卜","邱偉豪","跩哥·馬份","勒苟拉斯","安納金·天行者","歐比王·肯諾比","丘巴卡"]
        
        if onlineMode == true {
           nameCountDownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SelectPlayerMenu.nameCountDown), userInfo: nil, repeats: true)
            nameCountDownTimer.fire()
        }else if onlineMode == false{
            countDownImage.alpha = 0
        }
        
        //hero動畫
        isHeroEnabled = true
        yourNameLabel.heroModifiers = [.translate(y: 100)]

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playName.count
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        playerName = playName[row] as! String
        var att: NSAttributedString!
        att = NSAttributedString(string: playerName,attributes: [NSForegroundColorAttributeName : UIColor.darkGray])
        return att
    }
    
    //名稱選擇倒數
    func nameCountDown()  {
        if countDownTimerNember > 0 {
            countDownTimerNember -= 1
            self.countDownWidth.constant = -(countDownWidth1*CGFloat(30-countDownTimerNember)/30)
        }else if countDownTimerNember <= 0 {
            nameCountDownTimer.invalidate()
            countDownTimerNember = 30
            okBtn((Any).self)
        }
    }
    
    
    @IBAction func okBtn(_ sender: Any) {
        
        if onlineMode == true {
            if nameLock == false{
            nameLock = true
            do {
                    _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: playerNameData as Data,    with: .reliable)
            }catch{
                print(error)
            }
            if otherNameLock == true {
                if playerID == "noting" {
                    playerID = "B"
                }
                goPlay()
            }
            else{
                checkNameView.text = "\n\n\n\n你好"+playerName+"\n等待對方選擇..."
                checkNameView.alpha = 1
                checkNameViewBackground.alpha = 1
                if playerID == "noting"{
                    playerID = "A"
                }
                //名字選擇監聽器
                NotificationCenter.default.addObserver(self, selector: #selector(goPlay), name: NSNotification.Name(rawValue: "goPlay"), object: nil)
                }
            }
        }
        
        if onlineMode == false {
            let ID = arc4random_uniform(2)
            if ID == 0 {
                playerID = "A"
            }else{
                playerID = "B"
            }
            checkNameView.alpha = 1
            checkNameViewBackground.alpha = 1
            goPlay()
        }
    }
    
    func goPlay()  {
        nameCheckTimer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(SelectPlayerMenu.goCustomGameMode), userInfo: nil, repeats: true)
        nameCheckTimer.fire()
        
        if onlineMode == true {
            if playerID == "A" {
                aName = playerName
                bName = otherPlayerNameString
            }else if playerID == "B" {
                bName = playerName
                aName = otherPlayerNameString
            }
        }
        
        if onlineMode == false {
            if playerID == "A" {
                aName = playerName
                let otherName = "電腦人"
                bName = otherName
            }else if playerID == "B" {
                bName = playerName
                let otherName = "電腦人"
                aName = otherName
            }
        }
        
        //ttf
//        checkNameView.font = UIFont(name: "setoFont", size: 36)
        //
        yourNameLabel.alpha = 0
        checkNameView.text = "\(playerName)，你好\n\n某個年代，某個大陸上有三個國家，幾百年來互相敵對，為了打破僵局，Ａ國與Ｂ國決定合作執行一項計畫，各派出一名間諜潛入Ｃ國，Ａ國間諜的名字是 \(aName)，Ｂ國間諜的名字叫 \(bName)，兩人表面上同心協力，背地裡卻各有心機"
        checkNameView.alpha = 1
        checkNameViewBackground.alpha = 1
        
    }
    
    
    func goCustomGameMode() {
        if nameCheckTimerFirstRun == true{
            nameCheckTimerFirstRun = false
        }else{
            guard let view=self.storyboard?.instantiateViewController(withIdentifier:"CustomGameMode") else {
                print("沒有view可以轉")
                return
            }
            self.present(view, animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nameCheckTimer.invalidate()
        nameCheckTimerFirstRun = true
        checkNameView.alpha = 0
        checkNameViewBackground.alpha = 0
        countDownImage.alpha = 1
        yourNameLabel.alpha = 1
    }
    
    override func viewDidLayoutSubviews() {
        if sizeLock == false {
            sizeLock = true
            countDownWidth1 = (self.countDownImage.frame.width)
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


