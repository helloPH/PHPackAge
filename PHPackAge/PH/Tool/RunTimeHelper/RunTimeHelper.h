//
//  RunTimeHelper.h
//  PHPackAge
//
//  Created by MIAO on 2017/4/25.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunTimeHelper : NSObject
+(NSArray *)getPropertyListFromObj:(id)obj;
+(BOOL)addTarget:(id)target method:(NSString *)method;
@end
