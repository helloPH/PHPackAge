//
//  UIView+Helper_S.swift
//  PHPackAge
//
//  Created by wdx on 16/8/29.
//  Copyright © 2016年 wdx. All rights reserved.
//

import Foundation
import UIKit

//private var PERSON_ID_NUMBER_PROPERTY = 0
func golbal(){
    print("qunaju")
}
let Vwidth = UIScreen.main.bounds.size.width
let Vheight = UIScreen.main.bounds.size.height

extension UIView {
    
    public var width: CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var r = self.frame
            r.size.width=newValue
            self.frame=r
        }
    }
    public var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var r = self.frame
            r.size.height=newValue
            self.frame=r
        }
    }
    
    
    public var left: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    public var top: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    public var right: CGFloat{
        get{
            return self.frame.origin.y + self.frame.size.width
        }
        set{
            var r = self.frame
            r.origin.x = newValue-self.frame.size.width
            self.frame=r;
        }
    }
    public var bottom: CGFloat{
        get{
            return self.frame.size.height+self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue-self.frame.size.height
            self.frame=r
        }
    }

    
    
    public  var scale: CGFloat{
        get{
            var  sca=CGFloat(1);
            
            if (UIScreen.main.bounds.size.height > 480)
            {
            sca = UIScreen.main.bounds.size.height / 568.0;
            }
            return sca;
        }
        set{
        }
        
        
        
    }
    
}
