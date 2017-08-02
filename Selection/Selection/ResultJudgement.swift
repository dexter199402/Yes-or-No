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


func result(view:UIViewController)  {
    
    if otherAnswer == playerDataYes && yourAnswer == 1{
        print("1")
        question()
    }
    else if otherAnswer == playerDataYes && yourAnswer == 0{
        print("2")
        question()
    }
    else if otherAnswer == playerDataNo && yourAnswer == 1{
        print("3")
        question()
    }
    else if otherAnswer == playerDataNo && yourAnswer == 0{
        print("4")
        question()
    }
    
    //轉到StoryView畫面
    guard let vc2 = view.storyboard?.instantiateViewController(withIdentifier: "StoryView") else {
        print("v2 is nil")
        return
    }
    view.present(vc2, animated: true, completion: nil)
}


func question() {
    
    let id = arc4random_uniform(5)
    
    switch id {
    case 0:
         questionsLabelText = "你說是我們相見恨晚～"
    case 1:
        questionsLabelText = "叔叔這裡有免費wifi，來叔叔這裡"
    case 2:
        questionsLabelText = "你他媽家裡種西瓜，他媽家裡養泥鰍"
    case 3:
        questionsLabelText = "西瓜大挖勒泥鰍肥，全家吃完死光光"
    default:
        questionsLabelText = "你媽超胖，他從台北到屏東翻個身就到了"
    }
}
