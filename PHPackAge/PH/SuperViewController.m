//
//  SuperViewController.m
//  PHPackAge
//
//  Created by wdx on 16/8/11.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent=NO;
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}


-(void)showPromptBoxWithSting:(NSString *)prompt{
    UILabel * noticeLabel=[[UILabel alloc]init];
    noticeLabel.text=prompt;
    noticeLabel.font=[UIFont systemFontOfSize:13*self.view.scale];
    noticeLabel.size=[UILabel Text:prompt Size:CGSizeMake(Vwidth/2, 2000) Font:13*self.view.scale];
    noticeLabel.height=noticeLabel.height+0*self.view.scale;
    noticeLabel.width=noticeLabel.width+0*self.view.scale;
    noticeLabel.numberOfLines=0;
    noticeLabel.layer.cornerRadius=5*self.view.scale;
    noticeLabel.layer.masksToBounds=YES;
    noticeLabel.textAlignment=NSTextAlignmentCenter;
    //    noticeLabel.alpha=0.8;
    noticeLabel.backgroundColor=[UIColor grayColor];
    
    noticeLabel.center=self.view.center;
    [self.view addSubview:noticeLabel];
    [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionTransitionNone animations:^{
        noticeLabel.alpha=0;
    } completion:^(BOOL finished) {
        [noticeLabel removeFromSuperview];
    }];
}
-(void)showAlertWithTitle:(NSString *)title content:(NSString *)content block:(void (^)())block{
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action1=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
          block();
        }
    }];
    UIAlertAction * action2=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:action1];
    if(block){
    [alert addAction:action2];
    }
    [self presentViewController:alert animated:YES completion:nil];
}



//判断是否有网络？？？？？？？？
-(BOOL) connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}
//-(void)customView{
//    UIImageView * imgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    imgview.image=[UIImage ImageForColor:[UIColor blueColor]];
//    [self.view addSubview:imgview];
//    imgview.center=self.view.center;
//    
//    [self vied:imgview];
//    
////    [UIView animateWithDuration:1   animations:^{
////        imgview.centerY=self.view.centerY-60;
////        imgview.transform=CGAffineTransformRotate(imgview.transform, 360);
////    } completion:^(BOOL finished) {
////        
////        //        imgview.centerY=self.view.centerY;
////    }];
////    
//    
//    
//}
-(void)vied:(UIView *)ive{
    
    
    [UIView animateWithDuration:1 animations:^{
        
        if (ive.centerY==self.view.centerY) {
          ive.centerY=self.view.centerY-60;
        }else{
           ive.centerY=self.view.centerY;
        }
        
        ive.transform=CGAffineTransformRotate(ive.transform, 360);
    } completion:^(BOOL finished) {
        [self vied:ive];
    }];
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
