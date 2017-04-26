//
//  PHCustomTabbar.m
//  PHPackAge
//
//  Created by MIAO on 2017/4/24.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "PHCustomTabbarController.h"



#pragma mark --

@interface PHTabbarButton()
@property (nonatomic,strong)UIImageView * img;
@property (nonatomic,strong)UILabel     * label;

@end
@implementation PHTabbarButton
-(UIImageView *)img{
    if (!_img) {
        _img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 25, 25)];
        [self addSubview:_img];
    }
    return _img;
}
-(UILabel *)label{
    if (!_label) {
        _label=[[UILabel alloc]initWithFrame:CGRectMake(0, self.img.frame.origin.y+self.img.frame.size.height+2, 20, 20)];
        _label.font=[UIFont systemFontOfSize:12];
        [self addSubview:_label];
        
    }
    return _label;
}

+(instancetype)insWithController:(UIViewController *)controller{
    
    PHTabbarButton * button = [PHTabbarButton new];
//    button.titleLabel.hidden=YES;
//    button.imageView.hidden=YES;
    button.controller=controller;
  
    return button;
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    [self upDateData];

}
-(void)upDateData{
    
    [_img setImage:self.selected?[self imageForState:UIControlStateSelected]:[self imageForState:UIControlStateNormal]];
    self.img.center=CGPointMake(self.frame.size.width/2, self.img.center.y);
    
    
    
    [self.label setText:self.selected?[self titleForState:UIControlStateSelected]:[self titleForState:UIControlStateNormal]];
    [self.label setTextColor:self.selected?[self titleColorForState:UIControlStateSelected]:[self titleColorForState:UIControlStateNormal]];
    [self.label sizeToFit];
    self.label.center=CGPointMake(self.frame.size.width/2, self.label.center.y);
    
    
    self.imageView.hidden=YES;
    self.titleLabel.hidden=YES;
}
-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self upDateData];
}
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self upDateData];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self upDateData];
}

@end


@interface PHCustomTabbarController()
@property (nonatomic,strong)UILabel * numLabel;
@property (nonatomic,strong)UIImageView * backView;


@property (nonatomic,strong)NSMutableArray * buttons;
@property (nonatomic,strong)NSMutableArray * contrls;
@end

@implementation PHCustomTabbarController
-(UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        _numLabel.backgroundColor=[UIColor redColor];
        [self.tabBar addSubview:_numLabel];
    }
    return _numLabel;
}
-(UIImageView *)backView{
    if (!_backView) {
        _backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
        
        
//        _backView.backgroundColor=[UIColor redColor];
        
  
        [self.tabBar addSubview:_backView];
    }
    
    return _backView;
}
-(void)setButtons:(NSMutableArray *)buttons{
    if ([buttons isKindOfClass:[NSArray class]]) {
        _buttons=[NSMutableArray arrayWithArray:buttons];
    }
    if ([buttons isKindOfClass:[NSMutableArray class]]) {
        _buttons=buttons;
    }
}
-(void)changeNumLabelWithNoti:(NSNotification *)noti{
    
    
   
    
}

-(instancetype)initWithButtons:(NSMutableArray<PHTabbarButton *> *)buttons{
    if (self=[super init]) {
        self.tabBar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 49);
        
        self.buttons=buttons;
        [self newView];
    }
    return self;
}
+(instancetype)insWithButtons:(NSMutableArray<PHTabbarButton *> *)buttons{
    PHCustomTabbarController * tabbarController = [[PHCustomTabbarController alloc]initWithButtons:buttons];
    return tabbarController;
}
-(void)replaceButtonOfindex:(NSInteger)index withButton:(PHTabbarButton *)button{
    [self.buttons replaceObjectAtIndex:index withObject:button];
    [self setupContr:self.buttons];
}

-(void)newView{
    [self setupContr:_buttons];// 根据提供的 button 筛选出哪些 带有 controller 并组成数组  赋值给 tabbarController
    
    
    for (int i = 0 ; i < _buttons.count; i++) {
        PHTabbarButton * button = _buttons[i];
        
        CGFloat w = [UIScreen mainScreen].bounds.size.width/_buttons.count;
        CGFloat h = self.tabBar.frame.size.height;
        CGFloat x = i * w;
        CGFloat y = 0;
        
        
        
        button.tag=100+i;
        button.frame=CGRectMake(x, y, w, h);
//        [button setBackgroundImage:[UIImage imageNamed:@"03"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"icon"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        self.backView.userInteractionEnabled=YES;
        button.userInteractionEnabled=YES;
        [self.backView addSubview:button];

    }
    
    

}

-(void)setupContr:(NSMutableArray *)buttons{
    _contrls = [NSMutableArray array];
    NSMutableArray * contrls = [NSMutableArray array];
    for (PHTabbarButton * button in buttons) {
        if (button.controller) {// 存储包含有 controller 的button
            [_contrls addObject:button];
            [contrls addObject:button.controller];
        }
    }

   [self setViewControllers:contrls];
}


-(void)buttonClick:(PHTabbarButton *)sender{
    for (PHTabbarButton * button in _buttons) {
        button.selected=NO;
    }
    sender.selected=YES;
    
    if (self.block) {
        self.block(sender.tag-100);
    }
    
    if (sender.controller) {

       [self setSelectedIndex:[_contrls indexOfObject:sender]];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
