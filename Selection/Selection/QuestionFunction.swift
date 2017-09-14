//
//  QuestionFunction.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/7.
//  Copyright © 2017年 wei. All rights reserved.
//

import Foundation

var iD1Lock = false
var iD2Lock = false
var iD3Lock = false
var iD4Lock = false
var iD5Lock = false
var selectionquestionBool = false

func selectionQuestion() {
    
    let questionArray = Array(qString.components(separatedBy:"/"))
    
    if iD1Lock == false && iD2Lock == false && iD3Lock == false && iD4Lock == false && iD5Lock == false{
        iD1Lock = true
        questionSwitch(ID:Int(String(questionArray[0]))!)
    } else if iD1Lock == true && iD2Lock == false && iD3Lock == false && iD4Lock == false && iD5Lock == false {
        iD2Lock = true
        questionSwitch(ID:Int(String(questionArray[1]))!)
    } else if iD1Lock == true && iD2Lock == true && iD3Lock == false && iD4Lock == false && iD5Lock == false{
        iD3Lock = true
        questionSwitch(ID:Int(String(questionArray[2]))!)
    } else if iD1Lock == true && iD2Lock == true && iD3Lock == true && iD4Lock == false && iD5Lock == false {
        iD4Lock = true
        questionSwitch(ID:Int(String(questionArray[3]))!)
    } else if iD1Lock == true && iD2Lock == true && iD3Lock == true && iD4Lock == true && iD5Lock == false {
        iD5Lock = true
        questionSwitch(ID:Int(String(questionArray[4]))!)
    }
    selectionquestionBool = true
}

func questionSwitch(ID:Int) {
        switch ID {
        case 1:
            question1_1()
            print("選到問題1")
            break
        case 2:
            question2_1()
            print("選到問題\(ID)")
            break
        case 3:
            question3_1()
            print("選到問題\(ID)")
            break
        case 4:
            
            print("選到問題\(ID)")
            break
        case 5:
            print("選到問題\(ID)")
            break
        case 6:
            print("選到問題\(ID)")
            break
        case 7:
            print("選到問題\(ID)")
            break
        case 8:
            print("選到問題\(ID)")
            break
        case 9:
            print("選到問題\(ID)")
            break
        case 10:
            print("選到問題\(ID)")
            break
        case 20:
            question20_1()
            print("選到問題\(ID)")
            break
        case 50:
            question50_1()
            print("選到問題\(ID)")
            break
        case 51:
            question51_1()
            print("選到問題\(ID)")
            break
        case 52:
            question52_1()
            break
        case 98:
            question98_1()
            break
        case 99:
            question99_1()
            print("選到問題\(ID)")
            break
        default:
            print("這是三小\(ID)")
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
    
    if aCurse {
        abChange(aH: -1, aA: 0, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
    }else if bCurse {
        abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: -1, bA: 0, bL: 0, bG: 0)
    }
    
        
}
