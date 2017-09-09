//
//  ChenStory.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/7.
//  Copyright © 2017年 wei. All rights reserved.
//

import Foundation
var storyLock = false
var aCurse = false
var bCurse = false
var cityalertA = false
var cityalertB = false
var king = false
func question2_1() {
    questionID = 2.1
    backGroundImage = "2_1.jpg"
    situationViewLabelString = "你到了分岔路"
    if playerID == "A" {
        questionsLabelText = "旅途中來到了一條岔路，左邊通往一個風平浪靜的小村莊，右邊通向詭異的森林，不時傳來尖叫聲，樹上還被人寫了個慘字，是否往左邊安全的前進？"
    }else if playerID == "B"{
        questionsLabelText = "旅途中來到了一條岔路，左邊通往一個風平浪靜的小村莊，右邊通向詭異的森林，不時傳來尖叫聲，樹上還被人寫了個慘字，是否往左邊安全的前進？"
    }
}
func story2_1(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "兩人一同前往小村莊，並決定在這住一晚，然而看似和平的村莊卻有個秘密....."
            statsLabelText = ""
        }else if playerID == "B" {
            storyTextLabelText = "兩人一同前往小村莊，並決定在這住一晚，然而看似和平的村莊卻有個秘密....."
            statsLabelText = ""
        }
        //數值變化
        question2_2()
        //帶入下個問題
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)前往小村莊並決定在這住一晚，\(bName)前往森林，發現一個令人發毛的詭異祭壇，他並不想在這可怕的地方過夜，也返回了小村莊"
            statsLabelText = "\n對方\nＨＰ-1  ＡＴＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)前往小村莊並決定在這住一晚，\(bName)前往森林，發現一個令人發毛的詭異祭壇，他並不想在這可怕的地方過夜，也返回了小村莊"
            statsLabelText = "ＨＰ-1  ＡＴＫ+1\n對方\n"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: -1, bA: 1, bL: 0, bG: 0)
        storyLock = true
        question2_2()
        //下個問題
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)前往小村莊並決定在這住一晚，\(aName)前往森林，發現一個令人發毛的詭異祭壇，他並不想在這可怕的地方過夜，也返回了小村莊"
            statsLabelText = "ＨＰ-1  ＡＴＫ+1\n對方\n"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)前往小村莊並決定在這住一晚，\(aName)前往森林，發現一個令人發毛的詭異祭壇，他並不想在這可怕的地方過夜，也返回了小村莊"
            statsLabelText = "\n對方\nＨＰ-1  ＡＴＫ+1"
        }
        //數值變化
        abChange(aH: -1, aA: 1, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
        storyLock = true
        question2_2()
        //下個問題
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "兩人前往森林，發現一個令人發毛的詭異祭壇，他們並不想在這可怕的地方過夜，返回了小村莊"
            statsLabelText = "ＨＰ-1  ＡＴＫ+1\n對方\nＨＰ-1  ＡＴＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "兩人前往森林，發現一個令人發毛的詭異祭壇，他們並不想在這可怕的地方過夜，返回了小村莊"
            statsLabelText = "ＨＰ-1  ＡＴＫ+1\n對方\nＨＰ-1  ＡＴＫ+1"
        }
        //數值變化
        abChange(aH: -1, aA: 1, aL: 0, aG: 0, bH: -1, bA: 1, bL: 0, bG: 0)
        storyLock = true
        question2_2()
        //下個問題
    }
}
func question2_2() {
    questionID = 2.2
    selectionquestionBool = true
    backGroundImage = "2_2.jpg"
    situationViewLabelString = "你到了村莊"
    if playerID == "A" {
        questionsLabelText = "傍晚回到了村莊中，你發現旅館老闆的女兒非常漂亮，是否要去搭訕？"
    }else if playerID == "B"{
        questionsLabelText = "傍晚回到了村莊中，你發現旅館老闆的女兒非常漂亮，是否要去搭訕？"
    }
}
func story2_2(){
    if judgeValue == 1 {
        if playerID == "A" {
            if aHP+aATK+aLuck > bHP+bATK+bLuck {
                storyTextLabelText = "老闆的女兒在兩人中選擇了\(aName)，\(bName)幼小的心靈遭到了嚴重的打擊"
                statsLabelText = "ＨＰ+1 ＡＴＫ＋1 ＬＵＣＫ+1 ＧＯＬＤ-100\n對方\nＨＰ-2"
            }else if aHP+aATK+aLuck == bHP+bATK+bLuck{
                storyTextLabelText = "「你是個好人，但是我們不適合....」收到好人卡的Ａ和Ｂ在房間傷心痛哭了一整晚"
                statsLabelText = "ＡＴＫ-1 ＬＵＣＫ-1\n對方\nＡＴＫ-1 ＬＵＣＫ-1"
            }else{
                storyTextLabelText = "老闆的女兒在兩人中選擇了\(bName)，\(aName)幼小的心靈遭到了嚴重的打擊"
                statsLabelText = "ＨＰ-2\n對方\nＨＰ+1 ＡＴＫ＋1 ＬＵＣＫ+1 ＧＯＬＤ-100"
            }
            
        }else if playerID == "B" {
            if  aHP+aATK+aLuck > bHP+bATK+bLuck{
                storyTextLabelText = "老闆的女兒在兩人中選擇了\(aName)，\(bName)幼小的心靈遭到了嚴重的打擊"
                statsLabelText = "ＨＰ-2\n對方\nＨＰ+1 ＡＴＫ＋1 ＬＵＣＫ+1 ＧＯＬＤ-100"
            }else if aHP+aATK+aLuck == bHP+bATK+bLuck{
                storyTextLabelText = "「你是個好人，但是我們不適合....」收到好人卡的Ａ和Ｂ在房間傷心痛哭了一整晚"
                statsLabelText = "ＡＴＫ-1 ＬＵＣＫ-1\n對方\nＡＴＫ-1 ＬＵＣＫ-1"
            }else{
                storyTextLabelText = "老闆的女兒在兩人中選擇了\(bName)，\(aName)幼小的心靈遭到了嚴重的打擊"
                statsLabelText = "ＨＰ+1 ＡＴＫ＋1 ＬＵＣＫ+1 ＧＯＬＤ-100\n對方\nＨＰ-2"
            }
        }
        //數值變化
        if aHP+aATK+aLuck > bHP+bATK+bLuck {
            abChange(aH: 1, aA: 1, aL: 1, aG: -100, bH: -2, bA: 0, bL: 0, bG: 0)
            question2_3()
        }else if aHP+aATK+aLuck == bHP+bATK+bLuck{
            abChange(aH: 0, aA: -1, aL: -1, aG: 0, bH: 0, bA: -1, bL: -1, bG: 0)
            question2_3()
        }else{
            abChange(aH: -2, aA: 0, aL: 0, aG: 0, bH: 1, bA: 1, bL: 1, bG: -100)
            question2_3()
        }
        //帶入下個問題
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)與老闆的女兒聊得很開心，\(bName)各種羨慕嫉妒恨的看著\(aName)，同時雙手得到了強化"
            statsLabelText = "ＨＰ+1 ＡＴＫ＋1 ＬＵＣＫ+1 ＧＯＬＤ-100\n對方\nＨＰ-1 ＡＴＫ+3"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)與老闆的女兒聊得很開心，\(bName)各種羨慕嫉妒恨的看著\(aName)，同時雙手得到了強化"
            statsLabelText = "ＨＰ-1 ＡＴＫ+3\n對方\nＨＰ+1 ＡＴＫ＋1 ＬＵＣＫ+1 ＧＯＬＤ-100"
        }
        //數值變化
        abChange(aH: 1, aA: 1, aL: 1, aG: -100, bH: -1, bA: 3, bL: 0, bG: 0)
        question2_3()
        //下個問題
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)與老闆的女兒聊得很開心，\(aName)各種羨慕嫉妒恨的看著\(bName)，同時雙手得到了強化"
            statsLabelText = "ＨＰ-1 ＡＴＫ+3\n對方\nＨＰ+1 ＡＴＫ＋1 ＬＵＣＫ+1 ＧＯＬＤ-100"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)與老闆的女兒聊得很開心，\(aName)各種羨慕嫉妒恨的看著\(bName)，同時雙手得到了強化"
            statsLabelText = "ＨＰ+1 ＡＴＫ＋1 ＬＵＣＫ+1 ＧＯＬＤ-100\n對方\nＨＰ-1 ＡＴＫ+3"
        }
        //數值變化
        abChange(aH: -1, aA: 3, aL: 0, aG: 0, bH: 1, bA: 1, bL: 1, bG: -100)
        question2_3()
        //下個問題
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)沒有膽子去搭訕，只能在房間默默地強化自己的雙手"
            statsLabelText = "ＨＰ-1  ＡＴＫ+3 ＬＵＣＫ-1\n對方\nＨＰ-1  ＡＴＫ+3 ＬＵＣＫ-1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)沒有膽子去搭訕，只能在房間默默地強化自己的雙手"
            statsLabelText = "ＨＰ-1  ＡＴＫ+3 ＬＵＣＫ-1\n對方\nＨＰ-1  ＡＴＫ+3 ＬＵＣＫ-1"
        }
        //數值變化
        abChange(aH: -1, aA: 3, aL: -1, aG: 0, bH: -1, bA: 3, bL: -1, bG: 0)
        question2_3()
        //下個問題
    }
}
func question2_3() {
    questionID = 2.3
    if playerID == "A" {
        questionsLabelText = "晚上睡到一半，不知為何突然遭到村民的攻擊，只能選擇反擊或逃跑了，是否要跟他們拼命？"
    }else if playerID == "B"{
        questionsLabelText = "晚上睡到一半，不知為何突然遭到村民的攻擊，只能選擇反擊或逃跑了，是否要跟他們拼命？"
    }
}
func story2_3(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)合力打倒了攻擊的村民，從他們口中得知，旁邊的森林必須定時獻祭活祭品，否則村子會有報應，知道此事的兩人，不能坐視不管，決定到森林中一探究竟"
            statsLabelText = "ＨＰ-2 ＡＴＫ+2\n對方\nＨＰ-2 ＡＴＫ+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)合力打倒了攻擊的村民，從他們口中得知，旁邊的森林必須定時獻祭活祭品，否則村子會有報應，知道此事的兩人，不能坐視不管，決定到森林中一探究竟"
            statsLabelText = "ＨＰ-2 ＡＴＫ+2\n對方\nＨＰ-2 ＡＴＫ+2"
        }
        //數值變化
        abChange(aH: -2, aA: 2, aL: 0, aG: 0, bH: -2, bA: 2, bL: 0, bG: 0)
        question2_31()
        //帶入下個問題
    }else if judgeValue == 2{
        if playerID == "A" {
            if aATK >= 12{
                storyTextLabelText = "\(bName)一看情況不對，隨身物品都沒拿拔腿就跑，留下\(aName)獨自抵抗，後來\(aName)成功打倒了村民，從他們口中得知，旁邊的森林必須定時獻祭活祭品，否則村子會有報應，但因為和間諜任務無關，\(aName)不管他們也離開了村莊"
                statsLabelText = "ＨＰ-1 ＡＴＫ+2\n對方\nＨＰ-1 ＡＴＫ-2 ＬＵＣＫ-1 ＧＯＬＤ=0"
            }else{
                storyTextLabelText = "\(bName)一看情況不對，拔腿就跑，留下\(aName)獨自抵抗村民，而\(aName)招架不住，用了最後一絲力氣才勉強掙脫，兩人隨身物品都沒拿，就連夜逃離了這個地方"
                statsLabelText = "ＨＰ-6  ＧＯＬＤ=0\n對方\nＧＯＬＤ=0"
            }
            
        }else if playerID == "B" {
            if aATK >= 12{
                storyTextLabelText = "\(bName)一看情況不對，隨身物品都沒拿拔腿就跑，留下\(aName)獨自抵抗，後來\(aName)成功打倒了村民，從他們口中得知，旁邊的森林必須定時獻祭活祭品，否則村子會有報應，但因為和間諜任務無關，\(aName)不管他們也離開了村莊"
                statsLabelText = "ＨＰ-1 ＡＴＫ-2 ＬＵＣＫ-1 ＧＯＬＤ=0\n對方\nＨＰ-1 ＡＴＫ+2"
            }else{
                storyTextLabelText = "\(bName)一看情況不對，拔腿就跑，留下\(aName)獨自抵抗村民，而\(aName)招架不住，用了最後一絲力氣才勉強掙脫，兩人隨身物品都沒拿，就連夜逃離了這個地方"
                statsLabelText = "ＧＯＬＤ=0\n對方\nＨＰ-6  ＧＯＬＤ=0"
            }
            
        }
        //數值變化
        if aATK >= 12{
            abChange(aH: -1, aA: 2, aL: 0, aG: 0, bH: -1, bA: -2, bL: -1, bG: -bGold)
            selectionQuestion()
        }else{
            abChange(aH: -6, aA: 0, aL: 0, aG: -aGold, bH: 0, bA: -0, bL: -0, bG: -bGold)
            selectionQuestion()
        }
        //下個問題
    }else if judgeValue == 3{
        if playerID == "A" {
            if bATK >= 12 {
                storyTextLabelText = "\(aName)一看情況不對，隨身物品都沒拿拔腿就跑，留下\(bName)獨自抵抗，後來\(bName)成功打倒了村民，從他們口中得知，旁邊的森林必須定時獻祭活祭品，否則村子會有報應，但因為和間諜任務無關，\(bName)不管他們也離開了村莊"
                statsLabelText = "ＨＰ-1 ＡＴＫ-2 ＬＵＣＫ-1 ＧＯＬＤ=0\n對方\nＨＰ-1 ＡＴＫ+2"
            }else{
                storyTextLabelText = "\(aName)一看情況不對，拔腿就跑，留下\(bName)獨自抵抗村民，而\(bName)招架不住，用了最後一絲力氣才勉強掙脫，兩人隨身物品都沒拿，就連夜逃離了這個地方"
                statsLabelText = "ＧＯＬＤ=0\n對方\nＨＰ-6 ＧＯＬＤ=0"
            }
            
        }else if playerID == "B" {
            if bATK >= 12{
                storyTextLabelText = "\(aName)一看情況不對，隨身物品都沒拿拔腿就跑，留下\(bName)獨自抵抗，後來\(bName)成功打倒了村民，從他們口中得知，旁邊的森林必須定時獻祭活祭品，否則村子會有報應，但因為和間諜任務無關，\(bName)不管他們也離開了村莊"
                statsLabelText = "ＨＰ-1 ＡＴＫ+2\n對方\nＨＰ-1 ＡＴＫ-2 ＬＵＣＫ-1 ＧＯＬＤ=0"
            }else{
                storyTextLabelText = "\(aName)一看情況不對，拔腿就跑，留下\(bName)獨自抵抗村民，而\(bName)招架不住，用了最後一絲力氣才勉強掙脫，兩人隨身物品都沒拿，就連夜逃離了這個地方"
                statsLabelText = "ＨＰ-6 ＧＯＬＤ=0\n對方\nＧＯＬＤ=0"
            }
            
        }
        //數值變化
        if bATK >= 12{
            abChange(aH: -1, aA: -2, aL: -1, aG: -aGold, bH: -1, bA: 2, bL: 0, bG: 0)
            selectionQuestion()
        }else{
            abChange(aH: 0, aA: 0, aL: 0, aG: -aGold, bH: -6, bA: 0, bL: 0, bG: -bGold)
            selectionQuestion()
        }
        //下個問題
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)與\(bName)頭也不回的跑了，但很快就遭到村民包圍，村民們把他們綁起來，丟進了森林"
            statsLabelText = "ＨＰ-2  ＬＵＣＫ-2  ＧＯＬＤ=0\n對方\nＨＰ-2  ＬＵＣＫ-2  ＧＯＬＤ=0"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)與\(bName)頭也不回的跑了，但很快就遭到村民包圍，村民們把他們綁起來，丟進了森林"
            statsLabelText = "ＨＰ-2  ＬＵＣＫ-2  ＧＯＬＤ=0\n對方\nＨＰ-2  ＬＵＣＫ-2  ＧＯＬＤ=0"
        }
        //數值變化
        abChange(aH: -2, aA: 2, aL: 0, aG: 0, bH: -2, bA: 2, bL: 0, bG: 0)
        question2_34()
        //下個問題
    }
}
func question2_31() {
    questionID = 2.31
    backGroundImage = "2_31.jpg"
    situationViewLabelString = "你到了森林"
    selectionquestionBool = true
    if storyLock == true {
        if playerID == "A" {
            questionsLabelText = "來到森林裡的祭壇，上面供奉著奇奇怪怪的頭骨及液體，是否要不顧一切把祭壇砸爛？"
        }else if playerID == "B"{
            questionsLabelText = "來到森林裡的祭壇，上面供奉著奇奇怪怪的頭骨及液體，是否要不顧一切把祭壇砸爛？"
        }
    }else{
        if playerID == "A" {
            questionsLabelText = "進入森林，兩人很快就迷了路，是否還要繼續前進？"
        }else if playerID == "B"{
            questionsLabelText = "進入森林，兩人很快就迷了路，是否還要繼續前進？"
        }
    }
}
func story2_31(){
    if storyLock == true {
        if judgeValue == 1 {
            if playerID == "A" {
                storyTextLabelText = "\(aName)和\(bName)同時一砸，祭壇被摧毀，陰氣瞬間消失，森林恢復了原樣，村民們高興地把兩人拋在空中，並送了兩人許多金幣"
                statsLabelText = "ＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  ＧＯＬＤ+300\n對方\nＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  ＧＯＬＤ+300"
            }else if playerID == "B" {
                storyTextLabelText = "\(aName)和\(bName)同時一砸，祭壇被摧毀，陰氣瞬間消失，森林恢復了原樣，村民們高興地把兩人拋在空中，並送了兩人許多金幣"
                statsLabelText = "ＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  ＧＯＬＤ+300\n對方\nＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  ＧＯＬＤ+300"
            }
            //數值變化
            abChange(aH: 1, aA: 1, aL: 1, aG: 300, bH: 1, bA: 1, bL: 1, bG: 300)
            selectionQuestion()
            //帶入下個問題
        }else if judgeValue == 2{
            if playerID == "A" {
                storyTextLabelText = "\(aName)舉起石頭砸向祭壇，但\(bName)卻只在旁邊看著，祭壇因此沒有被摧毀，突然間祭壇竄出一團黑霧進入\(aName)的體內，他吸收了奇怪的霧氣後，森林的陰氣瞬間消失，恢復了原樣，村民們高興地把兩人拋在空中，並送了兩人許多金幣"
                statsLabelText = "ＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  ＧＯＬＤ+300  受到詛咒\n對方\nＧＯＬＤ+300"
            }else if playerID == "B" {
                storyTextLabelText = "\(aName)舉起石頭砸向祭壇，但\(bName)卻只在旁邊看著，祭壇因此沒有被摧毀，突然間祭壇竄出一團黑霧進入\(aName)的體內，他吸收了奇怪的霧氣後，森林的陰氣瞬間消失，恢復了原樣，村民們高興地把兩人拋在空中，並送了兩人許多金幣"
                statsLabelText = "ＧＯＬＤ+300\n對方\nＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  ＧＯＬＤ+300  受到詛咒"
            }
            aCurse = true
            //數值變化
            abChange(aH: 1, aA: 1, aL: 1, aG: 300, bH: 0, bA: 0, bL: 0, bG: 300)
            selectionQuestion()
            //下個問題
        }else if judgeValue == 3{
            if playerID == "A" {
                storyTextLabelText = "\(bName)舉起石頭砸向祭壇，但\(aName)卻只在旁邊看著，祭壇因此沒有被摧毀，突然間祭壇竄出一團黑霧進入\(bName)的體內，他吸收了奇怪的霧氣後，森林的陰氣瞬間消失，恢復了原樣，村民們高興地把兩人拋在空中，並送了兩人許多金幣"
                statsLabelText = "ＧＯＬＤ+300\n對方\nＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  ＧＯＬＤ+300  受到詛咒"
            }else if playerID == "B" {
                storyTextLabelText = "\(bName)舉起石頭砸向祭壇，但\(aName)卻只在旁邊看著，祭壇因此沒有被摧毀，突然間祭壇竄出一團黑霧進入\(bName)的體內，他吸收了奇怪的霧氣後，森林的陰氣瞬間消失，恢復了原樣，村民們高興地把兩人拋在空中，並送了兩人許多金幣"
                statsLabelText = "ＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  ＧＯＬＤ+300  受到詛咒\n對方\nＧＯＬＤ+300"
            }
            bCurse = true
            //數值變化
            abChange(aH: 0, aA: 0, aL: 0, aG: 300, bH: 1, bA: 1, bL: 1, bG: 300)
            selectionQuestion()
            //下個問題
        }else if judgeValue == 4{
            if playerID == "A" {
                storyTextLabelText = "看著詭異的祭壇，兩個人都沒有動作，突然祭壇發出了一個怪聲，兩人被嚇的什麼也不管了，直接逃離了這個區域"
                statsLabelText = "ＨＰ-3\n對方\nＨＰ-3"
            }else if playerID == "B" {
                storyTextLabelText = "看著詭異的祭壇，兩個人都沒有動作，突然祭壇發出了一個怪聲，兩人被嚇的什麼也不管了，直接逃離了這個區域"
                statsLabelText = "ＨＰ-3\n對方\nＨＰ-3"
            }
            //數值變化
            abChange(aH: -3, aA: 0, aL: 0, aG: 0, bH: -3, bA: 0, bL: 0, bG: 0)
            selectionQuestion()
            //下個問題
        }
    }else{
        if judgeValue == 1 {
            if playerID == "A" {
                storyTextLabelText = "\(aName)和\(bName)都決心繼續前進，但森林霧氣太濃無法判斷方向，走著走著竟然從另一頭走出了森林，兩人感到辜負村民的期待，就直接離開了"
                statsLabelText = "ＨＰ-1\n對方\nＨＰ-1"
            }else if playerID == "B" {
                storyTextLabelText = "\(aName)和\(bName)都決心繼續前進，但森林霧氣太濃無法判斷方向，走著走著竟然從另一頭走出了森林，兩人感到辜負村民的期待，就直接離開了"
                statsLabelText = "ＨＰ-1\n對方\nＨＰ-1"
            }
            //數值變化
            abChange(aH: -1, aA: 0, aL: 0, aG: 0, bH: -1, bA: 0, bL: 0, bG: 0)
            selectionQuestion()
            //帶入下個問題
        }else if judgeValue == 2{
            if playerID == "A" {
                storyTextLabelText = "\(aName)和\(bName)意見不統一，更加找不到正確的路，在這詭異的地方瞎轉了十幾個小時後，才終於從另一頭離開了森林"
                statsLabelText = "ＨＰ-3  ＡＴＫ-1  ＬＵＣＫ-1\n對方\nＨＰ-3  ＡＴＫ-1  ＬＵＣＫ-1"
            }else if playerID == "B" {
                storyTextLabelText = "\(aName)和\(bName)意見不統一，更加找不到正確的路，在這詭異的地方瞎轉了十幾個小時後，才終於從另一頭離開了森林"
                statsLabelText = "ＨＰ-3  ＡＴＫ-1  ＬＵＣＫ-1\n對方\nＨＰ-3  ＡＴＫ-1  ＬＵＣＫ-1"
            }
            //數值變化
            abChange(aH: -3, aA: -1, aL: -1, aG: 0, bH: -3, bA: -1, bL: -1, bG: 0)
            selectionQuestion()
            //下個問題
        }else if judgeValue == 3{
            if playerID == "A" {
                storyTextLabelText = "\(aName)和\(bName)意見不統一，更加找不到正確的路，在這詭異的地方瞎轉了十幾個小時後，才終於從另一頭離開了森林"
                statsLabelText = "ＨＰ-3  ＡＴＫ-1  ＬＵＣＫ-1\n對方\nＨＰ-3  ＡＴＫ-1  ＬＵＣＫ-1"
            }else if playerID == "B" {
                storyTextLabelText = "\(aName)和\(bName)意見不統一，更加找不到正確的路，在這詭異的地方瞎轉了十幾個小時後，才終於從另一頭離開了森林"
                statsLabelText = "ＨＰ-3  ＡＴＫ-1  ＬＵＣＫ-1\n對方\nＨＰ-3  ＡＴＫ-1  ＬＵＣＫ-1"
            }
            //數值變化
            abChange(aH: -3, aA: -1, aL: -1, aG: 0, bH: -3, bA: -1, bL: -1, bG: 0)
            selectionQuestion()
            //下個問題
        }else if judgeValue == 4{
            if playerID == "A" {
                storyTextLabelText = "平時意見總是分歧的\(aName)和\(bName)，這次倒是很統一，那就是趕快逃離著個鬼地方，他們連滾帶爬，幾個小時後從另一頭離開了森林"
                statsLabelText = "ＨＰ-2\n對方\nＨＰ-2"
            }else if playerID == "B" {
                storyTextLabelText = "平時意見總是分歧的\(aName)和\(bName)，這次倒是很統一，那就是趕快逃離著個鬼地方，他們連滾帶爬，幾個小時後從另一頭離開了森林"
                statsLabelText = "ＨＰ-2\n對方\nＨＰ-2"
            }
            //數值變化
            abChange(aH: -2, aA: 0, aL: 0, aG: 0, bH: -2, bA: 0, bL: 0, bG: 0)
            selectionQuestion()
            //下個問題
        }
        
        
    }
}
func question2_34() {
    questionID = 2.34
    backGroundImage = "2_31.jpg"
    selectionquestionBool = true
    if playerID == "A" {
        questionsLabelText = "兩人互相解開對方的繩子，發現正在一座詭異的祭壇前，上面供奉著奇奇怪怪的頭骨及液體，是否要不顧一切把祭壇砸爛？"
    }else if playerID == "B"{
        questionsLabelText = "兩人互相解開對方的繩子，發現正在一座詭異的祭壇前，上面供奉著奇奇怪怪的頭骨及液體，是否要不顧一切把祭壇砸爛？"
    }
}
func story2_34(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)同時一砸，祭壇被摧毀，陰氣瞬間消失，森林恢復了原樣，原來這個祭壇就是一切怪異的源頭，他們回到村子，從村民口中得知，之前祭壇必須定時獻祭活祭品，否則村子會有報應，為了表達歉意及感謝他們摧毀祭壇，送給兩人村子裡所有的金幣"
            statsLabelText = "\n對方\n"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)同時一砸，祭壇被摧毀，陰氣瞬間消失，森林恢復了原樣，原來這個祭壇就是一切怪異的源頭，他們回到村子，從村民口中得知，之前祭壇必須定時獻祭活祭品，否則村子會有報應，為了表達歉意及感謝他們摧毀祭壇，送給兩人村子裡所有的金幣"
            statsLabelText = "ＨＰ+3  ＡＴＫ+3 ＧＯＬＤ+600\n對方\nＨＰ+3  ＡＴＫ+3 ＧＯＬＤ+600"
        }
        //數值變化
        abChange(aH: 3, aA: 3, aL: 0, aG: 600, bH: 3, bA: 3, bL: 0, bG: 600)
        selectionQuestion()
        //帶入下個問題
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)舉起石頭砸向祭壇，但\(bName)卻只在旁邊看著，祭壇因此沒有被摧毀，突然間祭壇竄出一團黑霧進入\(aName)的體內，他吸收了奇怪的霧氣後，森林的陰氣瞬間消失，恢復了原樣，兩人也離開了這個區域"
            statsLabelText = "ＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  受到詛咒\n對方\nＡＴＫ-1"
            
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)舉起石頭砸向祭壇，但\(bName)卻只在旁邊看著，祭壇因此沒有被摧毀，突然間祭壇竄出一團黑霧進入\(aName)的體內，他吸收了奇怪的霧氣後，森林的陰氣瞬間消失，恢復了原樣，兩人也離開了這個區域"
            statsLabelText = "ＡＴＫ-1\n對方\nＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  受到詛咒"
        }
        aCurse = true
        //數值變化
        abChange(aH: 1, aA: 1, aL: 1, aG: 0, bH: 0, bA: -1, bL: 0, bG: 0)
        selectionQuestion()
        //下個問題
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)舉起石頭砸向祭壇，但\(aName)卻只在旁邊看著，祭壇因此沒有被摧毀，突然間祭壇竄出一團黑霧進入\(bName)的體內，他吸收了奇怪的霧氣後，森林的陰氣瞬間消失，恢復了原樣，兩人也離開了這個區域"
            
            statsLabelText = "ＡＴＫ-1\n對方\nＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  受到詛咒"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)舉起石頭砸向祭壇，但\(aName)卻只在旁邊看著，祭壇因此沒有被摧毀，突然間祭壇竄出一團黑霧進入\(bName)的體內，他吸收了奇怪的霧氣後，森林的陰氣瞬間消失，恢復了原樣，兩人也離開了這個區域"
            statsLabelText = "ＨＰ+1  ＡＴＫ+1  ＬＵＣＫ+1  受到詛咒\n對方\nＡＴＫ-1"
        }
        bCurse = true
        //數值變化
        abChange(aH: -1, aA: 0, aL: 0, aG: 0, bH: 1, bA: 1, bL: 1, bG: 0)
        selectionQuestion()
        //下個問題
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "繩子已經解開了，何必再自找麻煩呢？兩人頭也不回的逃離這個區域"
            statsLabelText = "ＨＰ-1 ＡＴＫ-1 ＬＵＣＫ+1\n對方\nＨＰ-1 ＡＴＫ-1 ＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "繩子已經解開了，何必再自找麻煩呢？兩人頭也不回的逃離這個區域"
            statsLabelText = "ＨＰ-1 ＡＴＫ-1 ＬＵＣＫ+1\n對方\nＨＰ-1 ＡＴＫ-1 ＬＵＣＫ+1"
        }
        //數值變化
        abChange(aH: -1, aA: -1, aL: 1, aG: 0, bH: -1, bA: -1, bL: 1, bG: 0)
        selectionQuestion()
        //下個問題
    }
}



