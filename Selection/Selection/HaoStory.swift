//
//  HaoStory.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/7.
//  Copyright © 2017年 wei. All rights reserved.
//

import Foundation
import GameKit


func  question1_1()  {
    questionID = 1.1
    if playerID == "A" {
        questionsLabelText = "一路上你感到氣氛有些尷尬，是否要找\(bName)聊天？"
    }else if playerID == "B"{
        questionsLabelText = "一路上你感到氣氛有些尷尬，是否要找\(aName)聊天？"
    }
    //成就
    let achievement = GKAchievement(identifier: "missioncomplete")
    achievement.showsCompletionBanner = true
    GKAchievement.report([achievement], withCompletionHandler: nil)
}
func story1_1() {
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "你和\(bName)聊了很多間諜的心得，感覺旅途不那麼無聊了"
        }else if playerID == "B" {
            storyTextLabelText = "你和\(aName)聊了很多間諜的心得，感覺旅途不那麼無聊了"
        }
        statsLabelText = "雙方\nＡＴＫ＋1 ＬＵＣＫ＋1"
        abChange(aH: 0, aA: 1, aL: 1, aG: 0, bH: 0, bA: 1, bL: 1, bG: 0)
        question1_2()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "你一直想找\(bName)聊天，但他完全不鳥妳，你感覺自己很蠢，他看你一臉失望感覺到精神勝利"
            statsLabelText = "ＡＴＫ-1 ＬＵＣＫ-1\n對方\n所有數值+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)一直想找你聊天，但你完全不鳥他，他感覺自己很蠢，你看他一臉失望感覺到精神勝利"
            statsLabelText = "所有數值+2\n對方\nＡＴＫ-1 ＬＵＣＫ-1"
        }
        abChange(aH: 0, aA: -1, aL: 0, aG: 0, bH: 2, bA: 2, bL: 2, bG: 0)
        question1_2()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)一直想找妳聊天，但你完全不鳥他，他感覺自己很蠢，你看他一臉失望感覺到精神勝利"
            statsLabelText = "所有數值+2\n對方\nＡＴＫ-1 ＬＵＣＫ-1"
        }else if playerID == "B" {
            storyTextLabelText = "你一直想找\(aName)聊天，但他完全不鳥妳，你感覺自己很蠢，他看妳一臉失望感覺到精神勝利"
            statsLabelText = "ＡＴＫ-1 ＬＵＣＫ-1\n對方\n所有數值+2"
        }
        abChange(aH: 2, aA: 2, aL: 2, aG: 0, bH: 0, bA: -1, bL: -1, bG: 0)
        question1_2()
    }else if judgeValue == 4{
        storyTextLabelText = "你不甩他，他也不鳥你，一路上持續瀰漫著詭異的氣氛"
        statsLabelText = "雙方\nＡＴＫ-1 ＬＵＣＫ-1"
        abChange(aH: 0, aA: -1, aL: -1, aG: 0, bH: 0, bA: -1, bL: -1, bG: 0)
        question1_2()
    }
}



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
        abChange(aH: 0, aA: 2, aL: 0, aG: 0, bH: -3, bA: 0, bL: 0, bG: 0)
        question1_214()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(bName)完全看穿了\(aName)的企圖，堅決不答應，心機都被猜到的\(aName)感覺自己智商被完爆了"
            statsLabelText = "ＨＰ-1 ＡＴＫ-2\n對方\nＨＰ+1 ＡＴＫ+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)完全看穿了\(aName)的企圖，堅決不答應，心機都被猜到的\(aName)感覺自己智商被完爆了"
            statsLabelText = "ＨＰ+1 ＡＴＫ+2\n對方\nＨＰ-1 ＡＴＫ-2"
        }
        abChange(aH: -1, aA: -2, aL: 0, aG: 0, bH: 1, bA: 2, bL: 0, bG: 0)
        question1_223()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "兩個人找了河邊另一塊安全的地方休息，晚上還一起吃了一頓烤魚大餐 "
            statsLabelText = "ＨＰ+2 ＡＴＫ+1\n對方\nＨＰ+2 ＡＴＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "兩個人找了河邊另一塊安全的地方休息，晚上還一起吃了一頓烤魚大餐 "
            statsLabelText = "ＨＰ+2 ＡＴＫ+1\n對方\nＨＰ+2 ＡＴＫ+1"
        }
        abChange(aH: 2, aA: 1, aL: 0, aG: 0, bH: 2, bA: 1, bL: 0, bG: 0)
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


