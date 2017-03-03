//
//  Define.swift
//  PHPackAge
//
//  Created by wdx on 16/8/30.
//  Copyright © 2016年 wdx. All rights reserved.
//

import Foundation
import UIKit

/*********颜色***********/
//RGB转换
func RGB(_ r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    //
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
}

//主题色
public let THEME_COLOR=UIColor(red: 33/255.0, green: 41/255.0, blue: 54/255.0, alpha: 1.0)
//背景色
public let BG_COLOR=UIColor(red: 246/225.0, green: 246/225.0, blue: 246/225.0, alpha: 1.0)
//分割线颜色
public let LINE_COLOR=UIColor(red: 217/225.0, green: 217/225.0, blue: 217/225.0, alpha: 1.0)

/*********尺寸***********/

//设备屏幕尺寸
public let SCREEN_WIDTH=UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT=UIScreen.main.bounds.size.height

//获取视图尺寸
public func VIEW_WIDTH(_ view:UIView)->CGFloat{
    return view.frame.size.width
}
public func VIEW_HEIGHT(_ view:UIView)->CGFloat{
    return view.frame.size.height
}

/*********网络***********/

//判断网络是否可用
//public func NETWORK_AVILIABLE()->Bool{
//    //
//    let reachability:Reachability
//    do{
//        reachability=try Reachability.reachabilityForInternetConnection()
//        
//        if (reachability.isReachable()){
//            //
//            print("network is available")
//            return true
//        }
//        else{
//            //
//            print("network is not available")
//            return false
//        }
//        
//    }
//    catch{
//        //
//        print("Unable to create Reachability")
//        return false
//    }
//    
//}