func question3_1() {
    questionID = 3.1
    backGroundImage = "road.jpg"
    situationViewLabelString = "你到了路上"
    selectionquestionBool = true
    if playerID == "A" {
        questionsLabelText = "走著走著看到一群Ｃ國的巡邏士兵迎面走來，是否要繞遠路避開？"
    }else if playerID == "B"{
        questionsLabelText = "走著走著看到一群Ｃ國的巡邏士兵迎面走來，是否要繞遠路避開？"
    }
}
func story3_1(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "那群士兵看到你們鬼鬼祟祟的行為馬上追了上來，\(aName)和\(bName)決定跑給他們追"
            statsLabelText = "ＨＰ-2 ＬＵＣＫ-1\n對方\nＨＰ-2 ＬＵＣＫ-1"
        }else if playerID == "B" {
            storyTextLabelText = "那群士兵看到你們鬼鬼祟祟的行為馬上追了上來，\(aName)和\(bName)決定跑給他們追"
            statsLabelText = "ＨＰ-2 ＬＵＣＫ-1\n對方\nＨＰ-2 ＬＵＣＫ-1"
        }
        //數值變化
        abChange(aH: -1, aA: 0, aL: -1, aG: 0, bH: -1, bA: 0, bL: -1, bG: 0)
        //帶入下個問題
        question3_11()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)想跑，但\(bName)拒絕逃走，意見不統一的他們要想別的方法通過"
            statsLabelText = "ＡＴＫ-2\n對方\n"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)想跑，但\(bName)拒絕逃走，意見不統一的他們要想別的方法通過"
            statsLabelText = "\n對方\nＡＴＫ-2"
        }
        //數值變化
        abChange(aH: 0, aA: -2, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
        //下個問題
        question3_2()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)想跑，但\(aName)拒絕逃走，意見不統一的他們要想別的方法通過"
            statsLabelText = "\n對方\nＡＴＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)想跑，但\(aName)拒絕逃走，意見不統一的他們要想別的方法通過"
            statsLabelText = "ＡＴＫ-2\n對方\n"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: 0, bA: -2, bL: 0, bG: 0)
        //下個問題
        question3_2()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)認為逃跑不符合我們高大威猛的形象，他們要想別的方法通過"
            statsLabelText = "ＡＴＫ+1 ＬＵＣＫ+1\n對方\nＡＴＫ+1 ＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)認為逃跑不符合我們高大威猛的形象，他們要想別的方法通過"
            statsLabelText = "ＡＴＫ+1 ＬＵＣＫ+1\n對方\nＡＴＫ+1 ＬＵＣＫ+1"
        }
        //數值變化
        abChange(aH: 0, aA: 1, aL: 1, aG: 0, bH: 0, bA: 1, bL: 1, bG: 0)
        //下個問題
        question3_2()
    }
}

