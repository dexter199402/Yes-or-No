//
//  HaoStory.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/7.
//  Copyright © 2017年 wei. All rights reserved.
//

import Foundation


//MARK: 1.1
func  question1_1()  {
    questionID = 1.1
    if playerID == "A" {
        questionsLabelText = "一路上你感到氣氛有些尷尬，是否要找\(otherPlayerNameString)聊天？"
        print("===========AOK")
    }else if playerID == "B"{
        questionsLabelText = "一路上你感到氣氛有些尷尬，是否要找\(otherPlayerNameString)聊天？"
        print("===========BOK")
    }
}
func story1_1() {
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "你和\(bName)聊了很多間諜的心得，感覺旅途不那麼無聊了"
        }else if playerID == "B" {
            storyTextLabelText = "你和\(aName)聊了很多間諜的心得，感覺旅途不那麼無聊了"
        }
        statsLabelText = "雙方\nＡＴＫ＋1 ＬＵＣＫ＋1"
        aATK += 1; aLuck += 1;bATK += 1;bLuck += 1
        question1_2()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "你一直想找\(bName)聊天，但他完全不鳥妳，你感覺自己很蠢，他看你一臉失望感覺到精神勝利"
            statsLabelText = "ＡＴＫ-1 ＬＵＣＫ-1\n對方\n所有數值+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)一直想找你聊天，但你完全不鳥他，他感覺自己很蠢，你看他一臉失望感覺到精神勝利"
            statsLabelText = "所有數值+2\n對方\nＡＴＫ-1 ＬＵＣＫ-1"
        }
        aATK -= 1;aLuck -= 1;bHP += 2;bATK += 2;bLuck += 2;
        question1_2()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)一直想找妳聊天，但你完全不鳥他，他感覺自己很蠢，你看他一臉失望感覺到精神勝利"
            statsLabelText = "所有數值+2\n對方\nＡＴＫ-1 ＬＵＣＫ-1"
        }else if playerID == "B" {
            storyTextLabelText = "你一直想找\(aName)聊天，但他完全不鳥妳，你感覺自己很蠢，他看妳一臉失望感覺到精神勝利"
            statsLabelText = "ＡＴＫ-1 ＬＵＣＫ-1\n對方\n所有數值+2"
        }
        aHP += 2;aATK += 2;aLuck += 2;bATK -= 1;bLuck -= 1;
        question1_2()
    }else if judgeValue == 4{
        storyTextLabelText = "你不甩他，他也不鳥你，一路上持續瀰漫著詭異的氣氛"
        statsLabelText = "雙方\nＡＴＫ-1 ＬＵＣＫ-1"
        aATK -= 1;aLuck -= 1;bATK -= 1;bLuck -= 1;
        question1_2()
    }
}


