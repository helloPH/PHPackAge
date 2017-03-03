//
//  WholeImg.h
//  PHPackAge
//
//  Created by wdx on 2016/11/30.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewAdditions.h"


@interface PHCarouselFigure : UIView

@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)NSArray * imgs;
@property (nonatomic,strong)void (^block)(NSInteger index);
+(instancetype)insWithFrame:(CGRect )frame imgs:(NSArray *)imgs block:(void(^)(NSInteger index))block;
//-(void)reshView;
@end
