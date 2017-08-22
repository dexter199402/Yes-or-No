//
//  StoryView.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/7/31.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
import CLTypingLabel
import GCHelper

let completebtnString = "我看完了"
var completebtnStringData :NSData = completebtnString.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
var selfComplete = false


var timeUp = Timer()

class StoryView: UIViewController {
    
    
    @IBOutlet weak var wait: UILabel!
    @IBOutlet weak var storyTextLabel: CLTypingLabel!
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var paperImage: UIImageView!
    @IBOutlet weak var storyNextBtn: UIButton!
    
    var nextBtnTimer = Timer()
    var nextBtnTimerBool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        storyTextLabel.font = UIFont (name: "DFHsiu-W3-WINP-BF", size: 30)
        storyTextLabel.tintColor = UIColor.black
        storyTextLabel.text = storyTextLabelText
        statsLabel.text = statsLabelText
        storyTextLabel.charInterval = 1.0
        
        
        storyNextBtn.alpha = 0
        let storyTextCount = Double(storyTextLabelText.characters.count)
        let storyNextTime = storyTextCount*0.1
    
    //按鈕顯示
        nextBtnTimerBool = true
        if onlineMode {
            wait.alpha = 0
            otherCompleteBtnBool = false
            selfComplete = false
            storyNextBtn.alpha = 0
            
            nextBtnTimer = Timer.scheduledTimer(timeInterval: storyNextTime, target: self, selector: #selector(self.shwoBtn), userInfo: nil, repeats: true)
            nextBtnTimer.fire()
            
            
        }else{
            nextBtnTimer = Timer.scheduledTimer(timeInterval: storyNextTime, target: self, selector: #selector(self.shwoBtn), userInfo: nil, repeats: true)
            nextBtnTimer.fire()
        }

        // 各項屬性重設
        othercheck = false
        otherAnswer = nil
        lock = false
        yourAnswer = 8
        answerCountdown.invalidate()

        
    }
    
    func shwoBtn()  {
        if nextBtnTimerBool == true {
            nextBtnTimerBool = false
        }else{
            storyNextBtn.alpha = 1
            nextBtnTimer.invalidate()
        }
    }
    @IBAction func Completebtn(_ sender: Any) {
        if onlineMode {
            selfComplete = true
            storyNextBtn.alpha = 0
            wait.alpha = 0.7
            do {
            _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: completebtnStringData as Data,with: .reliable)
            }catch{
                print(error)
            }
            if otherCompleteBtnBool {
                dis()
            }
        }else{
            dis()
        }
    }
    
    func dis()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        timeUp.invalidate()
        // 通知customGameMode更改屬性重設.
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LabelText"), object: nil)
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
