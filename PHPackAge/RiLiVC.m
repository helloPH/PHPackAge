//
//  RiLiVC.m
//  PHPackAge
//
//  Created by wdx on 2016/12/21.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "RiLiVC.h"
#import "PHCalendar.h"

@interface RiLiVC ()

@end

@implementation RiLiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self newView];
    
    
    // Do any additional setup after loading the view.
}
-(void)newView{
    self.view.backgroundColor=[UIColor blueColor];
    
    PHCalendar * calender=[PHCalendar new];
    
    
//    [self addChildViewController:calender];
//    [self.view addSubview:calender.view];
    

    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
