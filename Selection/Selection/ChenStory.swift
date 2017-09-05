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

func question2_1() {
    questionID = 2.1
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


