func question3_2() {
    questionID = 3.2
    if playerID == "A" {
        questionsLabelText = "前方迎面走來一群Ｃ國的巡邏士兵，是否要先下手為強，跟他們拼了？"
    }else if playerID == "B"{
        questionsLabelText = "前方迎面走來一群Ｃ國的巡邏士兵，是否要先下手為強，跟他們拼了？"
    }
}
func story3_2(){
    if judgeValue == 1 {
        if aATK + bATK >= 23 {
            if playerID == "A" {
                storyTextLabelText = "\(aName)和\(bName)選擇開打，輕輕鬆鬆搞定了士兵，不過巡邏兵被襲擊的事傳開後，Ｃ國的戒備上升了一些"
                statsLabelText = "ＡＴＫ+2 ＧＯＬＤ+100 跟蹤狀態\n對方\nＡＴＫ+2 ＧＯＬＤ+100 跟蹤狀態"
            }else if playerID == "B" {
                storyTextLabelText = "\(aName)和\(bName)選擇開打，輕輕鬆鬆搞定了士兵，不過巡邏兵被襲擊的事傳開後，Ｃ國的戒備上升了一些"
                statsLabelText = "ＡＴＫ+2 ＧＯＬＤ+100 跟蹤狀態\n對方\nＡＴＫ+2 ＧＯＬＤ+100 跟蹤狀態"
            }
            //數值變化
            abChange(aH: 0, aA: 2, aL: 0, aG: 100, bH: 0, bA: 2, bL: 0, bG: 100)
            cityalertA = true
            cityalertB = true
            //帶入下個問題
            selectionQuestion()
        }else{
            if playerID == "A" {
                storyTextLabelText = "\(aName)和\(bName)實在太弱了，連巡邏士兵都打不過，兩人被以暴徒名義抓了起來，丟進了附近的監獄中"
                statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
            }else if playerID == "B" {
                storyTextLabelText = "\(aName)和\(bName)實在太弱了，連巡邏士兵都打不過，兩人被以暴徒名義抓了起來，丟進了附近的監獄中"
                statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
            }
            //數值變化
            abChange(aH: -(aHP-1), aA: -2, aL: 0, aG: 0, bH: -(bHP-1), bA: -2, bL: 0, bG: 0)
            //帶入下個問題
            question100_1()
        }
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)準備戰鬥，但\(bName)已經嚇尿了拒絕戰鬥，你們必須想別的方法通過"
            statsLabelText = "\n對方\nＨＰ-2 ＡＴＫ-1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)準備戰鬥，但\(bName)已經嚇尿了拒絕戰鬥，你們必須想別的方法通過"
            statsLabelText = "ＨＰ-2 ＡＴＫ-1\n對方\n"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: -2, bA: -1, bL: 0, bG: 0)
        //下個問題
        question3_3()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)準備戰鬥，但\(aName)已經嚇尿了拒絕戰鬥，你們必須想別的方法通過"
            statsLabelText = "ＨＰ-2 ＡＴＫ-1\n對方\n"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)準備戰鬥，但\(aName)已經嚇尿了拒絕戰鬥，你們必須想別的方法通過"
            statsLabelText = "\n對方\nＨＰ-2 ＡＴＫ-1"
        }
        //數值變化
        abChange(aH: -2, aA: -1, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
        //下個問題
        question3_3()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)很有自知之明，不去招惹士兵們，並想別的方法通過"
            statsLabelText = "ＨＰ+1 ＬＵＣＫ+1\n對方\nＨＰ+1 ＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)很有自知之明，不去招惹士兵們，並想別的方法通過"
            statsLabelText = "ＨＰ+1 ＬＵＣＫ+1\n對方\nＨＰ+1 ＬＵＣＫ+1"
        }
        //數值變化
        abChange(aH: 1, aA: 0, aL: 1, aG: 0, bH: 1, bA: 0, bL: 1, bG: 0)
        //下個問題
        question3_3()
    }
}

