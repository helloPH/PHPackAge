//
//  ScrollCalendar.h
//  PHPackAge
//
//  Created by wdx on 16/9/10.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "SuperViewController.h"

@interface ScrollCalendar : SuperViewController

@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,assign)NSInteger pageNumber;
@property (nonatomic,assign)NSInteger dayOfWeekOfFirstDay;
@property (nonatomic,assign)NSInteger days;
@property (nonatomic,assign)NSInteger currentYear;
@property (nonatomic,assign)NSInteger currentMonth;
@end
