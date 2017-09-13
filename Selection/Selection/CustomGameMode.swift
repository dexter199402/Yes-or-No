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

var yesLabelText = "YES"
var noLabelText = "NO"


var lock = false
var yourAnswer = 9
var playerID = "noting"

//答案倒數
var countdownNember = 40
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
var autolayoutLoc = false
var countDownImageWidthValue = CGFloat()
var Line1Value = CGFloat()
var Line2Value = CGFloat()
var Line3Value = CGFloat()
var buttonValue = CGFloat()

var backGroundImage = "road.jpg"
var situationViewLabelString = "你到了哪裡？"

class CustomGameMode: UIViewController {
    
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    
    //倒數計時條
    @IBOutlet weak var countDownImage: UIImageView!
    @IBOutlet weak var countDownImageWidth: NSLayoutConstraint!
    var countDownUse = false
    
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
    
    //powpow對話
    @IBOutlet weak var powpow1: UIImageView!
    @IBOutlet weak var powpow2: UIImageView!
    @IBOutlet weak var powpow3: UIImageView!
    @IBOutlet weak var powpow4: UIImageView!
    @IBOutlet weak var powLabel1: UILabel!
    @IBOutlet weak var powLabel2: UILabel!
    @IBOutlet weak var powLabel3: UILabel!
    @IBOutlet weak var powLabel4: UILabel!
    @IBOutlet weak var selfPowpow: UIImageView!
    @IBOutlet weak var selfPowLabel: UILabel!
    @IBOutlet weak var otherPowpow: UIImageView!
    @IBOutlet weak var otherPowLabel: UILabel!
    
    //狀態
    @IBOutlet weak var selfStatus1: UIImageView!
    @IBOutlet weak var selfStatus2: UIImageView!
    @IBOutlet weak var selfStatus3: UIImageView!
    @IBOutlet weak var otherStatus1: UIImageView!
    @IBOutlet weak var otherStatus2: UIImageView!
    @IBOutlet weak var otherStatus3: UIImageView!
    @IBOutlet weak var statusViewConstraint: NSLayoutConstraint!
    
    
    
    //背景
    @IBOutlet weak var situationBackground: UIImageView!
    @IBOutlet weak var situationViwe: UIView!
    @IBOutlet weak var situationViewLabel: UILabel!
    
    
    
    
    
    
    
