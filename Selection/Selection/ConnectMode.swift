//
//  ViewController.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/7/16.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
import Hero
import GameKit
import GCHelper

var otherAnswer:NSData?
var othercheck = false

class ConnectMode: UIViewController {
    @IBOutlet weak var buttonColor: UIImageView!
    @IBOutlet weak var whiteCircle: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //驗證身份,沒這行不能登錄
        GCHelper.sharedInstance.authenticateLocalUser()
        
//        if GKLocalPlayer.localPlayer().isAuthenticated == false {
//        }
        
        
        
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
            print("自訂遊戲")
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
           otherAnswer = didReceiveData as NSData
            print("有資料來了")
        
            othercheck = true
            if lock{
                // 通知customGameMode
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "play"), object: nil)
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
        print("結束")
        // 通知 customGameMode遊戲結束了
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GameOver"), object: nil)
    }
    
    /// Method called when a match has been initiated.
    func matchStarted() {
        print("開始")
        let vc1=self.storyboard?.instantiateViewController(withIdentifier:"SelectPlayerMenu")
        self.present(vc1!, animated: true, completion: nil)
    }
    
    //逃生門回到這
    @IBAction func backFirstView (_segue: UIStoryboardSegue){
        
    }
}