func question3_3() {
    questionID = 3.3
    if playerID == "A" {
        questionsLabelText = "前方迎面走來一群Ｃ國的巡邏士兵，是否要假裝沒事通過他們身旁？"
    }else if playerID == "B"{
        questionsLabelText = "前方迎面走來一群Ｃ國的巡邏士兵，是否要假裝沒事通過他們身旁？"
    }
}
func story3_3(){
    if judgeValue == 1 {
        if aLuck + bLuck >= 24{
            if playerID == "A" {
                storyTextLabelText = "跟士兵擦身而過時，\(aName)和\(bName)隱藏住了自己的霸氣，帶頭的士兵看了他們一眼就離開了"
                statsLabelText = "ＨＰ+2\n對方\nＨＰ+2"
            }else if playerID == "B" {
                storyTextLabelText = "跟士兵擦身而過時，\(aName)和\(bName)隱藏住了自己的霸氣，帶頭的士兵看了他們一眼就離開了"
                statsLabelText = "ＨＰ+2\n對方\nＨＰ+2"
            }
            //數值變化
            abChange(aH: 2, aA: 0, aL: 0, aG: 0, bH: 2, bA: 0, bL: 0, bG: 0)
            //帶入下個問題
            selectionQuestion()
        }else{
            
            if playerID == "A" {
                storyTextLabelText = "跟士兵擦身而過時，\(aName)和\(bName)隱藏不住自己的霸氣，帶頭的士兵感應到他們是危險人物，將他們抓了起來，丟進了附近的監獄中"
                statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
            }else if playerID == "B" {
                storyTextLabelText = "跟士兵擦身而過時，\(aName)和\(bName)隱藏不住自己的霸氣，帶頭的士兵感應到他們是危險人物，將他們抓了起來，丟進了附近的監獄中"
                statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
            }
            abChange(aH: -(aHP-1), aA: -2, aL: 0, aG: 0, bH: -(bHP-1), bA: -2, bL: 0, bG: 0)
            question100_1()
        }
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)想發揮他的奧斯卡演技瞞過去，但\(bName)拒絕裝傻通過，必須要想別的方法通過"
            statsLabelText = "\n對方\nＬＵＣＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)想發揮他的奧斯卡演技瞞過去，但\(bName)拒絕裝傻通過，必須要想別的方法通過"
            statsLabelText = "ＬＵＣＫ-2\n對方\n"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: 0, bA: 0, bL: -2, bG: 0)
        //下個問題
        question3_4()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)想發揮他的奧斯卡演技瞞過去，但\(aName)拒絕裝傻通過，必須要想別的方法通過"
            statsLabelText = "ＬＵＣＫ-2\n對方\n"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)想發揮他的奧斯卡演技瞞過去，但\(aName)拒絕裝傻通過，必須要想別的方法通過"
            statsLabelText = "\n對方\nＬＵＣＫ-2"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: -2, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
        //下個問題
        question3_4()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)覺得裝傻通過一定會被發現，必須要想別的方法通過"
            statsLabelText = "\n對方\n"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)覺得裝傻通過一定會被發現，必須要想別的方法通過"
            statsLabelText = "\n對方\n"
        }
        //數值變化
        //下個問題
        question3_4()
    }
}
func question3_4() {
    questionID = 3.4
    if playerID == "A" {
        questionsLabelText = "前方迎面走來一群Ｃ國的巡邏士兵，是否要利用這個機會陷害Ｂ？"
    }else if playerID == "B"{
        questionsLabelText = "前方迎面走來一群Ｃ國的巡邏士兵，是否要利用這個機會陷害Ｂ？"
    }
}
func story3_4(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "當巡邏士兵接近時，\(aName)和\(bName)互相指著對方大叫：“警察叔叔 就是這個人！”，士兵們立馬把這兩個可疑的傢伙抓了起來，丟進了附近的監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "當巡邏士兵接近時，\(aName)和\(bName)互相指著對方大叫：“警察叔叔 就是這個人！”，士兵們立馬把這兩個可疑的傢伙抓了起來，丟進了附近的監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
        }
        //數值變化
        abChange(aH: -(aHP-1), aA: -2, aL: 0, aG: 0, bH: -(bHP-1), bA: -2, bL: 0, bG: 0)
        //帶入下個問題
        question100_1()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "當巡邏士兵接近時，\(aName)突然舉起\(bName)的手大叫：“警察叔叔 就是這個人！”，士兵們立馬把\(bName)抓了起來，丟進了附近的監獄"
            statsLabelText = "ＡＴＫ+1 ＬＵＣＫ+1\n對方\nＨＰ=1 ＡＴＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "當巡邏士兵接近時，\(aName)突然舉起\(bName)的手大叫：“警察叔叔 就是這個人！”，士兵們立馬把\(bName)抓了起來，丟進了附近的監獄"
            statsLabelText = "ＡＴＫ+1 ＬＵＣＫ+1\n對方\nＨＰ=1 ＡＴＫ-2"
        }
        //數值變化
        abChange(aH: 0, aA: 1, aL: 1, aG: 0, bH: -(bHP-1), bA: -2, bL: 0, bG: 0)
        //下個問題
        question102_1()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "當巡邏士兵接近時，\(bName)突然舉起\(aName)的手大叫：“警察叔叔 就是這個人！”，士兵們立馬把\(aName)抓了起來，丟進了附近的監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＡＴＫ+1 ＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "當巡邏士兵接近時，\(bName)突然舉起\(aName)的手大叫：“警察叔叔 就是這個人！”，士兵們立馬把\(aName)抓了起來，丟進了附近的監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＡＴＫ+1 ＬＵＣＫ+1"
        }
        //數值變化
        abChange(aH: -(aHP-1), aA: -2, aL: 0, aG: 0, bH: 0, bA: 1, bL: 1, bG: 0)
        //下個問題
        question101_1()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)身為有品的紳士，絕對不會做出這種出賣同伴的事，必須要想別的方法通過"
            statsLabelText = "\n對方\n"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)身為有品的紳士，絕對不會做出這種出賣同伴的事，必須要想別的方法通過"
            statsLabelText = "ＬＵＣＫ+1\n對方\nＬＵＣＫ+1"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: 1, aG: 0, bH: 0, bA: 0, bL: 1, bG: 0)
        //下個問題
        question3_5()
    }
}
func question3_5() {
    questionID = 3.5
    if playerID == "A" {
        questionsLabelText = "怎麼樣都不能跟\(bName)討論出一個辦法通過，還要再跟他爭辯下去嗎"
    }else if playerID == "B"{
        questionsLabelText = "怎麼樣都不能跟\(aName)討論出一個辦法通過，還要再跟他爭辯下去嗎"
    }
}
func story3_5(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "就在\(aName)和\(bName)激烈爭辯怎麼躲過士兵的時候，沒發現士兵已經到了眼前，聽到他們可疑的對話的士兵把他們抓了起來，丟進了監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "就在\(aName)和\(bName)激烈爭辯怎麼躲過士兵的時候，沒發現士兵已經到了眼前，聽到他們可疑的對話的士兵把他們抓了起來，丟進了監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
        }
        //數值變化
        abChange(aH: -(aHP-1), aA: -2, aL: 0, aG: 0, bH: -(aHP-1), bA: -2, bL: 0, bG: 0)
        //帶入下個問題
        question100_1()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "就在\(aName)大聲爭辯怎麼躲過士兵的時候，\(bName)發現士兵已經到了眼前，趕快躲了起來，聽到\(aName)可疑的對話的士兵則把他抓了起來，丟進了監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "就在\(aName)大聲爭辯怎麼躲過士兵的時候，\(bName)發現士兵已經到了眼前，趕快躲了起來，聽到\(aName)可疑的對話的士兵則把他抓了起來，丟進了監獄"
            statsLabelText = "ＬＵＣＫ+1\n對方\nＨＰ=1 ＡＴＫ-2"
        }
        //數值變化
        abChange(aH: -(aHP-1), aA: -2, aL: 0, aG: 0, bH: 0, bA: 0, bL: 1, bG: 0)
        //下個問題
        question101_1()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "就在\(bName)大聲爭辯怎麼躲過士兵的時候，\(aName)發現士兵已經到了眼前，趕快躲了起來，聽到\(bName)可疑的對話的士兵則把他抓了起來，丟進了監獄"
            statsLabelText = "ＬＵＣＫ+1\n對方\nＨＰ=1 ＡＴＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "就在\(bName)大聲爭辯怎麼躲過士兵的時候，\(aName)發現士兵已經到了眼前，趕快躲了起來，聽到\(bName)可疑的對話的士兵則把他抓了起來，丟進了監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＬＵＣＫ+1"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: 1, aG: 0, bH: -(bHP-1), bA: -2, bL: 0, bG: 0)
        //下個問題
        question102_1()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "兩個人也不討論，也沒有動作，呆站在原地，士兵經過時看了一眼，以為是兩個傻瓜，沒理他們就離開了"
            statsLabelText = "ＡＴＫ-1 ＬＵＣＫ-1\n對方\nＡＴＫ-1 ＬＵＣＫ-1"
        }else if playerID == "B" {
            storyTextLabelText = "兩個人也不討論，也沒有動作，呆站在原地，士兵經過時看了一眼，以為是兩個傻瓜，沒理他們就離開了"
            statsLabelText = "ＡＴＫ-1 ＬＵＣＫ-1\n對方\nＡＴＫ-1 ＬＵＣＫ-1"
        }
        //數值變化
        abChange(aH: 0, aA: -1, aL: -1, aG: 0, bH: 0, bA: -1, bL: -1, bG: 0)
        //下個問題
        selectionQuestion()
    }
}

