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
    
    var playName : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //遊戲結束監聽器
        NotificationCenter.default.addObserver(self, selector: #selector(back), name: NSNotification.Name(rawValue: "GameOver"), object: nil)
        
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
                let view=self.storyboard?.instantiateViewController(withIdentifier:"CustomGameMode")
                self.present(view!, animated: true, completion: nil)
            }
            else{
                checkNameView.text = "\n\n\n\n你好"+playerName+"\n等待對方選擇..."
                checkNameView.alpha = 1
                //名字選擇監聽器
                NotificationCenter.default.addObserver(self, selector: #selector(goPlay), name: NSNotification.Name(rawValue: "goPlay"), object: nil)
            }
        }
    }
    
    func goPlay()  {
        
        let view=self.storyboard?.instantiateViewController(withIdentifier:"CustomGameMode")
        self.present(view!, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
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
