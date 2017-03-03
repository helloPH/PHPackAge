//
//  Layer_demo.swift
//  PHPackAge
//
//  Created by wdx on 16/9/8.
//  Copyright © 2016年 wdx. All rights reserved.
//

import UIKit

class Layer_demo: UIView {
    var v1 = UIView(frame:CGRect(x: Vwidth/2-50, y: Vheight/2-50, width: 100, height: 100))
    var v2 = UIView(frame:CGRect(x: Vwidth/2-50, y: Vheight/2-50, width: 100, height: 100))
    var v3 = UIView(frame:CGRect(x: Vwidth/2-50, y: Vheight/2-50, width: 100, height: 100))
    var v4 = UIView(frame:CGRect(x: Vwidth/2-50, y: Vheight/2-50, width: 100, height: 100))
    var v5 = UIView(frame:CGRect(x: Vwidth/2-50, y: Vheight/2-50, width: 100, height: 100))
    var v6 = UIView(frame:CGRect(x: Vwidth/2-50, y: Vheight/2-50, width: 100, height: 100))
    
    var  angel = CGFloat(-M_PI/4)
    
    override func draw(_ rect: CGRect) {

    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        v1.backgroundColor=UIColor.init(colorLiteralRed: 0.1, green: 0.1, blue: 0.1, alpha: 0.7);
        v2.backgroundColor=UIColor.init(colorLiteralRed: 1, green: 1, blue: 0.2, alpha: 0.7);
        v3.backgroundColor=UIColor.init(colorLiteralRed: 0.3, green: 0.3, blue: 1, alpha: 0.7);
        v4.backgroundColor=UIColor.init(colorLiteralRed: 0.4, green: 1, blue: 0.4, alpha: 0.7);
        v5.backgroundColor=UIColor.init(colorLiteralRed: 1, green: 0.5, blue: 0.5, alpha: 0.7);
        v6.backgroundColor=UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.7);
        self.addSubview(v1)
        self.addSubview(v2)
        self.addSubview(v3)
        self.addSubview(v4)
        self.addSubview(v5)
        self.addSubview(v6)
        self.backgroundColor=UIColor.white
        
        
        // Drawing code
        var trans = CATransform3DIdentity
//        trans.m34 = -1 / 500
        
        
        var trans2 = CATransform3DTranslate(trans, 0, 0, 50)
        v1.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, 50, 0, 0)
        trans2 = CATransform3DRotate(trans2, CGFloat(M_PI_2) , 0 , 1 , 0);
        v2.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, 0, -50, 0)
        trans2 = CATransform3DRotate(trans2, CGFloat(M_PI_2) , 1 , 0 , 0);
        v3.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, 0, 50, 0)
        trans2 = CATransform3DRotate(trans2, CGFloat(-M_PI_2) , -1 , 0 , 0);
        v4.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, -50, 0, 0)
        trans2 = CATransform3DRotate(trans2, CGFloat(-M_PI_2) , 0 , 1 , 0);
        v5.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, 0, 0, -50)
        trans2 = CATransform3DRotate(trans2, CGFloat(M_PI) , 0 , 1 , 0);
        v6.layer.transform = trans2
        
          trans.m34 = -1 / 500
        trans = CATransform3DRotate(trans, angel , 0, 1 , 0);
        trans = CATransform3DRotate(trans, angel , 1, 0 , 0);
        self.layer.sublayerTransform = trans
        
        let pan = UIPanGestureRecognizer(target: self, action:#selector(Layer_demo.handlePan(_:)))
        self.addGestureRecognizer(pan)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func handlePan(_ sender:UIPanGestureRecognizer){
        let p = sender.translation(in: self)
        
        
//        let angel1 = angel+(p.x/100 * CGFloat(M_PI))
//        let angel2 = angel-(p.y/100 * CGFloat(M_PI))
        let angel3 = angel-(p.x/100 * CGFloat(M_PI))
        
        
        
        var trans = CATransform3DIdentity
//        trans = self.layer.transform
         trans.m34 = -1 / 500
//        trans = CATransform3DMakeTranslation(p.x, p.y, 0)
        
        
//        trans = CATransform3DRotate(trans, angel1 , 0, 1 , 0);
//        trans = CATransform3DRotate(trans, angel2 , 1, 0 , 0);
        trans = CATransform3DRotate(trans, angel3 , 0, 0, 1);
        
        
        self.layer.sublayerTransform = trans
        print("x:\(angel3),")
//        print("拖动\(p)")
        
    }
 

}
