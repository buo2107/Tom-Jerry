//
//  ViewController.swift
//  Tom&Jerry
//
//  Created by User16 on 2018/11/4.
//  Copyright © 2018 User16. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tomImage: UIImageView!
    @IBOutlet weak var jerryImage: UIImageView!
    @IBOutlet weak var earthImage: UIImageView!
    @IBOutlet weak var distanceSlider: UISlider!
    let trans = CGAffineTransform(rotationAngle: -CGFloat.pi/5.3)
    let tomX = 67.5
    let tomY = 318.5
    var tomCenter = CGPoint()
    var jerryCenter = CGPoint()
    var earthCenter = CGPoint()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tomImage.transform = trans
        earthImage.rotate360Degree()
        
        tomImage.center = CGPoint(x: 67.5, y: 375)
        jerryImage.center = CGPoint(x: 623, y: 375)
        tomCenter = tomImage.center
        jerryCenter = jerryImage.center
        earthCenter = earthImage.center
    }
    
    @IBAction func distanceChange(_ sender: UISlider) {
        let radian = Double(5)*Double.pi/180
        tomImage.center = CGPoint(x: Double(earthCenter.x) - 275*cos(radian*Double(sender.value)), y: Double(earthCenter.y) - 275*sin(radian*Double(sender.value)))
        jerryImage.center = CGPoint(x: Double(earthCenter.x) + 275*cos(radian/2*Double(sender.value)), y: Double(earthCenter.y) - 275*sin(radian/2*Double(sender.value)))
        
        if(sender.value == 23)
        {
            earthImage.stopRotate()
        }
 
    }
    
}

extension UIImageView {
    
    // 360度旋轉圖片
    func rotate360Degree() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 在z軸旋轉
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2.0) // 旋轉角度
        rotationAnimation.duration = 3.0 // 旋轉周期
        rotationAnimation.isCumulative = true // 旋轉累加角度
        rotationAnimation.repeatCount = 100000 // 旋轉次數
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    // 停止旋轉
    func stopRotate() {
        layer.removeAllAnimations()
    }
}

