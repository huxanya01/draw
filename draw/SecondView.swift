//
//  SecondVC.swift
//  draw
//
//  Created by User on 2020/4/30.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

var _eraserWidth:CGFloat = 10
class SecondView: UIViewController {
    @IBOutlet weak var silderValue: UISlider!
    
    @IBOutlet weak var eraserNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        eraserNum.text = Int(_eraserWidth).description
        silderValue.value =
        Float(_eraserWidth)
        
    }
    
    @IBAction func returnAct(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eraserSet(_ sender: UISlider) {
        sender.value.round()
        eraserNum.text = Int(sender.value).description
        _eraserWidth = CGFloat(sender.value)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