//MARK: 1.2
func question1_2()  {
    questionID = 1.2
    if playerID == "A" {
        questionsLabelText = "傍晚時候，走到了一個熟悉的地方，你想起以前常到這附近玩，河邊還留有以前設的陷阱，是否要將對方引導到陷阱去？"
    }else if playerID == "B"{
        questionsLabelText = "太陽快下山前，對方強力建議要在河邊搭帳過夜，是否要答應？"
    }
}
func story1_2() {
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(bName)呆萌呆萌的往\(aName)設的陷阱走去，突然一聲巨響，\(bName)掉入了一個大坑洞中，並在洞中一臉疑惑的看著在上方洞口奸笑的\(aName)"
            statsLabelText = "ＡＴＫ+2\n對方\nＨＰ-3"
        }else if playerID == "B" {
            storyTextLabelText = "你呆萌呆萌的往\(aName)設的陷阱走去，突然一聲巨響，你掉入了一個大坑洞中，在洞中一臉疑惑的看著在上方洞口奸笑的\(aName)"
            statsLabelText = "ＨＰ-3\n對方\nＡＴＫ+2"
        }
        aATK += 2;bHP -= 2;
        question1_214()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(bName)完全看穿了\(aName)的企圖，堅決不答應，心機都被猜到的\(aName)感覺自己智商被完爆了"
            statsLabelText = "ＨＰ-1 ＡＴＫ-2\n對方\nＨＰ+1 ＡＴＫ+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)完全看穿了\(aName)的企圖，堅決不答應，心機都被猜到的\(aName)感覺自己智商被完爆了"
            statsLabelText = "ＨＰ+1 ＡＴＫ+2\n對方\nＨＰ-1 ＡＴＫ-2"
        }
        aHP -= 1;aATK -= 2 ; bHP += 1 ; bATK += 2
        question1_223()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "兩個人找了河邊另一塊安全的地方休息，晚上還一起吃了一頓烤魚大餐 "
            statsLabelText = "ＨＰ+2 ＡＴＫ+1\n對方\nＨＰ+2 ＡＴＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "兩個人找了河邊另一塊安全的地方休息，晚上還一起吃了一頓烤魚大餐 "
            statsLabelText = "ＨＰ+2 ＡＴＫ+1\n對方\nＨＰ+2 ＡＴＫ+1"
        }
        aHP += 2; aATK += 1; bHP += 2; bATK -= 1
        question1_223()
    }else if judgeValue == 4{
        storyTextLabelText = "\(aName)好心地想找\(bName)一起在安全的地方過夜，可是\(bName)死都不要，他想自己找個地方過夜，突然腳一踩空，跌進了一個不知道誰挖的大洞裡"
        if playerID == "A" {
            statsLabelText = "ＨＰ+2\n對方\nＨＰ-4"
        }else{
            statsLabelText = "ＨＰ-4\n對方\nＨＰ+2"
        }
        abChange(aH: 2, aA: 0, aL: 0, aG: 0, bH: -4, bA: 0, bL: 0, bG: 0)
        question1_214()
    }
}

//MARK: 1.223
func question1_223() {
    questionID = 1.223
    if playerID == "A" {
        questionsLabelText = "你看著在陷阱中過了一夜的\(bName)，心中盤算著是否要將他救起？"
    }else if playerID == "B"{
        questionsLabelText = "你在陷阱中度過了一夜，精疲力盡的你是否要向對方求救？"
    }
}
func story1_223() {
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(bName)正要求饒，\(aName)就決定將他救起，\(bName)雖然不爽，但也感謝\(aName)救他起來，兩人於是和平的繼續前進"
            statsLabelText = "ＨＰ+1\n對方\nＨＰ+1"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)正要求饒，\(aName)就決定將他救起，\(bName)雖然不爽，但也感謝\(aName)救他起來，兩人於是和平的繼續前進"
            statsLabelText = "ＨＰ+1\n對方\nＨＰ+1"
        }
        abChange(aH: 1, aA: 0, aL: 0, aG: 0, bH: 1, bA: 0, bL: 0, bG: 0)
        question1_3()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)伸出手要拉\(bName)，但\(bName)卻傲嬌的不要他幫忙，自己爬了10個小時才出來"
            statsLabelText = "ＨＰ-2\n對方\nＨＰ-1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)伸出手要拉\(bName)，但\(bName)卻傲嬌的不要他幫忙，自己爬了10個小時才出來"
            statsLabelText = "ＨＰ-1\n對方\nＨＰ-2"
        }
        abChange(aH: -2, aA: 0, aL: 0, aG: 0, bH: -1, bA: 0, bL: 0, bG: 0)
        question1_3()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)瘋狂求救，但\(aName)裝作沒聽見一樣不為所動，心中憤怒抓狂的\(bName)戰鬥力爆表一下跳了出來，把\(aName)拖到旁邊海扁一頓"
            statsLabelText = "ＨＰ-3 ＡＴＫ-2\n對方\nＨＰ-2 ＡＴＫ+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)瘋狂求救，但\(aName)裝作沒聽見一樣不為所動，心中憤怒抓狂的\(bName)戰鬥力爆表一下跳了出來，把\(aName)拖到旁邊海扁一頓"
            statsLabelText = "ＨＰ-2 ＡＴＫ+2\n對方\nＨＰ-3 ＡＴＫ-2"
        }
        abChange(aH: -3, aA: -2, aL: 0, aG: 0, bH: -2, bA: 2, bL: 0, bG: 0)
        question1_3()
    }else if judgeValue == 4{
        storyTextLabelText = "\(aName)無情的看著\(bName)，\(bName)也不想讓\(aName)幫忙，自己爬了10個小時才出來，\(aName)忽然感覺有點愧疚"
        if playerID == "A" {
            statsLabelText = "ＬＵＣＫ-2\n對方\nＨＰ-2"
        }else{
            statsLabelText = "ＨＰ-2\n對方\nＬＵＣＫ-2"
        }
        abChange(aH: 0, aA: 0, aL: -2, aG: 0, bH: -2, bA: 0, bL: 0, bG: 0)
        question1_3()
    }
}

