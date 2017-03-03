//
//  PHKeyBoard_S.swift
//  PHPackAge
//
//  Created by wdx on 2016/12/29.
//  Copyright © 2016年 wdx. All rights reserved.
//

import UIKit



class PHKeyBoard_S: UIView {
    var valueString : NSMutableString = NSMutableString.init(string: "")
    let topView : UIView = UIView.init()
    

    public  var keyBoardBlock : (String) -> () = {
    a in return
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.red
        self.newView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func newView(){
        
        var  setY  : CGFloat = 0
        
        
        let topW = (Vwidth-40)/6;
        let topH = topW * 0.6;
        
        topView.frame=CGRect(x:0, y:0, width:Vwidth, height:40+20)
        topView.backgroundColor=UIColor.gray
        self.addSubview(topView)
        setY=topView.bottom;
        
        
        
        for i  in 0...5 {
            let label = UILabel.init(frame: CGRect(x:topW * CGFloat(i * 1)+20,y:10,width:topW,height:topH))
            topView.addSubview(label)
            label.textAlignment=NSTextAlignment.center
            label.layer.borderWidth=2;
            label.layer.borderColor=UIColor.black.cgColor
            label.tag=i+100
            topView.height=label.bottom+10;
            
            
        }
        
        
        
        let btnTitles : Array = ["1","2","3","清除",   "4","5","6","0",  "7","8","9","确定"]
        
        
        let column : Int = 4
        
        let columnF = CGFloat(column)
        
        
        let bXs : CGFloat = 1;
        let bYs : CGFloat = 1;
        
        let bW : CGFloat = (Vwidth-columnF * bXs)/columnF;
        let bH : CGFloat = bW*0.6;
        

        
        let setYY = setY
        
        for  i in 0...btnTitles.count-1 {
            let bX = CGFloat(i%column) * (bW+bXs)
            let bY = CGFloat(i/column) * (bH+bYs) + setYY
            
            
            
            let btn  = UIButton.init(frame:CGRect(x:bX, y: bY, width: bW, height: bH))
            btn.backgroundColor=UIColor.gray
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setTitleColor(UIColor.red, for: .highlighted)
            btn.addTarget(self, action:#selector(PHKeyBoard_S.btnEvent(_:)), for: .touchUpInside)
            btn.tag=i
            btn.setTitle("\(btnTitles[i])", for: .normal)
            
            
            self.addSubview(btn)
            setY=btn.bottom;
        }
        self.height=setY
        
    }
    
    func btnEvent(_ sender : UIButton){
        
        
        if sender.tag != 3 && sender.tag != 11  && valueString.length < 6 {
            valueString.append((sender.titleLabel?.text)!)
            self.reshView(index: valueString.length-1, isDele: false)
            
        }
        
       
        
        if sender.tag == 3 {
            if valueString.length > 0
            {
            self.reshView(index: valueString.length-1, isDele: true)
            valueString.replaceCharacters(in: NSRange.init(location: valueString.length-1, length: 1), with: "")
            }
        }
        
   
        
        
        if sender.tag == 11
        {
            if valueString.length == 6
            {
              self.keyBoardBlock("\(valueString)")
            }else{
               print("\("你输入的位数不够")")
            }

        }

        if valueString.length <= 6
        {
         print("\(valueString)")
        }
        
        
        
    }
    func reshView(index : NSInteger, isDele : Bool){
        if 0 > index && index > 5
        {
            return;
        }
        
        let lable : UILabel = topView.viewWithTag(index+100) as! UILabel
        if isDele {
            lable.text=""
        }else{
            let text : NSString = valueString.substring(from: valueString.length-1) as NSString
            lable.text=text as String
        }
        
        
    }
  
}



