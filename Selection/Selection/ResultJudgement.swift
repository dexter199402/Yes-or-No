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
    case 1:
        if judgeValue == 1 {
            storyTextLabelText = "Ａ和Ｂ聊了很多間諜的心得，感覺旅途不那麼無聊了"
            aATK += 1; aLuck += 1;bATK += 1;bLuck += 1
            print("Ａ：ＡＴＫ＋1 ＬＵＣＫ＋1  Ｂ：ＡＴＫ＋1 ＬＵＣＫ＋1")
            goStoryView(v: vv)
        }else if judgeValue == 2{
            storyTextLabelText = "Ａ一直想找Ｂ聊天，但Ｂ完全不鳥他，Ａ感覺自己很蠢，Ｂ看Ａ一臉失望感覺到精神勝利"
            //Ａ一直想找Ｂ聊天，但Ｂ完全不鳥他，Ａ感覺自己很蠢，Ｂ看Ａ一臉失望感覺到精神勝利
            //Ａ：ＡＴＫ-1 ＬＵＣＫ-1  Ｂ：所有數值+2
        }else if judgeValue == 3{
            
        }else if judgeValue == 4{
            
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















//func question(vv:UIViewController) {
//
//    if playerID == "A" {
//        questionsLabelText = "一路上你感到氣氛有些尷尬，是否要找\(otherPlayerNameString)聊天？"
//  
//    }else if playerID == "B"{
//        questionsLabelText = "一路上你感到氣氛有些尷尬，是否要找\(otherPlayerNameString)聊天？"
//    }
//    
////    awdwdwqdad    qd
//    
//    if otherAnswer == playerDataYes && yourAnswer == 1{
//        judgeValue = 1
//        print("1")
//        if playerID == "A" {
//            questionsLabelText = "傍晚時候，走到了一個熟悉的地方，你想起以前常到這附近玩，河邊還留有以前設的陷阱，是否要將對方引導到陷阱去？"
//            aATK = aATK + 1
//            aLuck = aLuck + 1
//            
//        }else if playerID == "B"{
//            questionsLabelText = "太陽快下山前，對方強力建議要在河邊搭帳過夜，是否要答應？"
//            bATK = bATK + 1
//            bLuck = bLuck + 1
//        }
//        goStoryView(v: vv)
////    asdadawdfwaa  wdwd
//        if otherAnswer == playerDataYes && yourAnswer == 1{
//            judgeValue = 1
//            print("1")
//            
//            
//        }
//        else if otherAnswer == playerDataYes && yourAnswer == 0{
//            judgeValue = 2
//            print("2")
//            
//        }
//        else if otherAnswer == playerDataNo && yourAnswer == 1{
//            judgeValue = 3
//            print("3")
//        }
//        else if otherAnswer == playerDataNo && yourAnswer == 0{
//            judgeValue = 4
//            print("4")
//        }
//        
//        
//    }
//    else if otherAnswer == playerDataYes && yourAnswer == 0{
//        judgeValue = 2
//        print("2")
//        
//    }
//    else if otherAnswer == playerDataNo && yourAnswer == 1{
//        judgeValue = 3
//        print("3")
//    }
//    else if otherAnswer == playerDataNo && yourAnswer == 0{
//        judgeValue = 4
//        print("4")
//    }
//
//    
//    
//
//}


func goStoryView(v:UIViewController) {
    let view=v.storyboard?.instantiateViewController(withIdentifier:"StoryView")
    v.present(view!, animated: true, completion: nil)
}
















