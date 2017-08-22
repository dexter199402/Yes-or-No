//
//  ViewController.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/7/16.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
import AVFoundation
import Hero
import GameKit
import GCHelper

var playPage1Music:AVAudioPlayer = AVAudioPlayer()
var buttonSound:AVAudioPlayer = AVAudioPlayer()
var otherAnswer:NSData?
var othercheck = false
var onlineMode = false
var otherMessage = ""
var menuOpen = false
var otherCompleteBtnBool = false
var selfSkillBool = false
var otherSkillsString = ""
var otherSkillsBool = false




class ConnectMode: UIViewController {
    @IBOutlet weak var buttonColor: UIImageView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuBackground: UIImageView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var musicSliderValue: UISlider!
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始值
        onlineMode = false
        
        //menu shadow
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        
        
//        ttf 一覽
//        for family: String in UIFont.familyNames
//        {
//            print("\(family)")
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
//            }
//        }
        
        
        //music
        do{
            let audioPath = Bundle.main.path(forResource: "Morning_Walk", ofType: "mp3")
            try playPage1Music = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
            print("\(error)")
        }
        playPage1Music.numberOfLoops = -1
        playPage1Music.prepareToPlay()
        playPage1Music.play()
        
        //驗證身份，檢查登入
        GCHelper.sharedInstance.authenticateLocalUser()
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = {
            (login, error) in
            if (login != nil) {
                print("請登入")
                self.present(login!, animated: true, completion: nil)
            }
        }
        
        //hero動畫
        isHeroEnabled = true
    }
    
    
    @IBAction func backGroundTap(_ sender: UITapGestureRecognizer) {
        menuFunc()
    }
    @IBAction func openMenu(_ sender: Any) {
        menuFunc()
    }
    func menuFunc()  {
        if menuOpen {
            self.leadingConstraint.constant = -190
            self.menuLeadingConstraint.constant = -20
            menuBtn.setImage(UIImage(named: "menu.png"), for: .normal)
            self.menuBackground.isUserInteractionEnabled = false
            self.buttonColor.isUserInteractionEnabled = true
            UIView.animate(withDuration: 0.3, animations: {
                self.menuBackground.alpha = 0
            })
        }else {
            leadingConstraint.constant = 0
            menuLeadingConstraint.constant = -180
            menuBtn.setImage(UIImage(named: "backMenu.png"), for: .normal)
            self.buttonColor.isUserInteractionEnabled = false
            self.menuBackground.isUserInteractionEnabled = true
            UIView.animate(withDuration: 0.3, animations: {
                self.menuBackground.alpha = 0.8
            })
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        menuOpen = !menuOpen
    }
    @IBAction func musicSlider(_ sender: UISlider) {
        playPage1Music.volume = musicSliderValue.value
    }

    
    
    
    
    override func viewDidLayoutSubviews() {
    //按鈕範圍
        buttonPath(path: buttonColor)
    }

    //MARK: 點擊按鈕了
    @IBAction func tapButton(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: sender.view)
        if buttonColorPath.contains(point){
        GCHelper.sharedInstance.findMatchWithMinPlayers(2, maxPlayers: 2, viewController: self, delegate: self )
        }else{
            playPage1Music.stop()
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "SelectPlayerMenu")
            self.present(vc2!, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



//擴充 CGHelperDelegte
extension ConnectMode: GCHelperDelegate {
    /// Method called when the device received data about the match from another device in the match.
    //當接受到傳值會執行的方法
    func match(_ match: GKMatch, didReceiveData: Data, fromPlayer: String) {
        
        if otherNameLock == true{
            let dataString : String = NSString(data: didReceiveData, encoding: String.Encoding.utf8.rawValue)! as String
            if dataString.contains("是")||dataString.contains("否") {
                otherAnswer = didReceiveData as NSData
                othercheck = true
                if lock{
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "play"), object: nil)
                }
            }else if dataString.contains("你好")||dataString.contains("謝謝")||dataString.contains("呵呵")||dataString.contains("相信我"){
                otherMessage = dataString
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "messageCome"), object: nil)
            }else if dataString.contains("/"){
                qString = dataString
                print("我是玩家Ｂ,我收到題目了")
            }else if dataString.contains("我看完了"){
                otherCompleteBtnBool = true
                if selfComplete {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "completeGo"), object: nil)
                }
            }else if dataString.contains("剪刀") || dataString.contains("石頭") || dataString.contains("布") {
                otherSkillsBool = true
                otherSkillsString = dataString
                if selfSkillBool {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "skills"), object: nil)
                }
            }
        }
        
        if otherNameLock == false{
            otherNameLock = true
            //接收對方姓名資料
            otherPlayerName = didReceiveData as NSData
            if nameLock == true {
                //通知可以開始遊戲了
               NotificationCenter.default.post(name: NSNotification.Name(rawValue: "goPlay"), object: nil)
            }
        }
        
        
    }
    /// Method called when the match has ended.
    func matchEnded() {
        // 通知 customGameMode遊戲結束了
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GameOver"), object: nil)
        onlineMode = false
        
    }
    
    /// Method called when a match has been initiated.
    func matchStarted() {
        onlineMode = true
        playPage1Music.stop()
        let vc1=self.storyboard?.instantiateViewController(withIdentifier:"SelectPlayerMenu")
        self.present(vc1!, animated: true, completion: nil)
    }
    
    //逃生門回到這
    @IBAction func backFirstView (_segue: UIStoryboardSegue){
        
    }
}
