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



class SelectPlayerMenu: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var checkNameView: UITextView!
    @IBOutlet weak var checkNameViewBackground: UIImageView!
    
    var playName : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //名字
        playName = ["大衛布萊恩","傑森史塔森","嘎嘎蹦拉拉","佛心公司","我好興奮阿"]

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playName.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        playerName = playName[row] as! String
        return playName[row] as? String
    }
    
    
    
    
    @IBAction func okBtn(_ sender: Any) {
        
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
    
    func goPlay()  {
        nameCheckTimer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(SelectPlayerMenu.goCustomGameMode), userInfo: nil, repeats: true)
        nameCheckTimer.fire()
        
        if playerID == "A" {
            aName = playerName
            bName = otherPlayerNameString
        }else if playerID == "B" {
            bName = playerName
            aName = otherPlayerNameString
        }
        
        checkNameView.text = "\(playerName)，你好\n\n某個年代，某個大陸上有三個國家，幾百年來互相敵對，為了打破僵局，Ａ國與Ｂ國決定合作執行一項計畫，各派出一名間諜潛入Ｃ國，Ａ國間諜的名字是 \(aName)，Ｂ國間諜的名字叫 \(bName)，兩人表面上同心協力，背地裡卻各有心機"
        checkNameView.alpha = 1
        checkNameViewBackground.alpha = 1
        
    }
    
    
    func goCustomGameMode() {
        if nameCheckTimerFirstRun == true{
            nameCheckTimerFirstRun = false
        }else{
            let view=self.storyboard?.instantiateViewController(withIdentifier:"CustomGameMode")
            self.present(view!, animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("停止timer")
        nameCheckTimer.invalidate()
        nameCheckTimerFirstRun = true
        checkNameView.alpha = 0
        checkNameViewBackground.alpha = 0
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


