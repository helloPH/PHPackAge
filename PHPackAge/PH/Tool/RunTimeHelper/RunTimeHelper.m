//
//  RunTimeHelper.m
//  PHPackAge
//
//  Created by MIAO on 2017/4/25.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "RunTimeHelper.h"
#import <objc/runtime.h>



@implementation RunTimeHelper
+(NSArray *)getPropertyListFromObj:(id)obj{//
    NSMutableArray * propertyList = [NSMutableArray array];
    unsigned int count = 0 ;
    
 
    objc_property_t * propertes = class_copyPropertyList([obj class], &count);
    for (int i = 0 ; i < count; i ++) {
        [propertyList addObject:@{@(property_getName(propertes[i])):@(property_getAttributes(propertes[i]))}];
    }
    

    
    return propertyList;
}
//+(BOOL)addTarget:(id)target method:(NSString *)method{
//    
//    
//    
//    
//}
@end
