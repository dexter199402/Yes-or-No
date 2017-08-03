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

var playerName = "哈哈"
// 今天做到這裡 8/3 傳名字給對方 還沒實作 接收對方的名字 思考nsdata
let playerNameData :NSData = playerName.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData



class SelectPlayerMenu: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {


    
    var playName : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        
        playName = ["dd","aa","cc","dd"]

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playName.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        playerName = playName[row] as! String
        print(playerName)
        return playName[row] as? String
    }
    
    
    
    
    @IBAction func okBtn(_ sender: Any) {
        
        do {
                _ = try GCHelper.sharedInstance.match.sendData(toAllPlayers: playerNameData as Data, with: .reliable)
        }catch{
            print(error)
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        
        
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