func question3_11() {
    questionID = 3.11
    if playerID == "A" {
        questionsLabelText = "身上金幣太重了跑不快，是否丟掉一些錢減輕重量？"
    }else if playerID == "B"{
        questionsLabelText = "身上金幣太重了跑不快，是否丟掉一些錢減輕重量？"
    }
}
func story3_11(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)丟掉一些金幣，Ｃ國的士兵都忙著撿錢，他們趁機平安地通過了"
            statsLabelText = "ＧＯＬＤ-200\n對方\nＧＯＬＤ-200"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)丟掉一些金幣，Ｃ國的士兵都忙著撿錢，他們趁機平安地通過了"
            statsLabelText = "ＧＯＬＤ-200\n對方\nＧＯＬＤ-200"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: 0, aG: -200, bH: 0, bA: 0, bL: 0, bG: -200)
        //帶入下個問題
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)丟掉了一些金幣，跑得飛快，\(bName)跑太慢被士兵抓到，並以妨礙公務的罪名被丟到了附近的監獄"
            statsLabelText = "ＧＯＬＤ-200\n對方\nＨＰ=1 ＡＴＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)丟掉了一些金幣，跑得飛快，\(bName)跑太慢被士兵抓到，並以妨礙公務的罪名被丟到了附近的監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＧＯＬＤ-200"
        }
        //數值變化
        abChange(aH: 0, aA: 0, aL: 0, aG: -200, bH: -(bHP-1), bA: -2, bL: 0, bG: 0)
        //下個問題
        question102_1()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)丟掉了一些金幣，跑得飛快，\(aName)跑太慢被士兵抓到，並以妨礙公務的罪名被丟到了附近的監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＧＯＬＤ-200"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)丟掉了一些金幣，跑得飛快，\(aName)跑太慢被士兵抓到，並以妨礙公務的罪名被丟到了附近的監獄"
            statsLabelText = "ＧＯＬＤ-200\n對方\nＨＰ=1 ＡＴＫ-2"
        }
        //數值變化
        abChange(aH: -(aHP-1), aA: -2, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: -200)
        //下個問題
        question101_1()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "兩人跑太慢，被士兵追上，並以妨礙公務的罪名被丟進了附近的監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "兩人跑太慢，被士兵追上，並以妨礙公務的罪名被丟進了附近的監獄"
            statsLabelText = "ＨＰ=1 ＡＴＫ-2\n對方\nＨＰ=1 ＡＴＫ-2"
        }
        //數值變化
        abChange(aH: -(aHP-1), aA: -2, aL: 0, aG: 0, bH: -(bHP-1), bA: -2, bL: 0, bG: 0)
        //下個問題
        question100_1()
    }
}


