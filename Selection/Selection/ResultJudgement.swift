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
var judgeValue = 0
var questionID = 0.0



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
    default:
        break
    }
    goStoryView(v: vv)
}

func goStoryView(v:UIViewController) {
    let view=v.storyboard?.instantiateViewController(withIdentifier:"StoryView")
    v.present(view!, animated: true, completion: nil)
//    let view=v.storyboard?.instantiateViewController(withIdentifier:"fightView")
//    v.present(view!, animated: true, completion: nil)
}













