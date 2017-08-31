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
import CLTypingLabel

//故事背景倒數
var nameCheckTimer = Timer()

var playerName = "吳明寺"
var otherPlayerName:NSData?
var otherPlayerNameString : String = NSString(data: otherPlayerName!as Data, encoding: String.Encoding.utf8.rawValue)! as String
var nameLock = false
var otherNameLock = false


var completeOK = "背景故事"
var completeOKData :NSData = completeOK.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
var completeCheck = false
var otherCompleteCheck = false

let playerNameData :NSData = playerName.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData

var aName = ""
var bName = ""

//autolayOut之後尺寸
var countDownWidth1:CGFloat = 0.0
var sizeLock = false
//問題序列
var arrayy = [1,2,3,4,5,6,7,8,9,10]
var getQuestion = [Int]()
var qString = ""





class SelectPlayerMenu: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var checkNameView: UITextView!
    @IBOutlet weak var checkNameViewBackground: UIImageView!

    @IBOutlet weak var yourNameLabel: CLTypingLabel!
    
    
    @IBOutlet weak var countDownImage: UIImageView!
    @IBOutlet weak var countDownWidth: NSLayoutConstraint!
    
    @IBOutlet weak var complete: UIButton!
    
    @IBOutlet weak var waitLabel: UILabel!
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var okBtn: UIButton!
    
    var playName = ["小明","菜菜子","羊咩咩","摳哥","老王","印度蛙","天龍人","矮子輔","杰倫","阿象","邱偉豪"]
    
    //名字選擇倒數
    var nameCountDownTimer = Timer()
    var countDownTimerNember = 30
    
    //故事背景倒數
    var goPlayNember = 60
    
    
    
    
    var random:Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        complete.alpha = 0
        yourNameLabel.text = "你的名字"
        yourNameLabel.charInterval = 0.05
        yourNameLabel.centerText = false
        completeCheck = false
        otherCompleteCheck = false
        
        pickerView.alpha = 1
        okBtn.alpha = 1
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(customGame), name: NSNotification.Name(rawValue: "nameComplete"), object: nil)
        goPlayNember = 60
        
        
        //名字
        
        if onlineMode == true {
           nameCountDownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SelectPlayerMenu.nameCountDown), userInfo: nil, repeats: true)
            nameCountDownTimer.fire()
        }else if onlineMode == false{
            countDownImage.alpha = 0
        }
        

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        playerName = playName[row]
        return playerName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        playerName = playName[row]
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
    
    
    @IBAction func completeBtn(_ sender: Any) {
        if onlineMode == true {
            
            completeCheck = true
            complete.alpha = 0
            do {
                _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: completeOKData as Data,with: .reliable)
            }catch{
                print(error)
            }
            if otherCompleteCheck == true {
                customGame()
            }else{
                yourNameLabel.alpha = 0
                waitLabel.text = "稍等，對方還在看。"
                waitLabel.alpha = 1
            }
        }else{
            customGame()
        }
        
    }
    
    
    @IBAction func okBtn(_ sender: Any) {
       
        if onlineMode == true {
            if nameLock == false{
            nameLock = true
            do {
                    _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: playerNameData as Data,with: .reliable)
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
                    UIView.animate(withDuration: 1, animations: {
                        self.yourNameLabel.alpha = 0
                        self.waitLabel.text = "你好\n\(playerName)\n等待對方選擇"
                        self.waitLabel.alpha = 1
                    })
                
                nameCountDownTimer.invalidate()
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
            UIView.animate(withDuration: 1, animations: {
                self.yourNameLabel.alpha = 0
//                self.checkNameView.alpha = 1
                self.checkNameViewBackground.alpha = 1
            })
            
            goPlay()
        }
        pickerView.alpha = 0
        okBtn.alpha = 0
    }
    
    func goPlay()  {
        nameCheckTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SelectPlayerMenu.goCustomGameMode), userInfo: nil, repeats: true)
        nameCheckTimer.fire()
        complete.alpha = 1
        if onlineMode == true {
            
            iD1Lock = false
            iD2Lock = false
            iD3Lock = false
            iD4Lock = false
            iD5Lock = false
            
            if playerID == "A" {
                aName = playerName
                bName = otherPlayerNameString
                //由Ａ玩家決定問題序列
                //題目不重複
                arrayy = [1,2,3,4,5,6,7,8,9,10,99]
                //測試
                qString = "1/2/50/51/99"
                //隨機選問題
//                qString = ""
//                for _ in 1...5 {
//                    getTheRandomQuestion()
//                }
//                qString = String(getQuestion[0])+"/"+String(getQuestion[1])+"/"+String(getQuestion[2])+"/"+String(getQuestion[3])+"/"+String(getQuestion[4])
                let qStringData:NSData = qString.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
                do {
                    _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: qStringData as Data,with: .reliable)
                }catch{
                    print(error)
                }
            }else if playerID == "B" {
                bName = playerName
                aName = otherPlayerNameString
            }
        }
        
        if onlineMode == false {
            
            iD1Lock = false
            iD2Lock = false
            iD3Lock = false
            iD4Lock = false
            iD5Lock = false
            
            arrayy = [1,2,3,4,5,6,7,8,9,10]
            
            //測試
            qString = "1/2/50/51/99"
//            for _ in 1...5 {
//                getTheRandomQuestion()
//            }
//            qString = String(getQuestion[0])+"/"+String(getQuestion[1])+"/"+String(getQuestion[2])+"/"+String(getQuestion[3])+"/"+String(getQuestion[4])
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
        
        checkNameView.font = UIFont (name: "DFHsiu-W3-WINP-BF", size: 22)
        

        UIView.animate(withDuration: 1, animations: {
            if onlineMode {
                self.checkNameView.text = "\(playerName)\n你好\n對手是\n\(otherPlayerNameString)"
            }else{
                self.checkNameView.text = "\(playerName)\n你好\n對手是\n電腦人"
            }
            self.yourNameLabel.alpha = 0
            self.waitLabel.alpha = 0
//            self.checkNameView.alpha = 1
            self.checkNameViewBackground.alpha = 1
        })
        
        nameCountDownTimer.invalidate()
    }
    
    func getTheRandomQuestion()  {
        random = Int(UInt32(arc4random()) % UInt32(arrayy.count))
        getQuestion.append(arrayy[random])
        arrayy.remove(at: random)
    }
    
    
    
    
    func goCustomGameMode() {
        if goPlayNember > 0 {
            goPlayNember -= 1
            self.countDownWidth.constant = -(countDownWidth1*CGFloat(60-goPlayNember)/60)
        }else if goPlayNember <= 0 {
            nameCheckTimer.invalidate()
            goPlayNember = 60
            customGame()
        }

//        if nameCheckTimerFirstRun == true{
//            nameCheckTimerFirstRun = false
//        }else{
//            guard let view=self.storyboard?.instantiateViewController(withIdentifier:"CustomGameMode") else {
//                print("沒有view可以轉")
//                return
//            }
//            self.present(view, animated: true, completion: nil)
//        }
    }
    func customGame()  {
        guard let view=self.storyboard?.instantiateViewController(withIdentifier:"CustomGameMode") else {
            print("沒有view可以轉")
            return
        }
        self.present(view, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nameCheckTimer.invalidate()
        nameCountDownTimer.invalidate()
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
