//
//  DownLoaderVC.m
//  PHPackAge
//
//  Created by wdx on 2016/12/27.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "DownLoaderVC.h"



@interface DownLoaderVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView   * tableView;
@property (nonatomic,strong)NSMutableArray* datas;
@property (nonatomic,assign)NSInteger       yeIndex;
@end

@implementation DownLoaderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self newView];
    [self reshData];
    
    // Do any additional setup after loading the view.
}
-(void)initData{
    _yeIndex=1;
    _datas=[NSMutableArray array];
}
-(void)reshData{
    [self reshView];
}
-(void)reshView{
    [_tableView reloadData];
}
-(void)newView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.naviImg.bottom, Vwidth, Vheight-self.naviImg.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [_tableView addHeardTarget:self Action:@selector(xiala)];
    [_tableView addFooterTarget:self Action:@selector(shangla)];
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}
-(void)xiala{
    _yeIndex=1;
    [self reshView];
}
-(void)shangla{
    _yeIndex++;
    [self reshView];
    
}

#pragma  mark -- tableView  delegate dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dic=_datas[indexPath.row];
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
