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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func completeButton(_ sender: Any) {
        
        if onlineMode {
            selfComplete = true
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
