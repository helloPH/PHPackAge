//
//  Lunbo.m
//  PHPackAge
//
//  Created by wdx on 2016/12/21.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "Lunbo.h"
#import "PHCarouselFigure.h"

@interface Lunbo ()

@end

@implementation Lunbo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self newView];
    // Do any additional setup after loading the view.
}
-(void)newView{
    
    self.view.backgroundColor=[UIColor redColor];
    
    UIWebView * web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Vwidth, Vheight)];
    [self.view addSubview:web];
    
    
    
    NSString * urlString=@"<!DOCTYPE HTML><html><body><a href='http://www.w3school.com.cn/' tabindex='2'>W3School</a><br /><a href='http://www.google.com/' tabindex='1'>Google</a><br /><a href='http://www.microsoft.com/' tabindex='3'>Microsoft</a></body></html>";
    
    
    
    [web loadHTMLString:urlString baseURL:[NSURL URLWithString:urlString]];
    
    
    

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
