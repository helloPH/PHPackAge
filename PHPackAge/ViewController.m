//
//  ViewController.m
//  PHPackAge
//
//  Created by wdx on 16/7/7.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ViewController.h"
#import "PHPopBox.h"
#import "PHTabbar.h"
#import "PHCommentStarView.h"

@interface ViewController ()<NSStreamDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
NSInputStream *_inputStream;//对应输入流
NSOutputStream *_outputStream;//对应输出流
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewConstraint;
@property (strong, nonatomic)  UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *chatMsgs;//聊天消息数组

@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) PHTabbar * bar;

@end

@implementation ViewController
-(NSMutableArray *)chatMsgs{
    if (!_chatMsgs) {
        _chatMsgs= [NSMutableArray array];
    }
    return _chatMsgs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbFrmWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    self.navigationController.navigationBar.hidden=YES;
    [self newView1];
    
}
-(void)newView1{
    PHCommentStarView * starView =[PHCommentStarView insWithMaxRank:10 normalImg:nil heightImg:nil commentStarType:commentStarTypeGet];
    
    starView.top=100;
    
    [self.view addSubview:starView];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 前翻 还是 后翻
    CGFloat currentOfset = scrollView.width*_currentIndex;
    float percent = (scrollView.contentOffset.x-currentOfset)/scrollView.width;
    NSLog(@"%.2f",percent);
    
    [_bar changeUnderLineOffSet:percent];
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _currentIndex=scrollView.contentOffset.x/scrollView.width;
    [_bar setIndex:_currentIndex];
}

-(void)reshData{
      [PHPopBox startLoadDataWithTitle:@"正在上传"];
}
-(void)newView{

    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Vwidth, Vheight)];
    scrollView.backgroundColor=[UIColor lightGrayColor];
    scrollView.tag=100;
    [self.view addSubview:scrollView];
    scrollView.contentSize=CGSizeMake(Vwidth, 2000);
    scrollView.delegate=self;
    
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, Vheight, Vwidth, 50)];
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"下拉          下拉" forState:UIControlStateNormal];
    btn.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    [scrollView addSubview:btn];
    btn.tag=101;
    
    
    
    
    
    NSArray * imgs = @[@"icon.jpg",@"04",@"icon"];
    UIScrollView * bScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, btn.bottom, Vwidth, Vheight-btn.height)];
//    bScrollView.backgroundColor=[UIColor blueColor];
    bScrollView.tag=102;
    [scrollView addSubview:bScrollView];
    bScrollView.contentSize=CGSizeMake(bScrollView.width*imgs.count, bScrollView.height);
    bScrollView.delegate=self;
    for (int i =0 ; i < imgs.count; i++) {
        
        
        
        UIScrollView * contentScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(bScrollView.width*i, 0, bScrollView.width, bScrollView.height)];
        [bScrollView addSubview:contentScroll];
        contentScroll.delegate=self;
