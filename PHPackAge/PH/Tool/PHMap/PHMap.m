//
//  PHMap.m
//  PHPackAge
//
//  Created by wdx on 2017/3/13.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "PHMap.h"


#pragma mark -- PHMapHelper
@interface PHMapHelper()

@end
@implementation PHMapHelper
+(instancetype)shareMap{
    static dispatch_once_t once;
    static PHMapHelper * map;
    dispatch_once(&once, ^{
        map=[[PHMapHelper alloc]init];
    });
    return map;
}
-(CLLocation*)getCurrentLocation{
    CLLocation * location;
    
    
    
    return location;
}
@end



#pragma mark -- PHMap
