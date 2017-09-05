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
import AVFoundation

let completebtnString = "我看完了"
var completebtnStringData :NSData = completebtnString.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
var selfComplete = false




class StoryView: UIViewController {
    
    
    @IBOutlet weak var wait: UILabel!
    @IBOutlet weak var storyTextLabel: CLTypingLabel!
    @IBOutlet weak var paperImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        storyTextLabel.font = UIFont (name: "DFHsiu-W3-WINP-BF", size: 30)
        storyTextLabel.tintColor = UIColor.black
        storyTextLabel.text = storyTextLabelText
        storyTextLabel.charInterval = 1.0
        
        NotificationCenter.default.addObserver(self, selector: #selector(showWait), name: NSNotification.Name(rawValue: "showWait"), object: nil)
    

        // 各項屬性重設
        wait.backgroundColor = UIColor.clear
        othercheck = false
        otherAnswer = nil
        lock = false
        yourAnswer = 8
        answerCountdown.invalidate()
        selfComplete = false
        otherCompleteBtnBool = false
        
    }
    override func viewDidAppear(_ animated: Bool) {
        storyTextLabel = nil
        pageSound()
    }
    func pageSound()  {
        do{
            let audioPath = Bundle.main.path(forResource: "page-flip-9", ofType: "wav")
            try pageFilp = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
            print("\(error)")
        }
        pageFilp.prepareToPlay()
        pageFilp.volume = volumeValue
        pageFilp.play()
    }
    
    func showWait()  {
        wait.backgroundColor = UIColor.black
        wait.alpha = 0.7
    }
    
    func dis()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
