//
//  CellView_S.swift
//  PHPackAge
//
//  Created by wdx on 16/8/27.
//  Copyright © 2016年 wdx. All rights reserved.
//

import UIKit

class CellView_S: UIView {
    var topLine = UIView()
    var bottomLine = UIView()
    var shotLine = Bool()
    var imgView = UIImageView()
    var labelTitle = UILabel()
    var labelContent = UILabel()
    
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.white
        
        self.addSubview(topLine)
        topLine.backgroundColor=UIColor.gray;
        
        self.addSubview(bottomLine)
        bottomLine.isHidden=true
        bottomLine.backgroundColor=UIColor.gray
        
    
        self.addSubview(imgView)
        imgView.layer.borderColor=UIColor.gray.cgColor
        imgView.layer.borderWidth=0.5*self.scale
        imgView.frame=CGRect(x: 10*self.scale, y: 10*self.scale, width: 90*self.scale, height: frame.size.height-20*self.scale);
        
        
        self.addSubview(labelTitle)
        labelTitle.font=UIFont.systemFont(ofSize: 13*self.scale)
        labelTitle.textAlignment=NSTextAlignment.left
        labelTitle.textColor=UIColor.gray
        labelTitle.frame=CGRect(x: imgView.right+10*self.scale, y: imgView.top, width: frame.size.width-30*self.scale-imgView.width, height: (frame.size.height-20*self.scale)/2.0-10)
        labelTitle.backgroundColor=UIColor.gray
        labelTitle.numberOfLines=0
        
        self.addSubview(labelContent)
        labelContent.font=UIFont.systemFont(ofSize: 12*self.scale)
        labelContent.textAlignment=NSTextAlignment.left
        labelContent.textColor=UIColor.lightGray
        labelContent.frame=labelTitle.frame
//        labelContent.bottom=imgView.bottom
        labelContent.backgroundColor=UIColor.gray
        labelContent.numberOfLines=0
        
    }
    internal override func layoutSubviews() {
        self.topLine.frame=CGRect(x: 0, y: 0, width: Vwidth, height: 1*self.scale);
        
        self.bottomLine.frame=topLine.frame
//        self.bottomLine.bottom=self.height
        
        if (shotLine) {
            self.topLine.frame=CGRect(x: 10*self.scale, y: 0, width: Vwidth-20*self.scale, height: 0.5*self.scale)
        }

        
   self.imgView.frame=CGRect(x: 10*self.scale, y: topLine.bottom+10*self.scale, width: 90*self.scale, height: self.height-(1+20)*self.scale);

    }
    internal func log(){
//        print(globalLog());
        
    }
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
func globalLog()->String{
    return "这是swift全局的log方法fdsalkjflksdajflk"
}