func question1_214() {
    questionID = 1.214
    if playerID == "A" {
        questionsLabelText = "你看著在陷阱中過了一夜的\(bName)，心中盤算著是否要將他救起？"
    }else if playerID == "B"{
        questionsLabelText = "你在陷阱中度過了一夜，精疲力盡的你是否要向對方求救？"
    }
}
func story1_214() {
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


func question1_223() {
    questionID = 1.223
    if playerID == "A" {
        questionsLabelText = "路途到目前為止都非常順利，你覺得很奇怪，跟預期的好像不太一樣，\(bName)肯定有什麼陰謀，要不要去找\(bName)的麻煩？"
    }else if playerID == "B"{
        questionsLabelText = "路途到目前為止都非常順利，你覺得很奇怪，跟預期的好像不太一樣，\(aName)肯定有什麼陰謀，要不要去找\(aName)的麻煩？"
    }
}
func story1_223() {
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
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)大聲的質問\(bName)，引起許多旅人的圍觀，但最後證明只是有小動物咬走了一些食物而已，\(aName)於是被\(bName)及路人瘋狂嘲諷，羞愧得無地自容"
            statsLabelText = "ＨＰ-2 ＡＴＫ-2 ＬＵＣＫ-2\n對方\nＨＰ+1 ＡＴＫ+1 ＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)大聲的質問\(bName)，引起許多旅人的圍觀，但最後證明只是有小動物咬走了一些食物而已，\(aName)於是被\(bName)及路人瘋狂嘲諷，羞愧得無地自容"
            statsLabelText = "ＨＰ+1 ＡＴＫ+1 ＬＵＣＫ+1\n對方\nＨＰ-2 ＡＴＫ-2 ＬＵＣＫ-2"
        }
        abChange(aH: -2, aA: -2, aL: -2, aG: 0, bH: 1, bA: 1, bL: 1, bG: 0)
        selectionQuestion()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)偷看了\(aName)的信件，掌握了\(aName)的弱點，事後把信放回原位，\(aName)完全沒有發現"
            statsLabelText = "ＨＰ-1 ＡＴＫ-1 ＬＵＣＫ-1\n對方\nＡＴＫ＋2 ＬＵＣＫ+1"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)偷看了\(aName)的信件，掌握了\(aName)的弱點，事後把信放回原位，\(aName)完全沒有發現"
            statsLabelText = "ＡＴＫ＋2 ＬＵＣＫ+1\n對方\nＨＰ-1 ＡＴＫ-1 ＬＵＣＫ-1"
        }
        abChange(aH: -1, aA: -1, aL: -1, aG: 0, bH: 0, bA: 2, bL: 1, bG: 0)
        selectionQuestion()
    }else if judgeValue == 4{
        storyTextLabelText = "\(bName)沒有動\(aName)的東西，\(aName)也沒去懷疑\(bName)，兩人像沒事一樣繼續踏上旅途"
        if playerID == "A" {
            statsLabelText = ""
        }else{
            statsLabelText = ""
        }
        selectionQuestion()
    }
}



