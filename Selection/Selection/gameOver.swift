//
//  gameOver.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/20.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit

class gameOver: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func gg(_ sender: Any) {
        //前一場屬性重設
        
        answerCountdown.invalidate()
        playerID = "noting"
        otherNameLock = false
        nameLock = false
        getQuestion = [Int]()
        onlineMode = false
        
        let alert = UIAlertController(title: "GameOver", message: "遊戲結束了按OK繼續", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.performSegue(withIdentifier: "backFirstView", sender: self)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
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