func question100_1() {
    questionID = 100.1
    selectionquestionBool = true
    backGroundImage = "100_1.jpg"
    situationViewLabelString = "你被關進監獄"
    if playerID == "A" {
        questionsLabelText = "你的牢房空無一物，只有一個被關到漏尿的怪老頭，老頭說他以前是Ｃ國的國王，拜託越獄時帶上它，是否答應？"
    }else if playerID == "B"{
        questionsLabelText = "你的牢房空無一物，只有一個用作廁所的坑，是否要忍住惡臭搜索茅坑？"
    }
}
func story100_1(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "你答應帶著老頭一起逃脫，老頭則告訴你一條前人挖的越獄通道，並把詳細的越獄計畫告訴你"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你將手伸進茅坑，居然撈出一把鑰匙"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }
        //數值變化
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: 10, bA: 0, bL: 0, bG: 0)
        //帶入下個問題
        question100_11()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "你答應帶著老頭一起逃脫，老頭則告訴你一條前人挖的越獄通道，並把詳細的越獄計畫告訴你"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你決定什麼也不做，休息了一天"
            statsLabelText = "ＨＰ+20\n對方\n???"
        }
        //數值變化
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: 20, bA: 0, bL: 0, bG: 0)
        //下個問題
        question100_12()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "帶著這個老頭絕對逃不走的，於是你便拒絕了他，休息了一天"
            statsLabelText = "ＨＰ+20\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你將手伸進茅坑，居然撈出一把鑰匙"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }
        //數值變化
        abChange(aH: 20, aA: 0, aL: 0, aG: 0, bH: 10, bA: 0, bL: 0, bG: 0)
        //下個問題
        question100_13()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "帶著這個老頭絕對逃不走的，於是你便拒絕了他，休息了一天"
            statsLabelText = "ＨＰ+20\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你決定什麼也不做，休息了一天"
            statsLabelText = "ＨＰ+20\n對方\n???"
        }
        //數值變化
        abChange(aH: 20, aA: 0, aL: 0, aG: 0, bH: 20, bA: 0, bL: 0, bG: 0)
        //下個問題
        question100_14()
    }
}

