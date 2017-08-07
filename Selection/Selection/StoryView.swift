//
//  StoryView.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/7/31.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
var timeUp = Timer()


class StoryView: UIViewController {
    @IBOutlet weak var storyTextLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTextLabel.text = storyTextLabelText

    //計時器 7秒dismiss
        timeUp = Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(StoryView.dismissSelf), userInfo: nil, repeats: true)
        
        // 各項屬性重設
        othercheck = false
        otherAnswer = nil
        lock = false
        yourAnswer = 8
        answerCountdown.invalidate()
        timeUp.fire()
    
    }
    func dismissSelf(){
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