    var powpowTime:Timer = Timer()
    var otherPowpowTime:Timer = Timer()
    var firstPow = true
    var otherFirstPow = true
    var viewDidLoadTimer:Timer = Timer()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始數值
        autolayoutLoc = false
        aHP = 50
        aATK = 10
        aLuck = 10
        aGold = 200
        bHP = 50
        bATK = 10
        bLuck = 10
        bGold = 200
        selfGold.text = "200"
        otherGold.text = "200"
        countDownImage.alpha = 1
        answerCountdownLabel.alpha = 1
        yesLabelText = "YES"
        noLabelText = "NO"
        playIDAWinBool = false
        
        
        // 對方玩家後選監聽器
        NotificationCenter.default.addObserver(self, selector: #selector(otherpley), name: NSNotification.Name(rawValue: "play"), object: nil)
        
        //遊戲結束監聽器
        NotificationCenter.default.addObserver(self, selector: #selector(gameOver), name: NSNotification.Name(rawValue: "GameOver"), object: nil)
        
        //訊息來了監聽
        NotificationCenter.default.addObserver(self, selector: #selector(otherPow), name: NSNotification.Name(rawValue: "messageCome"), object: nil)
        
        
        selectionQuestion()
        questionsLabel.text = questionsLabelText
        
        
        if onlineMode == false {
            countDownImage.alpha = 0
            answerCountdownLabel.alpha = 0
            whiteMan.isUserInteractionEnabled = false
        }
        
        //人物動畫
        manAnimation()
        
    }
    
    func themeMusicFunc()  {
        if questionID == 1.1 || questionID == 3.1 || questionID == 50.1 || questionID == 51.1 {
            
            musicSelection(musicName:"1_1")
            
        }else if questionID == 2.1 {
            musicSelection(musicName: "Not_Without_the_Rest")
        }else if questionID == 2.31 || questionID == 2.34{
            musicSelection(musicName: "2_31")
        }else if questionID == 100.1 {
            musicSelection(musicName: "100_1")
        }else if questionID == 101.1 {
            if playerID == "A" {
                musicSelection(musicName: "100_1")
            }
        }else if questionID == 102.1 {
            if playerID == "B" {
                musicSelection(musicName: "100_1")
            }
        }else if questionID == 99.1 {
            musicSelection(musicName: "99.1")
        }else if questionID == 52.1 {
            musicSelection(musicName: "52.1")
        }
        
        //背景順便
        self.situationViwe.alpha = 1
        
        backgroundViewChange()
        self.backImage.image = UIImage(named: backGroundImage)
        
    }
    func musicSelection(musicName:String)  {
        do{
            let audioPath = Bundle.main.path(forResource: musicName, ofType: "mp3")
            try themeMusic = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
            print("\(error)")
        }
        themeMusic.volume = volumeValue
        themeMusic.numberOfLoops = -1
        themeMusic.prepareToPlay()
        themeMusic.play()
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
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }
    
    //人物動畫
    func manAnimation() {
        whiteMan.animationImages = [UIImage(named:"一般裝態黑1.png")!,UIImage(named:"一般裝態黑2.png")!,UIImage(named:"一般裝態黑3.png")!,UIImage(named:"一般裝態黑2.png")!]
        whiteMan.animationDuration = 1
        whiteMan.animationRepeatCount = 0
        whiteMan.startAnimating()
        blackMan.animationImages = [UIImage(named:"一般裝態紅1.png")!,UIImage(named:"一般裝態紅2.png")!,UIImage(named:"一般裝態紅3.png")!,UIImage(named:"一般裝態紅2.png")!]
        blackMan.animationDuration = 1
        blackMan.animationRepeatCount = 0
        blackMan.startAnimating()
    }
    
    //倒數結束隨機選擇答案
    func countdown() {
        countdownNember = countdownNember - 1
        if lock == false{
            answerCountdownLabel.text = String(format: "%d", countdownNember)
            if countDownUse {
                self.countDownImageWidth.constant = -(countDownImageWidthValue*CGFloat(15-countdownNember)/15)
            }else{
                self.countDownImageWidth.constant = -(countDownImageWidthValue*CGFloat(25-countdownNember)/40)
            }
            if countdownNember <= 0 {
                countDownImage.alpha = 0
            }else{
                countDownImage.alpha = 0.1
            }
        }else if lock {
            answerCountdown.invalidate()
        }
        if countdownNember <= 0{
            answerCountdownLabel.text = String(0.0)
            answerCountdown.invalidate()
            //隨機選擇一個答案
            if lock != true {
                countDownUse = true
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
        if autolayoutLoc == false {
            countDownImageWidthValue = (self.countDownImage.frame.width)
            Line1Value = self.selfLine1.frame.height
            Line2Value = self.selfLine2.frame.width
            Line3Value = self.selfLine3.frame.width
            buttonValue = self.colorButton.frame.height
            autolayoutLoc = true
            self.selfLine1Constraints.constant = -self.selfLine1.frame.height
            self.otherLine1Constraints.constant = -self.otherLine1.frame.height
            statusViewConstraint.constant = buttonValue*1.2
        }
    }
    
    @IBAction func situationView(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 2) { 
            self.situationViwe.alpha = 0
            self.situationViewLabel.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showCurseStatus()
        if selectionquestionBool {
            themeMusicFunc()
            selectionquestionBool = false
        }
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        self.yesLabel.text = yesLabelText
        self.noLabel.text = noLabelText
        DispatchQueue.main.async{
            self.statsLine()
        }
        
        
        
        self.questionsLabel.text = questionsLabelText
        self.colorButton.image = UIImage.animatedImageNamed("按鈕原圖.png", duration: 1)
        if onlineMode {
            answerCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
            if self.countDownUse {
                countdownNember = 15
            }else{
                countdownNember = 40
            }
            print("問題倒數計開始:\(countdownNember)")
            answerCountdown.fire()
        }
        
    }

    
    
    func backgroundViewChange()  {
        self.situationBackground.alpha = 0
        self.situationViewLabel.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            self.situationBackground.image = UIImage(named: backGroundImage)
            self.situationViewLabel.text = situationViewLabelString
            UIView.animate(withDuration: 1, animations: {
                self.situationBackground.alpha = 1
                self.situationViewLabel.alpha = 1
            })
        }
    }
//    判斷按下的按鈕
    @IBAction func customGameModeButton(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: sender.view)
        if buttonColorPath.contains(point) {
            //音效
            if  onlineMode == true {
                do {
                if lock != true{
                    countDownUse = false
                    buttonSoundFunc()
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
                buttonSoundFunc()
                let r = arc4random_uniform(2)
                if r == 1 {
                    otherAnswer = pressYes.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
                }else{
                    otherAnswer = pressNo.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
                }
            }
            
        }else{
            buttonSoundFunc()
            if onlineMode == true {
                do {
                if lock != true{
                    buttonSoundFunc()
                    countDownUse = false
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
                buttonSoundFunc()
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
    
    func buttonSoundFunc()  {
        //music
        do{
            let audioPath = Bundle.main.path(forResource: "choose", ofType: "mp3")
            try buttonSound = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
            print("\(error)")
        }
        buttonSound.volume = volumeValue
        print(volumeValue)
        buttonSound.prepareToPlay()
        buttonSound.play()
    }
    
    
    
    @IBOutlet weak var selfStatusLabel: UILabel!
    @IBOutlet weak var otherStatusLabel: UILabel!
    
    //狀態顯示
    @IBAction func selfStatus(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            
            showCurseStatus()
            statusViewConstraint.constant = 0
        }else if sender.state == .changed {
            
            statusViewConstraint.constant = 0
        }else{
            statusViewConstraint.constant = buttonValue*1.2
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    //curse狀態顯示
    func showCurseStatus()  {
        
        var aCurseString = ""
        var bCurseString = ""
        var cityalertAString = ""
        var cityalertBString = ""
        var bloodAString = ""
        var bloodBString = ""
        
        if aCurse {
            
            aCurseString = "詛咒：肯定不是好效果"
            
            if playerID == "A" {
                selfStatus3.alpha = 1
            }else if playerID == "B"{
                otherStatus3.alpha = 1
            }
        }else{
            
            aCurseString = ""
            
            if playerID == "A" {
                selfStatus3.alpha = 0
            }else if playerID == "B"{
                otherStatus3.alpha = 0
            }
        }
        
        if bCurse {
            
            bCurseString = "詛咒：肯定不是好效果"
            
            if playerID == "B" {
                selfStatus3.alpha = 1
            }else if playerID == "A"{
                otherStatus3.alpha = 1
            }
        }else{
            
            bCurseString = ""
            
            if playerID == "B" {
                selfStatus3.alpha = 0
            }else if playerID == "A"{
                otherStatus3.alpha = 0
            }
        }
        
        if cityalertA {
            
            cityalertAString = "跟蹤：你感到有雙眼鏡注視著你"
            
            if playerID == "A" {
                selfStatus2.alpha = 1
            }else if playerID == "B"{
                otherStatus2.alpha = 1
            }
        }else{
            
            cityalertAString = ""
            
            if playerID == "A" {
                selfStatus2.alpha = 0
            }else if playerID == "B"{
                otherStatus2.alpha = 0
            }
        }
        
        if cityalertB {
            
            cityalertBString = "跟蹤：你感到有雙眼鏡注視著你"
            
            if playerID == "B" {
                selfStatus2.alpha = 1
            }else if playerID == "A"{
                otherStatus2.alpha = 1
            }
        }else{
            
            cityalertBString = ""
            
            if playerID == "B" {
                selfStatus2.alpha = 0
            }else if playerID == "A"{
                otherStatus2.alpha = 0
            }
        }
        
        
        if bloodA {
            
            bloodAString = "受傷：一直在流血"
            
            if playerID == "A" {
                selfStatus1.alpha = 1
            }else if playerID == "B"{
                otherStatus1.alpha = 1
            }
        }else{
            
            bloodAString = ""
            
            if playerID == "A" {
                selfStatus1.alpha = 0
            }else if playerID == "B"{
                otherStatus1.alpha = 0
            }
        }
        
        if bloodB {
            
            bloodBString = "受傷：一直在流血"
            
            if playerID == "B" {
                selfStatus1.alpha = 1
            }else if playerID == "A"{
                otherStatus1.alpha = 1
            }
        }else{
            
            bloodBString = ""
            
            if playerID == "B" {
                selfStatus1.alpha = 0
            }else if playerID == "A"{
                otherStatus1.alpha = 0
            }
        }
        
        if playerID == "A" {
            selfStatusLabel.text = "\(bloodAString)\n\(cityalertAString)\n\(aCurseString)"
            otherStatusLabel.text = "\(bloodBString)\n\(cityalertBString)\n\(bCurseString)"
        }else{
            selfStatusLabel.text = "\(bloodBString)\n\(cityalertBString)\n\(bCurseString)"
            otherStatusLabel.text = "\(bloodAString)\n\(cityalertAString)\n\(aCurseString)"
        }
    }
    
    
    
    
    
    //泡泡對話
    @IBAction func tapWhiteMan(_ sender: UITapGestureRecognizer) {
            powpow1.alpha = 1
            powpow2.alpha = 1
            powpow3.alpha = 1
            powpow4.alpha = 1
            powLabel1.alpha = 1
            powLabel2.alpha = 1
            powLabel3.alpha = 1
            powLabel4.alpha = 1
        colorButton.isUserInteractionEnabled = false
    }
    //powpow1
    @IBAction func powpow1(_ sender: Any) {
        let pow1 = "你好"
        powpowTimee(str: pow1)
        powpowdismiss()
    }
    //powpow2
    @IBAction func powpow2(_ sender: Any) {
        let pow2 = "謝謝"
        powpowTimee(str: pow2)
        powpowdismiss()
    }
    //powpow3
    @IBAction func powpow3(_ sender: Any) {
        let pow3 = "呵呵"
        powpowTimee(str: pow3)
        powpowdismiss()
    }
    //powpow4
    @IBAction func powpow4(_ sender: Any) {
        let pow4 = "相信我"
        powpowTimee(str: pow4)
        powpowdismiss()
    }
    func powpowdismiss()  {
        powpow1.alpha = 0
        powpow2.alpha = 0
        powpow3.alpha = 0
        powpow4.alpha = 0
        powLabel1.alpha = 0
        powLabel2.alpha = 0
        powLabel3.alpha = 0
        powLabel4.alpha = 0
        colorButton.isUserInteractionEnabled = true
    }
    func powpowTimee(str:String)  {
        powpowTime.invalidate()
        selfPowLabel.text = str
        let dataaa :NSData = str.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
        do{
            _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: dataaa as Data, with: .reliable)
        }
        catch{
            print(error)
        }
        selfPowpow.alpha = 1
        selfPowLabel.alpha = 1
        whiteMan.isUserInteractionEnabled = false
        powpowTime = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.selfTalkPowMiss), userInfo: nil, repeats: true)
        powpowTime.fire()
    }
    func selfTalkPowMiss()  {
        if firstPow == true {
            firstPow = false
        }else{
            selfPowLabel.alpha = 0
            selfPowpow.alpha = 0
            powpowTime.invalidate()
            firstPow = true
            whiteMan.isUserInteractionEnabled = true
        }
    }
    func otherPow()  {
        otherPowpowTime.invalidate()
        otherPowLabel.text = otherMessage
        otherPowpow.alpha = 1
        otherPowLabel.alpha = 1
        otherPowpowTime = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.otherTalkPowMiss), userInfo: nil, repeats: true)
        otherPowpowTime.fire()
    }
    
    func otherTalkPowMiss() {
        if otherFirstPow == true {
            otherFirstPow = false
        }else{
            otherPowLabel.alpha = 0
            otherPowpow.alpha = 0
            otherPowpowTime.invalidate()
            otherFirstPow = true
        }
    }

    func gameOver() {
        //前一場屬性重設
        
        themeMusic.stop()
        
        answerCountdown.invalidate()
        playerID = "noting"
        otherNameLock = false
        nameLock = false
        countDownImage.alpha = 1
        whiteMan.stopAnimating()
        blackMan.stopAnimating()
        answerCountdownLabel.alpha = 1
        getQuestion = [Int]()
        let v = self.storyboard?.instantiateViewController(withIdentifier:"gameOver")
        self.present(v!, animated: true, completion: nil)
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