func question100_11() {
    questionID = 100.11
    if playerID == "A" {
        questionsLabelText = "你知道了秘密通道後，打算趁早開溜，但問題來了，你是否真的要將這老頭一起帶走呢？"
    }else if playerID == "B"{
        questionsLabelText = "你發現這竟然是把萬能鑰匙，可以隨時開溜，逃跑時要不要找到\(aName)一起走？"
    }
}
func story100_11(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "帶上老人一起走讓你多消耗了許多體力，逃出去後，老人向你道謝後就離開了，之後與Ｂ會合，你們再次踏上了旅程"
            statsLabelText = "ＨＰ+3\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你好心去到\(aName)的牢房，沒想到他已經逃走，你因此浪費了許多時間和體力，逃出去後與\(aName)會合，再次踏上了旅程"
            statsLabelText = "ＨＰ+3\n對方\n???"
        }
        //數值變化
        king = true
        abChange(aH: 3, aA: 0, aL: 0, aG: 0, bH: 3, bA: 0, bL: 0, bG: 0)
        //帶入下個問題
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "帶上老人一起走讓你多消耗了許多體力，逃出去後，老人向你道謝後就離開了，之後與Ｂ會合，你們再次踏上了旅程"
            statsLabelText = "ＨＰ+3\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "誰管他呢，你抓緊時間逃了出去，逃出去後發現\(aName)已經逃了出來，你們再次踏上了旅程"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }
        //數值變化
        king = true
        abChange(aH: 3, aA: 0, aL: 0, aG: 0, bH: 10, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(aName)使出了過河拆橋，沒有累贅的你輕鬆逃了出去，之後與\(bName)會合，你們再次踏上了旅程"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你好心去到\(aName)的牢房，沒想到他已經逃走，你因此浪費了許多時間和體力，逃出去後與\(aName)會合，再次踏上了旅程"
            statsLabelText = "ＨＰ+3\n對方\n???"
        }
        //數值變化
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: 3, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)使出了過河拆橋，沒有累贅的你輕鬆逃了出去，之後與\(bName)會合，你們再次踏上了旅程"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "誰管他呢，你抓緊時間逃了出去，逃出去後發現\(aName)已經逃了出來，你們再次踏上了旅程"
            statsLabelText = "ＨＰ+10\n對方\n"
        }
        //數值變化
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: 10, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }
}

func question100_12() {
    questionID = 100.12
    if playerID == "A" {
        questionsLabelText = "你知道了秘密通道後，打算趁早開溜，但問題來了，你是否真的要將這老頭一起帶走呢？"
    }else if playerID == "B"{
        questionsLabelText = "過了幾天，你被獄卒抓去問話，被告知如果出賣Ａ的情報就可以被釋放，是否要同意這個提案？"
    }
}
func story100_12(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "帶上老人一起走讓你多消耗了許多體力，逃出去後，老人向你道謝後就離開了，之後與\(bName)會合，你們再次踏上了旅程"
            statsLabelText = "ＨＰ-3\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "想都不用想，你果斷出賣了\(aName)的情報給Ｃ國，而你也順利被釋放了，跟\(aName)繼續踏上旅途，但是之後無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+10\n對方\n???"
        }
        //數值變化
        abChange(aH: -3, aA: 0, aL: 0, aG: 0, bH: 10, bA: 0, bL: 0, bG: 0)
        //帶入下個問題
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "帶上老人一起走讓你多消耗了許多體力，逃出去後，老人向你道謝後就離開了，之後與\(bName)會合，你們再次踏上了旅程"
            statsLabelText = "ＨＰ-3\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你怎麼可能會做出這種出賣夥伴的事呢？拒絕了這個提案後，被嚴刑銬打了三天三夜，才終於被釋放了，與\(aName)繼續踏上旅途"
            statsLabelText = "ＨＰ-3\n對方\n???"
        }
        //數值變化
        abChange(aH: -3, aA: 0, aL: 0, aG: 0, bH: -3, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(aName)使出了過河拆橋，沒有累贅的你輕鬆逃了出去，之後與\(bName)會合，你們再次踏上了旅程"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "想都不用想，你果斷出賣了\(aName)的情報給Ｃ國，而你也順利被釋放了，跟\(aName)繼續踏上旅途，但是之後無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+10\n對方\n???"
        }
        //數值變化
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: 10, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)使出了過河拆橋，沒有累贅的你輕鬆逃了出去，之後與\(bName)會合，你們再次踏上了旅程"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "我怎麼可能會做出這種出賣夥伴的事呢？你拒絕了這個提案後，被嚴刑銬打了三天三夜，才終於被釋放了，與\(aName)繼續踏上旅途"
            statsLabelText = "ＨＰ-3\n對方\n???"
        }
        //數值變化
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: -3, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }
}

func question100_13() {
    questionID = 100.13
    if playerID == "A" {
        questionsLabelText = "過了幾天，你被抓去問話，被告知如果出賣\(bName)的情報就可以被釋放，是否要同意這個提案？"
    }else if playerID == "B"{
        questionsLabelText = "你發現這竟然是把萬能鑰匙，可以隨時開溜，逃跑時要不要找到\(aName)一起走？"
    }
}
func story100_13(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "呵呵，想都不用想，你果斷出賣了\(bName)的情報給Ｃ國，而你也順利被釋放了，繼續踏上旅途"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你好心去到\(aName)的牢房，沒想到他已經逃走，你因此浪費了許多時間和體力，逃出去後與\(aName)會合，再次踏上了旅程，但是不知為啥之後無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ-3 跟蹤狀態\n對方\n???"
        }
        //數值變化
        cityalertB = true
        //帶入下個問題
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: -3, bA: 0, bL: 0, bG: 0)
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "呵呵，想都不用想，你果斷出賣了\(bName)的情報給Ｃ國，而你也順利被釋放了，繼續踏上旅途"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "誰管他呢，你抓緊時間逃了出去，逃出去後發現\(aName)已經逃了出來，你們再次踏上了旅程，但是不知為啥之後無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+5 跟蹤狀態\n對方\n???"
        }
        //數值變化
        cityalertB = true
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: 5, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "我怎麼可能會做出這種出賣夥伴的事呢？你拒絕了這個提案後，被關回了牢房，沒想到晚上\(bName)居然來救你出去，你們手牽手一起逃離了監獄"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)看到你的出現，感動得痛哭流涕，你們手牽手一起逃離了監獄"
            statsLabelText = "ＨＰ+10\n對方\n???"
        }
        //數值變化
        abChange(aH: 10, aA: 0, aL: 0, aG: 0, bH: 10, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "我怎麼可能會做出這種出賣夥伴的事呢？你拒絕了這個提案後，被嚴刑銬打了三天三夜，才終於被釋放了，與\(bName)繼續踏上旅途"
            statsLabelText = "ＨＰ-5\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "誰管他呢，你抓緊時間逃了出去，逃出去後與\(aName)會合，再次踏上了旅程"
            statsLabelText = "ＨＰ+5\n對方\n???"
        }
        //數值變化
        abChange(aH: -5, aA: 0, aL: 0, aG: 0, bH: 5, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }
}

func question100_14() {
    questionID = 100.14
    if playerID == "A" {
        questionsLabelText = "過了幾天，你被獄卒抓去問話，告訴你如果出賣\(bName)的情報就可以被釋放，是否要同意這個提案？"
    }else if playerID == "B"{
        questionsLabelText = "過了幾天，你被獄卒抓去問話，告訴你如果出賣\(aName)的情報就可以被釋放，是否要同意這個提案？"
    }
}
func story100_14(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "想都不用想，你果斷出賣了\(bName)的情報給Ｃ國，而你也順利被釋放了，繼續踏上旅途，但是之後無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+5 被跟蹤狀態\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "想都不用想，你果斷出賣了\(aName)的情報給Ｃ國，而你也順利被釋放了，繼續踏上旅途，但是之後無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+5 被跟蹤狀態\n對方\n???"
        }
        //數值變化
        cityalertA = true
        cityalertB = true
        abChange(aH: 5, aA: 0, aL: 0, aG: 0, bH: 5, bA: 0, bL: 0, bG: 0)
        //帶入下個問題
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "想都不用想，你果斷出賣了\(bName)的情報給Ｃ國，而你也順利被釋放了，繼續踏上旅途，但是之後無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+5\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你怎麼可能會做出這種出賣夥伴的事呢？你拒絕了這個提案後，被嚴刑銬打了三天三夜，才終於被釋放了，與\(aName)繼續踏上旅途"
            statsLabelText = "ＨＰ-3 被跟蹤狀態\n對方\n???"
        }
        //數值變化
        abChange(aH: 5, aA: 0, aL: 0, aG: 0, bH: -3, bA: 0, bL: 0, bG: 0)
        //下個問題
        cityalertB = true
        selectionQuestion()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "你怎麼可能會做出這種出賣夥伴的事呢？你拒絕了這個提案後，被嚴刑銬打了三天三夜，才終於被釋放了，與\(bName)繼續踏上旅途"
            statsLabelText = "ＨＰ-3 被跟蹤狀態\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "想都不用想，你果斷出賣了\(aName)的情報給Ｃ國，而你也順利被釋放了，繼續踏上旅途，但是之後無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+5\n對方\n???"
        }
        //數值變化
        cityalertA = true
        abChange(aH: -3, aA: 0, aL: 0, aG: 0, bH: 5, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "你怎麼可能會做出這種出賣夥伴的事呢？你拒絕了這個提案後，被嚴刑銬打了三天三夜，才終於被釋放了，與\(bName)繼續踏上旅途"
            statsLabelText = "ＨＰ-3\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你怎麼可能會做出這種出賣夥伴的事呢？你拒絕了這個提案後，被嚴刑銬打了三天三夜，才終於被釋放了，與\(aName)繼續踏上旅途"
            statsLabelText = "ＨＰ-3\n對方\n???"
        }
        //數值變化
        abChange(aH: -3, aA: 0, aL: 0, aG: 0, bH: -3, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }
}