func question50_1() {
    questionID = 50.1
    if playerID == "A" {
        questionsLabelText = "這傢伙怎麼突然要給我水喝，是否要接受他的心意？"
    }else if playerID == "B"{
        questionsLabelText = "看這傢伙口也渴了，拿點”液體“給他好了，是否把水更換成尿？"
    }
}
func story50_1(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "噗～你混蛋拿尿給我喝！對方拿了自己的尿尿給你喝，你感到無比其辱。"
            statsLabelText = "HP-1,Luck-1\n對方\nLuck+1"
        }else if playerID == "B" {
            storyTextLabelText = "阿不是拉我拿錯了～哈哈哈哈～你看著對方喝尿的蠢樣，沾沾自喜的辯解。"
            statsLabelText = "Luck+1\n對方\nHP-1,Luck-1"
        }
        abChange(aH: -1, aA: 0, aL: -1, aG: 0, bH: 0, bA: 0, bL: 1, bG: 0)
        question50_113()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "夥伴謝拉，我口正渴，哎呦不錯喔。補充水分過後精神氣爽。"
            statsLabelText = "HP+1"
        }else if playerID == "B" {
            storyTextLabelText = "對方喝你的遞給他的水，大口大口的喝，什麼事都沒發生。"
            statsLabelText = "對方\nHP+1"
        }
        abChange(aH: 1, aA: 0, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
        question50_113()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "你揭穿了他。他把水偷偷換成了尿。然而這逃不過你的眼睛，你打了他一巴掌。"
            statsLabelText = "Luck+1\n對方\nHP-1 Luck-1"
        }else if playerID == "B" {
            storyTextLabelText = "他拒絕你的“液體”還發現了你想給喝尿，被打了一巴掌的你無從辯解。"
            statsLabelText = "HP-1 Luck-1\n對方\nLuck+1"
        }
        abChange(aH: 0, aA: 0, aL: 1, aG: 0, bH: -1, bA: 0, bL: -1, bG: 0)
        question50_113()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "你拒絕他遞給你的水，什麼事都沒有發生。"
            statsLabelText = "對方\nHP+1"
        }else if playerID == "B" {
            storyTextLabelText = "他拒絕你的好意，不喝算了。你自己把水喝掉了。"
            statsLabelText = "HP+1"
        }
        abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: 1, bA: 0, bL: 0, bG: 0)
        question50_113()
    }
}


func question50_113() {
    questionID = 50.113
    if playerID == "A" {
        questionsLabelText = "真的很受不了\(bName)那傢伙，剛剛居然讓我喝尿，要不要出腳絆倒他？"
    }else if playerID == "B"{
        questionsLabelText = "經過剛剛的尿尿事件我覺得\(aName)會搞一些小動作，要不要再跟他道歉一次？"
    }
}
func story50_113(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "當\(aName)伸出腳時\(bName)突然走道\(aName)面前道歉，\(aName)沒有絆到\(bName)，覺得可惜。"
            statsLabelText = "Luck-1\n對方\nLuck+1"
        }else if playerID == "B" {
            storyTextLabelText = "當\(aName)伸出腳時\(bName)突然走道\(aName)面前道歉，\(aName)沒有絆到\(bName)，覺得可惜。"
            statsLabelText = "Luck+1\n對方\nLuck-1"
        }
        abChange(aH: 0, aA: 0, aL: -1, aG: 0, bH: 0, bA: 0, bL: 1, bG: 0)
        question50_2()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)無情的絆倒了\(bName)，跌倒的\(bName)坐在地上幫自己呼呼。"
            statsLabelText = "Luck+1\n對方\nHP-1"
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)失去了道歉的機會，這時\(aName)出腳絆倒了\(bName)。"
            statsLabelText = "HP-1\n對方\nLuck+1"
        }
        abChange(aH: 0, aA: 0, aL: 1, aG: 0, bH: -1, bA: 0, bL: 0, bG: 0)
        question50_2()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(aName)大方地原諒了\(bName)，\(bName)也慎重的重新道歉一次，旅程繼續。"
            statsLabelText = ""
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)大方地原諒了\(bName)，\(bName)也慎重的重新道歉一次，旅程繼續。"
            statsLabelText = ""
        }
        question50_2()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)給了\(bName)一個道歉的機會，但\(bName)並不領情，屌兒啷噹的做著鬼臉。"
            statsLabelText = "Luck-2\n對方\nLuck+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)給了\(bName)一個道歉的機會，但\(bName)並不領情，屌兒啷噹的做著鬼臉。"
            statsLabelText = "Luck+2\n對方\nLuck-2"
        }
        abChange(aH: 0, aA: 0, aL: -2, aG: 0, bH: 0, bA: 0, bL: 2, bG: 0)
        question50_2()
    }
}


