//
//  QuestionFunction.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/7.
//  Copyright © 2017年 wei. All rights reserved.
//

import Foundation

var iD1Lock = false


func selectionQuestion() {
    
    let ID = arc4random_uniform(1)+1
    
    switch ID {
    case 1:
        if iD1Lock == false {
            question1_1()
            iD1Lock = true
        }else{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GameOver"), object: nil)
        }
        break
    default:
        
        break
    }
}

func judge()  {
    if otherAnswer == playerDataYes && yourAnswer == 1{
        judgeValue = 1
        print("1")
    }
    else if otherAnswer == playerDataYes && yourAnswer == 0{
        if playerID == "A" {
            judgeValue = 3
            print("3")
        }else if playerID == "B" {
            judgeValue = 2
            print("2")
        }
    }
    else if otherAnswer == playerDataNo && yourAnswer == 1{
        if playerID == "A" {
            judgeValue = 2
            print("2")
        }else {
            judgeValue = 3
            print("3")
        }
    }
    else if otherAnswer == playerDataNo && yourAnswer == 0{
        judgeValue = 4
        print("4")
    }
}