//MARK: 1.214
func question1_214() {
    questionID = 1.214
    if playerID == "A" {
        questionsLabelText = "路途到目前為止都非常順利，你覺得很奇怪，跟預期的好像不太一樣，\(bName)肯定有什麼陰謀，要不要去找\(bName)的麻煩？"
    }else if playerID == "B"{
        questionsLabelText = "路途到目前為止都非常順利，你覺得很奇怪，跟預期的好像不太一樣，\(aName)肯定有什麼陰謀，要不要去找\(aName)的麻煩？"
    }
}
func story1_214() {
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(aName)掏出咖哩棒，\(bName)舉起好折凳，兩個人打成一團，兩敗俱傷"
            statsLabelText = "ＨＰ受到\(bName)直接攻擊\n對方\nＨＰ受到\(aName)直接攻擊"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)掏出咖哩棒，\(bName)舉起好折凳，兩個人打成一團，兩敗俱傷"
            statsLabelText = "受到\(aName)直接攻擊\n對方\nＨＰ受到\(bName)直接攻擊"
        }
        abChange(aH: (-bATK), aA: 0, aL: 0, aG: 0, bH: (-aATK), bA: 0, bL: 0, bG: 0)
        question1_3()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)一直挑釁\(bName)，但\(bName)不為所動，一個小時後，\(aName)已經累成狗了，\(bName)仍不動如山"
            statsLabelText = "ＨＰ-2 ＬＵＣＫ-1\n對方\nＬＵＣＫ+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)一直挑釁\(bName)，但\(bName)不為所動，一個小時後，\(aName)已經累成狗了，\(bName)仍不動如山"
            statsLabelText = "ＬＵＣＫ+2\n對方\nＨＰ-2 ＬＵＣＫ-1"
        }
        abChange(aH: -2, aA: 0, aL: -1, aG: 0, bH: 0, bA: 0, bL: 2, bG: 0)
        question1_3()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)一直挑釁\(aName)，但\(aName)不為所動，一個小時後，\(bName)已經累成狗了，\(aName)仍不動如山"
            statsLabelText = "ＬＵＣＫ+2\n對方\nＨＰ-2 ＬＵＣＫ-1"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)一直挑釁\(aName)，但\(aName)不為所動，一個小時後，\(bName)已經累成狗了，\(aName)仍不動如山"
            statsLabelText = "ＨＰ-2 ＬＵＣＫ-1\n對方\nＬＵＣＫ+2"
        }
        abChange(aH: 0, aA: 0, aL: 2, aG: 0, bH: -2, bA: 0, bL: -1, bG: 0)
        question1_3()    }else if judgeValue == 4{
        storyTextLabelText = "連這種情況兩個人都沒有互相懷疑，這究竟是互相信任呢？還是暴風雨前的寧靜呢？讓我們繼續看下去"
        if playerID == "A" {
            statsLabelText = "ＨＰ+1\n對方\nＨＰ+1"
        }else{
            statsLabelText = "ＨＰ+1\n對方\nＨＰ+1"
        }
        abChange(aH: 1, aA: 0, aL: 0, aG: 0, bH: 1, bA: 0, bL: 0, bG: 0)
        question1_3()
    }
}

