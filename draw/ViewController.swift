//
//  ViewController.swift
//  draw
//
//  Created by User on 2020/4/24.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvas: Canvas!

    @IBOutlet var opts: [UISlider]!
    @IBOutlet var nums: [UILabel]!
    @IBOutlet var showlabel: [UILabel]!
    
    @IBOutlet weak var showboard: UIView!
    
    @IBAction func clear(_ sender: UIButton) {
        canvas.clearCanvas()
    }
    
    @IBAction func save(_ sender: UIButton) {
        let image = canvas.snapShot
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        canvas.showToast(text: "已存擋")
    }
    
    @IBAction func startSelect(_ sender: UIButton) {
            for opt in opts{
                           opt.isHidden = !opt.isHidden
                           showlabel[0].isHidden = !showlabel[0].isHidden
                           showlabel[1].isHidden = !showlabel[1].isHidden
                           showlabel[2].isHidden = !showlabel[2].isHidden
                           showlabel[3].isHidden = !showlabel[3].isHidden
                           showlabel[4].isHidden = !showlabel[4].isHidden
                           nums[0].isHidden = !nums[0].isHidden
                            nums[1].isHidden = !nums[1].isHidden
                            nums[2].isHidden = !nums[2].isHidden
                            nums[3].isHidden = !nums[3].isHidden
                            nums[4].isHidden = !nums[4].isHidden
                           showboard.isHidden = !showboard.isHidden
                       
                   }
    }
    
    @IBAction func sliderAct(_ sender: UISlider) {
        switch sender.tag{
        case 0:
            sender.value.round()
            nums[0].text = Int(sender.value).description
            canvas.setRed = CGFloat(sender.value)
            canvas.rgbaw()
        case 1:
            sender.value.round()
            nums[1].text = Int(sender.value).description
            canvas.setGreen =
                CGFloat(sender.value)
            canvas.rgbaw()
        case 2:
            sender.value.round()
            nums[2].text =
                Int(sender.value).description
            canvas.setBlue = CGFloat(sender.value)
            canvas.rgbaw()
        case 3:
            sender.value.round()
            nums[3].text = Int(sender.value).description
            canvas.setAlpha = CGFloat(sender.value)
            canvas.rgbaw()
        case 4:
            sender.value.round()
            nums[4].text = Int(sender.value).description
            canvas.setWidth = CGFloat(sender.value)
            canvas.rgbaw()
        default:
            break
        }
    }
        
    @IBAction func segAct(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            canvas.isEraser = false
            canvas.rgbaw()
        case 1:
            canvas.isEraser = true
            canvas.setEraserWidth = _eraserWidth
        default:
            canvas.isEraser = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.clipsToBounds = true
        canvas.isMultipleTouchEnabled = false
        canvas.setRed = 255
        canvas.setGreen = 255
        canvas.setBlue = 255
        canvas.setAlpha = 100
        canvas.setWidth = 1
        canvas.rgbaw()
        canvas.isEraser = false
        canvas.setEraserWidth = _eraserWidth
    }

   
    
}