func question50_2() {
    questionID = 50.2
    if playerID == "A" {
        questionsLabelText = "走著走著還真無聊啊，是否要開口唱歌？"
    }else if playerID == "B"{
        questionsLabelText = "走著走著還真無聊啊，是否要開口唱歌？"
    }
}
func story50_2(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)走在路上突然同時開口唱歌，兩人咒罵著對方為何要跟他一起唱歌，覺得噁心。"
            statsLabelText = "LP-1 ATK-1 Luck-1\n對方\nLP-1 ATK-1 Luck-1"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)走在路上突然同時開口唱歌，兩人咒罵著對方為何要跟他一起唱歌，覺得噁心。"
            statsLabelText = "LP-1 ATK-1 Luck-1\n對方\nLP-1 ATK-1 Luck-1"
        }
        abChange(aH: -1, aA: -1, aL: -1, aG: 0, bH: -1, bA: -1, bL: -1, bG: 0)
        selectionQuestion()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(aName)突然開口唱歌，儘管\(bName)在旁咒罵著說閉嘴別再唱，但是\(aName)仍然唱的很陶醉。"
            statsLabelText = "ATK+2"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)突然開口唱歌，儘管\(bName)在旁咒罵著說閉嘴別再唱，但是\(aName)仍然唱的很陶醉。"
            statsLabelText = ""
        }
        abChange(aH: 0, aA: 2, aL: 0, aG: 0, bH: 0, bA: 0, bL: 0, bG: 0)
        selectionQuestion()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(bName)突然開口唱歌，儘管\(aName)在旁咒罵著說閉嘴別再唱，但是\(bName)仍然唱的很陶醉。"
            statsLabelText = ""
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)突然開口唱歌，儘管\(aName)在旁咒罵著說閉嘴別再唱，但是\(bName)仍然唱的很陶醉。"
            statsLabelText = "ATK+2"
        }
        abChange(aH: 0, aA: 0, aL: 0, aG: 00, bH: 0, bA: 2, bL: 0, bG: 0)
        selectionQuestion()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "你還是覺得很無聊"
            statsLabelText = ""
        }else if playerID == "B" {
            storyTextLabelText = "你還是覺得很無聊"
            statsLabelText = ""
        }
        selectionQuestion()
    }
}



