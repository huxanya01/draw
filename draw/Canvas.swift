//
//  Canvas.swift
//  draw
//
//  Created by User on 2020/4/24.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class Canvas: UIView {
    var setRed:CGFloat!
    var setGreen:CGFloat!
    var setBlue:CGFloat!
    var setAlpha:CGFloat!
    var setWidth:CGFloat!
    
    var eraser:UIColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
    var isEraser:Bool!
    var setEraserWidth:CGFloat!
    
    var lineColor:UIColor!
    
    func rgbaw(){
        lineColor = UIColor(displayP3Red: setRed/255, green: setGreen/255, blue: setBlue/255, alpha: setAlpha/100)
       }
    
    var path:UIBezierPath!
    var touchPoint:CGPoint!
    var startPoint:CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPoint = touches.first?.location(in: self)
        path = UIBezierPath()
        path.move(to: startPoint)
        path.addArc(withCenter: touchPoint, radius: setWidth, startAngle: 0, endAngle: 0, clockwise: false)
        //path.addLine(to: touchPoint)
        startPoint = touchPoint
        draw()
    }
    
    func draw(){
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        if isEraser == false{
            shapeLayer.strokeColor = lineColor.cgColor
            shapeLayer.lineWidth = setWidth
        }else{
            shapeLayer.strokeColor =
            eraser.cgColor
            shapeLayer.lineWidth =
            setEraserWidth
        }
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    func clearCanvas(){
        if path != nil{
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
        }
    }
    
    
}


extension UIView{
    var snapShot: UIImage?{
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext(){
            layer.render(in: context)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
    
    func showToast(text:String){
        self.hideToast()
        //UILabel
        let toastLb = UILabel()
        toastLb.numberOfLines = 0
        toastLb.lineBreakMode = .byWordWrapping
        toastLb.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
        toastLb.textColor = UIColor.white
        toastLb.layer.cornerRadius = 10.0
        toastLb.textAlignment = .center
        toastLb.text = text
        toastLb.layer.masksToBounds = true
        toastLb.tag = 9999
        //location
        let maxSize = CGSize(width: self.bounds.width - 40, height: self.bounds.height)
        var expectedSize = toastLb.sizeThatFits(maxSize)
        var lbWidth = maxSize.width
        var lbHeight = maxSize.height
        if maxSize.width >= expectedSize.width{
            lbWidth = expectedSize.width
        }
        if maxSize.height >= expectedSize.height{
            lbHeight = expectedSize.height
        }
        expectedSize = CGSize(width: lbWidth, height: lbHeight)
        toastLb.frame = CGRect(x: ((self.bounds.size.width)/2)-((expectedSize.width + 20 )/2), y: self.bounds.height - expectedSize.height - 40 - 20, width: expectedSize.width + 20, height: expectedSize.height + 20)
        self.addSubview(toastLb)
        
        UIView.animate(withDuration: 1, delay: 1, animations: {toastLb.alpha = 0.0}){
            (complete) in toastLb.removeFromSuperview()
        }
        
    }
    
    func hideToast(){
        for view in self.subviews{
            if view is UILabel, view.tag == 9999{
                view.removeFromSuperview()
            }
        }
    }
}
