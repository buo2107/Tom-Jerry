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
    let trans = CGAffineTransform(rotationAngle: -CGFloat.pi/4)
    let tomX = 67.5
    let tomY = 318.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tomImage.transform = trans
        earthImage.rotate360Degree()
    }
    
    @IBAction func distanceChange(_ sender: UISlider) {
        
    }
    
}

extension UIImageView {
    
    // 360度旋转图片
    func rotate360Degree() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 让其在z轴旋转
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2.0) // 旋转角度
        rotationAnimation.duration = 3.0 // 旋转周期
        rotationAnimation.isCumulative = true // 旋转累加角度
        rotationAnimation.repeatCount = 100000 // 旋转次数
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    // 停止旋转
    func stopRotate() {
        layer.removeAllAnimations()
    }
}