//MARK:QQQQ
func question51_1() {
    questionID = 51.1
    if playerID == "A" {
        questionsLabelText = "前方有個村莊失火了要去幫忙媽"
    }else if playerID == "B"{
        questionsLabelText = "前方有個村莊失火了要去幫忙媽"
    }
}
func story51_1(){
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)，一起去村莊裡幫忙滅火，平分了村名的獎賞。"
            statsLabelText = "雙方\nGold+50"
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)，一起去村莊裡幫忙滅火，平分了村名的獎賞。"
            statsLabelText = "雙方\nGold+50"
        }
        abChange(aH: 0, aA: 0, aL: 0, aG: 50, bH: 0, bA: 0, bL: 0, bG: 50)
        //帶入下個問題
        selectionQuestion()
        //
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "你孤身前往火場幫忙，\(bName)只是在一旁觀看，村名感激你的幫忙給了點Gold，但你也受傷了。"
            statsLabelText = "HP-2 Gold+100"
        }else if playerID == "B" {
            storyTextLabelText = "你看著\(aName)獨自衝進火場，幫忙滅火得到獎賞，但也受傷了。"
            statsLabelText = "對方\nHP-2 Gold+100"
        }
        abChange(aH: -2, aA: 0, aL: 0, aG: 100, bH: 0, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
        //
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "你看著\(bName)獨自衝進火場，幫忙滅火得到獎賞，但也受傷了。"
            statsLabelText = "對方\nHP-2 Gold+100"
        }else if playerID == "B" {
            storyTextLabelText = "你孤身前往火場幫忙，\(aName)只是在一旁觀看，村名感激你的幫忙給了點Gold，但你也受傷了。"
            statsLabelText = "HP-2 Gold+100"
        }
        abChange(aH: 0, aA: 0, aL: 0, aG: 0, bH: -2, bA: 0, bL: 0, bG: 100)
        //下個問題
        selectionQuestion()
        //
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "你們兩個都決定不出手幫忙，路過村莊時看得太入迷不小心跌倒，而且還一起跌倒。"
            statsLabelText = "雙方\nHP-1"
        }else if playerID == "B" {
            storyTextLabelText = "你們兩個都決定不出手幫忙，路過村莊時看得太入迷不小心跌倒，而且還一起跌倒。"
            statsLabelText = "雙方\nHP-1"
        }
        abChange(aH: -1, aA: 0, aL: 0, aG: 0, bH: -1, bA: 0, bL: 0, bG: 0)
        //下個問題
        selectionQuestion()
        //
    }
}


//99.1.  Ａ：兩人以為神不知鬼不覺，沒想到竟然已經被士兵包圍了，只要活著回去任務就成功了，要怎麼逃走呢？
//選項：躲起來   熱血開戰
//Ｂ：兩人以為神不知鬼不覺，沒想到竟然已經被士兵包圍了，只要活著回去任務就成功了，要怎麼逃走呢？
//選項：躲起來   熱血開戰
//(若兩人都選躲起來)Ａ和Ｂ躲了一天，再偽裝成Ｃ國士兵，趁著混亂逃出了城堡
//(Ａ選躲起來，Ｂ選熱血開戰)Ｂ衝上去準備決一死戰，回頭一看Ａ卻躲到了床底下，寡不敵眾的Ｂ被當場砍死，而Ａ也很快被抓了出來，幾天後遭到公開處刑
//(Ａ選熱血開戰，Ｂ選躲起來)Ａ衝上去準備決一死戰，回頭一看Ｂ卻躲到了床底下，寡不敵眾的Ａ被當場砍死，而Ｂ也很快被抓了出來，幾天後遭到公開處刑
//(若兩人都選熱血開戰)(if Ａ+Ｂ ＡＴＫ>26)Ａ和Ｂ大吼一聲便衝了出去，兩人彷彿開了無雙，人擋殺人 佛擋殺佛，Ｃ國士兵紛紛嚇得四處逃跑，兩人趁隙逃出了城堡
//


