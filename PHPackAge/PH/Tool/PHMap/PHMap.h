//
//  PHMap.h
//  PHPackAge
//
//  Created by wdx on 2017/3/13.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


#pragma mark -- PHMapHelper
@interface PHMapHelper : NSObject
@property (nonatomic,assign)float currentLat;
@property (nonatomic,assign)float currentLon;
+(instancetype)shareMap;
-(CLLocation*)getCurrentLocation;
@end



#pragma mark -- PHMap