//MARK: 1.3
func question1_3() {
    questionID = 1.3
    if playerID == "A" {
        questionsLabelText = "某次休息完，你發現背包好像被人動過，少了什麼東西，是否要去質疑\(bName)呢？"
    }else if playerID == "B"{
        questionsLabelText = "某次休息，你瞄到\(aName)的背包裡有一封信，可能是\(aName)的國家給\(aName)的指令，是否要偷看呢？"
    }
}
func story1_3(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(bName)正要偷看信的內容，正好被\(aName)抓包，\(bName)只好尷尬的找個藉口跟\(aName)道歉，而\(aName)則對\(bName)加強了防備"
            statsLabelText = "ＨＰ+1 ＡＴＫ+1 ＬＵＣＫ+1\n對方\nＬＵＣＫ-2"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)正要偷看信的內容，正好被\(aName)抓包，\(bName)只好尷尬的找個藉口跟\(aName)道歉，而\(aName)則對\(bName)加強了防備"
            statsLabelText = "ＬＵＣＫ-2\n對方\nＨＰ+1 ＡＴＫ+1 ＬＵＣＫ+1"
        }
        abChange(aH: 1, aA: 1, aL: 1, aG: 0, bH: 0, bA: 0, bL: -2, bG: 0)
        //帶入下個問題
        selectionQuestion()
        //測試
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)大聲的質問\(bName)，引起許多旅人的圍觀，但最後證明只是有小動物咬走了一些食物而已，\(aName)於是被\(bName)及路人瘋狂嘲諷，羞愧得無地自容"
            statsLabelText = "ＨＰ-2 ＡＴＫ-2 ＬＵＣＫ-2\n對方\nＨＰ+1 ＡＴＫ+1 ＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)大聲的質問\(bName)，引起許多旅人的圍觀，但最後證明只是有小動物咬走了一些食物而已，\(aName)於是被\(bName)及路人瘋狂嘲諷，羞愧得無地自容"
            statsLabelText = "ＨＰ+1 ＡＴＫ+1 ＬＵＣＫ+1\n對方\nＨＰ-2 ＡＴＫ-2 ＬＵＣＫ-2"
        }
        abChange(aH: -2, aA: -2, aL: -2, aG: 0, bH: 1, bA: 1, bL: 1, bG: 0)
        //帶入下個問題
        selectionQuestion()
        //測試
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)偷看了\(aName)的信件，掌握了\(aName)的弱點，事後把信放回原位，\(aName)完全沒有發現"
            statsLabelText = "ＨＰ-1 ＡＴＫ-1 ＬＵＣＫ-1\n對方\nＡＴＫ＋2 ＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)偷看了\(aName)的信件，掌握了\(aName)的弱點，事後把信放回原位，\(aName)完全沒有發現"
            statsLabelText = "ＡＴＫ＋2 ＬＵＣＫ+1\n對方\nＨＰ-1 ＡＴＫ-1 ＬＵＣＫ-1"
        }
        abChange(aH: -1, aA: -1, aL: -1, aG: 0, bH: 0, bA: 2, bL: 1, bG: 0)
        //帶入下個問題
        selectionQuestion()
        //測試
    }else if judgeValue == 4{
        storyTextLabelText = "\(bName)沒有動\(aName)的東西，\(aName)也沒去懷疑\(bName)，兩人像沒事一樣繼續踏上旅途"
        if playerID == "A" {
            statsLabelText = ""
        }else{
            statsLabelText = ""
        }
        //帶入下個問題
        selectionQuestion()
        //測試
    }
}




func abChange(aH:Int,aA:Int,aL:Int,aG:Int,bH:Int,bA:Int,bL:Int,bG:Int) {
    aHP = aHP + aH
    aATK = aATK + aA
    aLuck = aLuck + aL
    aGold = aGold + aG
    bHP = bHP + bH
    bATK = bATK + bA
    bLuck = bLuck + bL
    bGold = bGold + bG
}






































