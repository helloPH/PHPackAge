//
//  ScrollCalendar.m
//  PHPackAge
//
//  Created by wdx on 16/9/10.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ScrollCalendar.h"
#import "PHCalendarItem.h"


@interface ScrollCalendar ()


@end

@implementation ScrollCalendar

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self newView];
    
    
    // Do any additional setup after loading the view.
}
-(void)loadData{
    NSDateFormatter * fo=[[NSDateFormatter alloc]init];
    [fo setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:32*3600]];
    [fo setDateFormat:@"yyyy-MM-dd"];
    NSString * nowDateString=[fo stringFromDate:[NSDate date]];
    NSArray * nowDateArr=[nowDateString componentsSeparatedByString:@"-"];
    
      _pageNumber=3;
    _currentYear=[[NSString stringWithFormat:@"%@",nowDateArr[0]] integerValue];
    _currentMonth=[[NSString stringWithFormat:@"%@",nowDateArr[1]] integerValue];
    
    _days=[self totalDaysInMonthOfDate:[NSDate date]];
    _dayOfWeekOfFirstDay=[self weekdayOfFirstDayInDate];
    
}

-(void)newView{
    float setX=0;
    _scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    _scrollView.pagingEnabled=YES;
    _scrollView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_scrollView];
    
    for (int i; i < _pageNumber; i ++) {
        
        _currentMonth++;
        if (_currentMonth>12) {
            _currentMonth=1;
            _currentYear+=1;
        }
        _days=[self totalDaysInMonthOfDate:[NSDate date]];
        _dayOfWeekOfFirstDay=[self weekdayOfFirstDayInDate];
        
        
        
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(i * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        [_scrollView addSubview:view];
        view=[self newSingleView:view];
        setX=view.frame.origin.x+view.frame.size.width;
    }
    _scrollView.contentSize=CGSizeMake(setX, _scrollView.contentSize.height);
}
-(UIView *)newSingleView:(UIView *)view{
    
    CGFloat setY=0;
    CGFloat itemW=(self.view.width-20*self.view.scale)/7;
    for (int i =(int)_dayOfWeekOfFirstDay-1; i < _days+_dayOfWeekOfFirstDay-1; i ++) {
        CGFloat x=i % 7 * itemW + 10*self.view.scale;
        CGFloat y=i / 7 * itemW +0;
        PHCalendarItem * item=[[PHCalendarItem alloc]initWithFrame:CGRectMake(x, y, itemW, itemW)];
        item.layer.cornerRadius=itemW/2;
        item.layer.borderColor=self.view.backgroundColor.CGColor;
        item.layer.borderWidth=5;
        item.layer.masksToBounds=YES;
 
        
        item.day=(NSInteger)i-_dayOfWeekOfFirstDay+2;
        
//        [item addTarget:self action:@selector(itemBtn:) forControlEvents:UIControlEventTouchUpInside];
        setY=item.bottom;
//        item.selected=[self judgeIsSelected:item];
        
//        NSString * dateString=[NSString stringWithFormat:@"%ld-%ld-%ld",(long)_currentYear,(long)_currentMonth,i-_dayOfWeekOfFirstDay+2];
        //        item.lunarDay=[self chineseCalendarOfDate:[self getDayWithString:dateString]];
        
        
//        if ([[self getDayWithString:dateString] isEqualToDate:[self nowDate]]) {
//            item.isToday=YES;
//        }
//        
        [view addSubview:item];
    }
    _scrollView.frame=CGRectMake(0, 0, self.view.frame.size.width, setY);
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// 获取date当前月的第一天是星期几
- (NSInteger)weekdayOfFirstDayInDate {
    
    NSString * dateString=[NSString stringWithFormat:@"%ld-%ld-%d",(long)_currentYear,(long)_currentMonth,01];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[self getDayWithString:dateString]];
    [components setDay:1];
    
    NSDate *firstDate = [calendar dateFromComponents:components];
    NSDateComponents *firstComponents = [calendar components:NSCalendarUnitWeekday fromDate:firstDate];
    return firstComponents.weekday;
}
// 获取date当前月的总天数
- (NSInteger)totalDaysInMonthOfDate:(NSDate *)date {
    NSString * dateString=[NSString stringWithFormat:@"%ld-%ld-%d",(long)_currentYear,(long)_currentMonth,01];
    NSRange range = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self getDayWithString:dateString]];
    return range.length;
}
// 根据字符串 获取对应的天
-(NSDate *)getDayWithString:(NSString *)dayString{
    NSDateFormatter * fo=[NSDateFormatter new];
    [fo setDateFormat:@"yyyy-MM-dd"];
    fo.timeZone=[NSTimeZone timeZoneForSecondsFromGMT:8*3600];
    NSDate * date1=[fo dateFromString:dayString];
    return date1;
}
// 获取当前天
-(NSDate *)nowDate{
    
    NSDateFormatter * fo=[[NSDateFormatter alloc]init];
    [fo setDateFormat:@"yyyy-MM--dd"];
    NSString * dateString=[fo stringFromDate:[NSDate date]];
    fo.timeZone=[NSTimeZone timeZoneForSecondsFromGMT:8*3600];
    NSDate * date=[fo dateFromString:dateString];
    return date;
}
//-(BOOL)judgeIsSelected:(PHCalendarItem *)sender{
//    NSMutableArray * dayArray=[_userDefaults valueForKey:selectedDaySet];
//    
//    for (NSMutableDictionary * dayDic in dayArray) {
//        if ([[NSString stringWithFormat:@"%@",[dayDic valueForKey:@"year"]] integerValue]==_currentYear) {
//            if ([[NSString stringWithFormat:@"%@",[dayDic valueForKey:@"month"]] integerValue]==_currentMonth) {
//                if ([[NSString stringWithFormat:@"%@",[dayDic valueForKey:@"day"]] integerValue]==sender.day) {
//                    return YES;
//                }
//            }
//        }
//    }
//    return NO;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
