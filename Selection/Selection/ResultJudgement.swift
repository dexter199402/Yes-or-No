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
var judgeValue = 0
var questionID = 0



func result(vv:UIViewController)  {
    
    judge()
    
    switch questionID {
        //ID.1
    case 1:
        if judgeValue == 1 {
            storyTextLabelText = "\(aName)和\(bName)聊了很多間諜的心得，感覺旅途不那麼無聊了"
            aATK += 1; aLuck += 1;bATK += 1;bLuck += 1
            question1()
            goStoryView(v: vv)
        }else if judgeValue == 2{
            storyTextLabelText = "\(aName)一直想找\(bName)聊天，但\(bName)完全不鳥他，\(aName)感覺自己很蠢，\(bName)看\(aName)一臉失望感覺到精神勝利"
            aATK -= 1;aLuck -= 1;bHP += 2;bATK += 2;bLuck += 2;bGold += 2;
            question1()
            goStoryView(v: vv)
        }else if judgeValue == 3{
            storyTextLabelText = "\(bName)一直想找\(aName)聊天，但\(aName)完全不鳥他，\(bName)感覺自己很蠢，\(aName)看\(bName)一臉失望感覺到精神勝利"
            aHP += 2;aATK += 2;aLuck += 2;aGold += 2;bATK -= 1;bLuck -= 1;
            question1()
            goStoryView(v: vv)
        }else if judgeValue == 4{
            storyTextLabelText = "你不甩他，他也不鳥你，一路上持續瀰漫著詭異的氣氛"
            aATK -= 1;aLuck -= 1;bATK -= 1;bLuck -= 1;
            question1()
            goStoryView(v: vv)
        }
        break
    default:
        break
    }
}



func selectionQuestion() {

}


func judge()  {
        if otherAnswer == playerDataYes && yourAnswer == 1{
            judgeValue = 1
            print("1")
        }
        else if otherAnswer == playerDataYes && yourAnswer == 0{
            judgeValue = 2
            print("2")
        }
        else if otherAnswer == playerDataNo && yourAnswer == 1{
            judgeValue = 3
            print("3")
        }
        else if otherAnswer == playerDataNo && yourAnswer == 0{
            judgeValue = 4
            print("4")
        }
}


func  question1()  {
    questionID = 1
    if playerID == "A" {
        questionsLabelText = "一路上你感到氣氛有些尷尬，是否要找\(otherPlayerNameString)聊天？"
        }else if playerID == "B"{
            questionsLabelText = "一路上你感到氣氛有些尷尬，是否要找\(otherPlayerNameString)聊天？"
        }
    
}


func goStoryView(v:UIViewController) {
    let view=v.storyboard?.instantiateViewController(withIdentifier:"StoryView")
    v.present(view!, animated: true, completion: nil)
}
















