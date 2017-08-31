//
//  StoryImageView.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/21.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
import GCHelper
import AVFoundation


class StoryImageView: UIViewController {

    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var wait: UILabel!
    @IBOutlet weak var statsLabel: UILabel!
    
    @IBOutlet weak var storyImageViewImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wait.alpha = 0
        wait.backgroundColor = UIColor.clear
        statsLabel.text = statsLabelText
    }

    @IBAction func completeButton(_ sender: Any) {
        
        if onlineMode {
            selfComplete = true
            completeButton.alpha = 0
            wait.backgroundColor = UIColor.black
            wait.alpha = 0.6
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showWait"), object: nil)
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
    
    override func viewDidAppear(_ animated: Bool) {
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
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
