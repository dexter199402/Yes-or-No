//
//  StoryImageView.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/21.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit
import GCHelper

class StoryImageView: UIViewController {

    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var wait: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wait.alpha = 0
        
    }

    @IBAction func completeButton(_ sender: Any) {
        
        if onlineMode {
            selfComplete = true
            completeButton.alpha = 0
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