func question99_1() {
    questionID = 99.1
    if playerID == "A" {
        questionsLabelText = "兩人以為神不知鬼不覺，沒想到竟然已經被士兵包圍了，只要活著回去任務就成功了，要怎麼逃走呢？"
    }else if playerID == "B"{
        questionsLabelText = "兩人以為神不知鬼不覺，沒想到竟然已經被士兵包圍了，只要活著回去任務就成功了，要怎麼逃走呢？"
    }
    yesLabelText = "躲起來"
    noLabelText = "熱血開戰"

}
func story99_1(){
    print("99.1")
    if judgeValue == 1 {
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)躲了一天，再偽裝成Ｃ國士兵，趁著混亂逃出了城堡"
            statsLabelText = ""
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)躲了一天，再偽裝成Ｃ國士兵，趁著混亂逃出了城堡"
            statsLabelText = ""
        }
        question99_2()
    }else if judgeValue == 2{
        if playerID == "A" {
            storyTextLabelText = "\(bName)衝上去準備決一死戰，回頭一看\(aName)卻躲到了床底下，寡不敵眾的\(bName)被當場砍死，而\(aName)也很快被抓了出來，幾天後遭到公開處刑"
            statsLabelText = ""
        }else if playerID == "B" {
            storyTextLabelText = "\(bName)衝上去準備決一死戰，回頭一看\(aName)卻躲到了床底下，寡不敵眾的\(bName)被當場砍死，而\(aName)也很快被抓了出來，幾天後遭到公開處刑"
            statsLabelText = ""
        }
        question99_2()
    }else if judgeValue == 3{
        if playerID == "A" {
            storyTextLabelText = "\(aName)衝上去準備決一死戰，回頭一看\(bName)卻躲到了床底下，寡不敵眾的\(aName)被當場砍死，而\(bName)也很快被抓了出來，幾天後遭到公開處刑"
            statsLabelText = ""
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)衝上去準備決一死戰，回頭一看\(bName)卻躲到了床底下，寡不敵眾的\(aName)被當場砍死，而\(bName)也很快被抓了出來，幾天後遭到公開處刑"
            statsLabelText = ""
        }
        question99_2()
    }else if judgeValue == 4{
        if playerID == "A" {
            storyTextLabelText = "\(aName)和\(bName)大吼一聲便衝了出去，兩人彷彿開了無雙，人擋殺人 佛擋殺佛，Ｃ國士兵紛紛嚇得四處逃跑，兩人趁隙逃出了城堡"
            statsLabelText = ""
        }else if playerID == "B" {
            storyTextLabelText = "\(aName)和\(bName)大吼一聲便衝了出去，兩人彷彿開了無雙，人擋殺人 佛擋殺佛，Ｃ國士兵紛紛嚇得四處逃跑，兩人趁隙逃出了城堡"
            statsLabelText = ""
        }
        question99_2()
    }
}

//99.2.  Ａ：逃到了Ｃ國邊界，你突然想起Ｃ國國王已死，Ｂ的國家就是最大的敵人了，是否要跟Ｂ決一死戰？
//Ｂ：逃到了Ｃ國邊界，你突然想起Ｃ國國王已死，Ａ的國家就是最大的敵人了，是否要跟Ａ決一死戰？
//(選項都是YES)(進入戰鬥)

func question99_2() {
    questionID = 99.2
    if playerID == "A" {
        questionsLabelText = "逃到了Ｃ國邊界，你突然想起Ｃ國國王已死，\(bName)的國家就是最大的敵人了，是否要跟\(bName)決一死戰？"
    }else if playerID == "B"{
        questionsLabelText = "逃到了Ｃ國邊界，你突然想起Ｃ國國王已死，\(aName)的國家就是最大的敵人了，是否要跟\(aName)決一死戰？"
    }
    yesLabelText = "是"
    noLabelText = "是"
    //成就
    let achievement = GKAchievement(identifier: "missioncomplete")
    achievement.showsCompletionBanner = true
    GKAchievement.report([achievement], withCompletionHandler: nil)

}







//===============

func abChange(aH:Int,aA:Int,aL:Int,aG:Int,bH:Int,bA:Int,bL:Int,bG:Int) {
    aHP = aHP + aH
    if aHP >= 50 {
        aHP = 50
    }
    aATK = aATK + aA
    if aATK >= 20 {
        aATK = 20
    }
    aLuck = aLuck + aL
    if aLuck >= 20 {
        aLuck = 20
    }
    aGold = aGold + aG
    if aGold >= 1000{
        aGold = 1000
    }
    bHP = bHP + bH
    if bHP >= 50 {
        bHP = 50
    }
    bATK = bATK + bA
    if bATK >= 20 {
        bATK = 20
    }
    bLuck = bLuck + bL
    if bLuck >= 20 {
        bLuck = 20
    }
    bGold = bGold + bG
    if bGold >= 1000 {
        bGold = 1000
    }
    if aHP <= 0 || bHP <= 0 {
        print("有人死摟")
        print(aHP)
        print(bHP)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GameOver"), object: nil)
    }
    print(aATK,bATK,aLuck,bLuck)
}



