//        contentScroll.bounces=NO;
        
        UIImageView * img =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, contentScroll.width, contentScroll.height)];
        [contentScroll addSubview:img];
        img.image=[UIImage imageNamed:imgs[i]];
        contentScroll.tag=500+i;
        
       [contentScroll setContentSize:CGSizeMake(contentScroll.width, contentScroll.height*5)];
    }
    
    
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (scrollView.tag>=500 && scrollView.tag<600 ) {
//        
//
//
//        
//        
//        if (scrollView.contentOffset.y < 0) {
//            UIScrollView * mainScroll = [self.view viewWithTag:100];
//            UIButton * btn      = [self.view viewWithTag:101];
//            UIScrollView * bScroll =[self.view viewWithTag:102];
//            bScroll.scrollEnabled=NO;
//           scrollView.scrollEnabled=NO;
//            
//            
//        }
//    }
//       UIScrollView * mainScroll = [self.view viewWithTag:100];
//        UIButton * btn      = [self.view viewWithTag:101];
//    NSLog(@"%f %f",mainScroll.contentOffset.y,btn.top);
//    
//}
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    UIScrollView * mainScroll = [self.view viewWithTag:100];
//    UIButton * btn      = [self.view viewWithTag:101];
//    
//    
//    if (mainScroll.contentOffset.y>btn.top-Vheight && mainScroll.contentOffset.y < btn.top-Vheight/2) {
//        [mainScroll setContentOffset:CGPointMake(0, btn.top-Vheight) animated:YES];
//    }
//    
//    if (mainScroll.contentOffset.y>=btn.top-Vheight/2 && mainScroll.contentOffset.y < btn.top ) {
//        [mainScroll setContentOffset:CGPointMake(0, btn.top) animated:YES];
//    }
//    
//    if (mainScroll.contentOffset.y>=btn.top) {
//        UIScrollView * bScroll =[self.view viewWithTag:102];
//        bScroll.scrollEnabled=YES;
//        for (UIScrollView * contentScroll in bScroll.subviews) {
//            if ([contentScroll isKindOfClass:[UIScrollView class]]) {
//                contentScroll.scrollEnabled=YES;
//            }
//        }
//    }
//}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    UIScrollView * mainScroll = [self.view viewWithTag:100];
//    UIButton * btn      = [self.view viewWithTag:101];
//    
//    
//    if (mainScroll.contentOffset.y>btn.top-Vheight && mainScroll.contentOffset.y < btn.top-Vheight/2) {
//        [mainScroll setContentOffset:CGPointMake(0, btn.top-Vheight) animated:YES];
//    }
//    
//    if (mainScroll.contentOffset.y>=btn.top-Vheight/2 && mainScroll.contentOffset.y < btn.top ) {
//        [mainScroll setContentOffset:CGPointMake(0, btn.top) animated:YES];
//    }
//    
//    if (mainScroll.contentOffset.y>=btn.top) {
//        UIScrollView * bScroll =[self.view viewWithTag:102];
//        bScroll.scrollEnabled=YES;
//        for (UIScrollView * contentScroll in bScroll.subviews) {
//            if ([contentScroll isKindOfClass:[UIScrollView class]]) {
//                contentScroll.scrollEnabled=YES;
//            }
//        }
//    }
//}
//
- (void)connectToHost:(UIButton *)sender {
    // 1.建立连接
    NSString *host = @"60.205.30.106";
    int port = 8080;
    
    // 定义C语言输入输出流
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)host, port, &readStream, &writeStream);
    
    // 把C语言的输入输出流转化成OC对象
    _inputStream = (__bridge NSInputStream *)(readStream);
    _outputStream = (__bridge NSOutputStream *)(writeStream);
    
    
    // 设置代理
    _inputStream.delegate = self;
    _outputStream.delegate = self;
    
    
    // 把输入输入流添加到主运行循环
    // 不添加主运行循环 代理有可能不工作
    [_inputStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [_outputStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    // 打开输入输出流
    [_inputStream open];
    [_outputStream open];
}
- (void)loginBtnClick:(UIButton *)sender {
    
    // 登录
    // 发送用户名和密码
    // 在这里做的时候，只发用户名，密码就不用发送
    
    // 如果要登录，发送的数据格式为 "iam:zhangsan";
    // 如果要发送聊天消息，数据格式为 "msg:did you have dinner";
    
    //登录的指令
    NSString *loginStr = @"iam:zhangsan";
    
    //把Str转成NSData
    NSData *data = [loginStr dataUsingEncoding:NSUTF8StringEncoding];
    
    
    [_outputStream write:data.bytes maxLength:data.length];
}
#pragma mark --
-(void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{
    NSLog(@"%@",[NSThread currentThread]);
    
    //    NSStreamEventOpenCompleted = 1UL << 0,//输入输出流打开完成
    //    NSStreamEventHasBytesAvailable = 1UL << 1,//有字节可读
    //    NSStreamEventHasSpaceAvailable = 1UL << 2,//可以发放字节
    //    NSStreamEventErrorOccurred = 1UL << 3,// 连接出现错误
    //    NSStreamEventEndEncountered = 1UL << 4// 连接结束
    switch (eventCode) {
        case NSStreamEventOpenCompleted:
        NSLog(@"输入输出流打开完成");
        break;
        case NSStreamEventHasBytesAvailable:
        NSLog(@"有字节可读");
        [self readData];
        break;
        case NSStreamEventHasSpaceAvailable:
        NSLog(@"可以发送字节");
        break;
        case NSStreamEventErrorOccurred:
        NSLog(@" 连接出现错误");
        break;
        case NSStreamEventEndEncountered:
        NSLog(@"连接结束");
        
        // 关闭输入输出流
        [_inputStream close];
        [_outputStream close];
        
        // 从主运行循环移除
        [_inputStream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        [_outputStream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        break;
        default:
        break;
    }
    
}
#pragma mark 读了服务器返回的数据
-(void)readData{
    
    //建立一个缓冲区 可以放1024个字节
    uint8_t buf[1024];
    
    // 返回实际装的字节数
    NSInteger len = [_inputStream read:buf maxLength:sizeof(buf)];
    
    // 把字节数组转化成字符串
    NSData *data = [NSData dataWithBytes:buf length:len];
    
    // 从服务器接收到的数据
    NSString *recStr =  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",recStr);
    
    [self reloadDataWithText:recStr];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSString *text = textField.text;
    
    NSLog(@"%@",text);
    // 聊天信息
    NSString *msgStr = [NSString stringWithFormat:@"msg:%@",text];
    
    //把Str转成NSData
    NSData *data = [msgStr dataUsingEncoding:NSUTF8StringEncoding];
    
    // 刷新表格
    [self reloadDataWithText:msgStr];
    
    // 发送数据
    [_outputStream write:data.bytes maxLength:data.length];
    
    // 发送完数据，清空textField
    textField.text = nil;
    
    return YES;
}
-(void)reloadDataWithText:(NSString *)text{
    [self.chatMsgs addObject:text];
    
    [self.tableView reloadData];
    
    // 数据多，应该往上滚动
    NSIndexPath *lastPath = [NSIndexPath indexPathForRow:self.chatMsgs.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
#pragma mark 表格的数据源

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.chatMsgs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = self.chatMsgs[indexPath.row];
    
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
-(void)kbFrmWillChange:(NSNotification *)noti{
    NSLog(@"%@",noti.userInfo);
    
    // 获取窗口的高度
    
    CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
    
    
    
    // 键盘结束的Frm
    CGRect kbEndFrm = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 获取键盘结束的y值
    CGFloat kbEndY = kbEndFrm.origin.y;
    
    
    self.inputViewConstraint.constant = windowH - kbEndY;
}
#pragma mark -- JavaScriptDelegate
-(void)method1{
    
}
@end