func question101_1() {
    questionID = 101.1
    selectionquestionBool = true
    if playerID == "A" {
        backGroundImage = "100_1.jpg"
        situationViewLabelString = "你被關進監獄"
    }else{
        backGroundImage = "1012.jpg"
        situationViewLabelString = "你到了監獄外頭"
    }
    if playerID == "A" {
        questionsLabelText = "只有你一個被關進監獄，\(bName)卻在外面逍遙，有夠火大，要不要跟Ｃ國交換條件，出賣\(bName)的情報來讓他們釋放你？"
    }else if playerID == "B"{
        questionsLabelText = "\(aName)現在被關在監獄裡，你要不要在外面想辦法幫助他出獄？"
    }
}
func story101_1(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "Ｃ國同意了這個條件，你雖然被釋放了，繼續踏上旅途，但是之後無論跟\(bName)到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+20\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你花了身上所有的錢買通了獄卒，進監獄救出了\(aName)，但不知為何他很快就被釋放出來了，莫非\(aName)跟Ｃ國做了什麼骯髒的交易....？"
            statsLabelText = "ＧＯＬＤ=0 跟蹤狀態\n對方\n???"
        }
        //數值變化
        cityalertB = true
        abChange(aH: 20, aA: 0, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: -bGold)
        //帶入下個問題
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "Ｃ國同意了這個條件，你雖然被釋放了，繼續踏上旅途，但是之後無論跟\(bName)到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+20\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "誰管他呢，你果斷丟下\(aName)準備出發，但不知為何他很快就被釋放出來了，莫非\(aName)跟Ｃ國做了什麼骯髒的交易....？"
            statsLabelText = "ＬＵＣＫ+2 跟蹤狀態\n對方\n???"
        }
        //數值變化
        cityalertB = true
        abChange(aH: 20, aA: 0, aL: 0, aG: 0, bH: 0, bA: 0, bL: 2, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "你堅決不出賣同伴，被關回牢房裡，正要放棄治療的時候，\(bName)居然偽裝成獄卒進來救你，你痛哭流涕的感謝他，兩個人手牽手一起逃出去繼續踏上旅途"
            statsLabelText = "ＨＰ+25\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "你花了身上所有的錢買通了獄卒，進監獄救出了\(aName)，雖然花光了錢，不過看到\(aName)痛哭流涕的感謝你，你反而感覺心情大好"
            statsLabelText = "ＡＴＫ+3  ＬＵＣＫ+3  ＧＯＬＤ=0\n對方\n???"
        }
        //數值變化
        abChange(aH: 25, aA: 0, aL: 0, aG: 0, bH: 0, bA: 3, bL: 3, bG: -bGold)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "你堅決不出賣同伴，被關回牢房裡，正要放棄治療的時候，竟然被釋放了，你滿頭問號，但很快就發現原來是Ｃ國的陰謀，之後的旅程無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+25 跟蹤狀態\n對方\n???"
        }else if playerID == "B" {
            storyTextLabelText = "誰管他呢，你果斷丟下\(aName)準備出發，但不知為何他很快就被釋放出來了，莫非\(aName)跟Ｃ國做了什麼骯髒的交易....？"
            statsLabelText = "ＬＵＣＫ+2\n對方\n???"
        }
        //數值變化
        cityalertA = true
        abChange(aH: 25, aA: 0, aL: 0, aG: 0, bH: 0, bA: 0, bL: 3, bG: 0)
        //下個問題
        selectionQuestion()
    }
}


func question102_1() {
    questionID = 102.1
    selectionquestionBool = true
    if playerID == "B" {
        backGroundImage = "100_1.jpg"
        situationViewLabelString = "你被關進監獄"
    }else{
        backGroundImage = "1012.jpg"
        situationViewLabelString = "你到了監獄外頭"
    }
    if playerID == "B" {
        questionsLabelText = "只有你一個被關進監獄，\(aName)卻在外面逍遙，有夠火大，要不要跟Ｃ國交換條件，出賣\(bName)的情報來讓他們釋放你？"
    }else if playerID == "A"{
        questionsLabelText = "\(bName)現在被關在監獄裡，你要不要在外面想辦法幫助他出獄？"
    }
}
func story102_1(){
    if judgeValue == 1 {
        if playerID == "B" {
            storyTextLabelText = "Ｃ國同意了這個條件，你雖然被釋放了，繼續踏上旅途，但是之後無論跟\(bName)到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+20\n對方\n???"
        }else if playerID == "A" {
            storyTextLabelText = "你花了身上所有的錢買通了獄卒，進監獄救出了\(aName)，但不知為何他很快就被釋放出來了，莫非\(aName)跟Ｃ國做了什麼骯髒的交易....？"
            statsLabelText = "ＧＯＬＤ=0 跟蹤狀態\n對方\n???"
        }
        //數值變化
        cityalertA = true
        abChange(aH: 0, aA: 0, aL: 0, aG: -aGold, bH: 20, bA: 0, bL: 0, bG: 0)
        //帶入下個問題
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "B" {
            storyTextLabelText = "Ｃ國同意了這個條件，你雖然被釋放了，繼續踏上旅途，但是之後無論跟\(bName)到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+20\n對方\n???"
        }else if playerID == "A" {
            storyTextLabelText = "誰管他呢，你果斷丟下\(aName)準備出發，但不知為何他很快就被釋放出來了，莫非\(aName)跟Ｃ國做了什麼骯髒的交易....？"
            statsLabelText = "ＬＵＣＫ+2 跟蹤狀態\n對方\n???"
        }
        //數值變化
        cityalertA = true
        abChange(aH: 0, aA: 0, aL: 2, aG: 0, bH: 20, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 3{
        if playerID == "B" {
            storyTextLabelText = "你堅決不出賣同伴，被關回牢房裡，正要放棄治療的時候，\(bName)居然偽裝成獄卒進來救你，你痛哭流涕的感謝他，兩個人手牽手一起逃出去繼續踏上旅途"
            statsLabelText = "ＨＰ+25\n對方\n???"
        }else if playerID == "A" {
            storyTextLabelText = "你花了身上所有的錢買通了獄卒，進監獄救出了\(aName)，雖然花光了錢，不過看到\(aName)痛哭流涕的感謝你，你反而感覺心情大好"
            statsLabelText = "ＡＴＫ+3  ＬＵＣＫ+3  ＧＯＬＤ=0\n對方\n???"
        }
        //數值變化
        abChange(aH: 0, aA: 3, aL: 3, aG: -aGold, bH: 25, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }else if judgeValue == 4{
        if playerID == "B" {
            storyTextLabelText = "你堅決不出賣同伴，被關回牢房裡，正要放棄治療的時候，竟然被釋放了，你滿頭問號，但很快就發現原來是Ｃ國的陰謀，之後的旅程無論到哪裡，都好像被人盯著一樣...."
            statsLabelText = "ＨＰ+25 跟蹤狀態\n對方\n???"
        }else if playerID == "A" {
            storyTextLabelText = "誰管他呢，你果斷丟下\(aName)準備出發，但不知為何他很快就被釋放出來了，莫非\(aName)跟Ｃ國做了什麼骯髒的交易....？"
            statsLabelText = "ＬＵＣＫ+2\n對方\n???"
        }
        //數值變化
        cityalertB = true
        abChange(aH: 0, aA: 0, aL: 3, aG: 0, bH: 25, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
    }
}























