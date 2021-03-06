//
//  ResultJudgement.swift
//  Selection
//
//  Created by 陳韋傑 on 2017/7/28.
//  Copyright © 2017年 wei. All rights reserved.
//

import Foundation
import UIKit


var questionsLabelText = "這是題目"
var storyTextLabelText = "這是結果"

var statsLabelText = "這是變化"
var otherStatsLabelText = "他人變化"

var judgeValue = 0
var questionID:Float = Float()

var aCurseNumber = 5
var bCurseNumber = 5

var bloodANumber = 5
var bloodBNumber = 5


func result(vv:UIViewController)  {
    
    judge()
    
    switch questionID {
    case 1.1:
        story1_1()
        break
    case 1.2:
        story1_2()
        break
    case 1.223:
        story1_223()
        break
    case 1.214:
        story1_214()
        break
    case 1.3:
        story1_3()
        break
    case 2.1:
        story2_1()
        break
    case 2.2:
        story2_2()
        break
    case 2.3:
        story2_3()
        break
    case 2.31:
        story2_31()
        break
    case 2.34:
        story2_34()
        break
    case 3.1:
        story3_1()
        break
    case 3.2:
        story3_2()
        break
    case 3.3:
        story3_3()
        break
    case 3.4:
        story3_4()
        break
    case 3.5:
        story3_5()
        break
    case 3.11:
        story3_11()
        break
    case 20.1:
        story20_1()
        break
    case 20.11:
        story20_11()
        break
    case 20.12:
        story20_12()
        break
    case 20.13:
        story20_13()
        break
    case 21.1:
        story21_1()
        break
    case 100.1:
        story100_1()
        break
    case 100.11:
        story100_11()
        break
    case 100.12:
        story100_12()
        break
    case 100.13:
        story100_13()
        break
    case 100.14:
        story100_14()
        break
    case 101.1:
        story101_1()
        break
    case 102.1:
        story102_1()
        break
    case 50.1:
        story50_1()
        break
    case 50.113:
        story50_113()
        break
    case 50.2:
        story50_2()
        break
    case 51.1:
        story51_1()
        break
    case 52.1:
        story52_1()
        break
    case 52.2:
        story52_2()
        break
    case 52.3:
        story52_3()
        break
    case 98.1:
        story98_1()
        break
    case 99.1:
        story99_1()
        break
    case 99.2:
        goFight(v: vv)
        break
    default:
        break
    }
    
    if aCurse || bCurse || bloodA || bloodB {
        curseFunc()
    }
    
    goStoryPageView(v: vv)
}

func goStoryPageView(v:UIViewController) {
    
    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
    let view=v.storyboard?.instantiateViewController(withIdentifier:"StoryPageView")
    v.present(view!, animated: true, completion: nil)
    }
}

func goFight(v:UIViewController) {
    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
    let view=v.storyboard?.instantiateViewController(withIdentifier:"fightView")
    v.present(view!, animated: true, completion: nil)
    }
}



func curseFunc()  {
    
    if aCurse {
        if aCurseNumber > 0  {
            aCurseNumber -= 1
            abChange(aH: 0, aA: -1, aL: -1, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
        }else{
            aCurseNumber = 5
            aCurse = false
        }
    }
    
    if bCurse {
        if bCurseNumber > 0  {
            bCurseNumber -= 1
            abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: 0, bA: -1, bL: -1, bG: 0)
        }else{
            bCurseNumber = 5
            bCurse = false
        }
    }
    
    if bloodA {
        
        if bloodANumber > 0  {
            bloodANumber -= 1
            abChange(aH: -1, aA: 0, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
        }else{
            bloodANumber = 5
            bloodA = false
        }
    }
    
    if bloodB {
        
        if bloodBNumber > 0  {
            bloodBNumber -= 1
            abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: -1, bA: 0, bL: 0, bG: 0)
        }else{
            bloodBNumber = 5
            bloodB = false
        }

    }
    
    
}











