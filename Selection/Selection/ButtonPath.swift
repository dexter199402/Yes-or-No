//
//  ButtonPath.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/7/20.
//  Copyright © 2017年 wei. All rights reserved.
//

import Foundation
import UIKit

var buttonColorPath = CGMutablePath()


// uiimage的letout
func buttonPath(path: UIImageView){
    
    let x = CGFloat(0)
    let y = CGFloat(0)
    let w = path.frame.size.width
    let h = path.frame.size.height
    buttonColorPath.move(to: CGPoint(x: x ,y :y))
    buttonColorPath.addLine(to: CGPoint(x: x + w,y: y))
    buttonColorPath.addLine(to: CGPoint(x: x ,y: y + h))
    buttonColorPath.closeSubpath()
  
/*
     //三角形範圍顯示 橫線
     let d1o = UIBezierPath(rect: CGRect(x: x, y: y, width: w, height: 10))
     let layer = CAShapeLayer()
     layer.path = d1o.cgPath
     layer.strokeColor = UIColor.white.cgColor
     path.layer.addSublayer(layer)
     //直線
     let d2o = UIBezierPath(rect: CGRect(x: y, y: y, width: 10, height: h))
     let layer2 = CAShapeLayer()
     layer2.path = d2o.cgPath
     layer2.strokeColor = UIColor.white.cgColor
     path.layer.addSublayer(layer2)
*/
    
}
