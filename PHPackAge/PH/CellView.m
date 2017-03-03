//
//  PHCellView.m
//  PHJD
//
//  Created by wdx on 16/7/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "CellView.h"
#import "PHDefine.h"

@implementation CellView
-(instancetype)init{
    if (self=[super init]) {
        [self newView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self newView];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame cellType:(CellType)cellType{
    if (self=[super initWithFrame:frame]) {
        self.cellType=cellType;
        [self newView];
    }
    return self;
}
+(instancetype)instantWithFrame:(CGRect)frame cellType:(CellType)cellType{
    CellView * cellView=[[CellView alloc]initWithFrame:frame cellType:cellType];
    return cellView;
}

-(void)newView{
    _topLine=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, .5)];
    _topLine.backgroundColor=[UIColor lightGrayColor];
    _topLine.hidden=YES;
    [self addSubview:_topLine];
    
    _bottonLine=[[UIView alloc]initWithFrame:_topLine.frame];
    _bottonLine.backgroundColor=[UIColor lightGrayColor];
//    _bottonLine.hidden=YES;
    [self addSubview:_bottonLine];
    
    _labelTitle=[UILabel new];
    _labelTitle.size=CGSizeMake(60*self.scale, 20*self.scale);
    _labelTitle.font=fontDefault(self.scale);
    _labelTitle.textColor=colorBlackText;
    [self addSubview:_labelTitle];
    
    _imgEnter=[UIImageView new];
    _imgEnter.size=CGSizeMake(25*self.scale, 25*self.scale);
    _imgEnter.image=[UIImage ImageForColor:colorGrayText];
    [self addSubview:_imgEnter];
    
    _labelContent=[UILabel new];
    _labelContent.size=CGSizeMake(Vwidth-40*self.scale-_labelTitle.width-_imgEnter.width, 20*self.scale);
    _labelContent.textAlignment=NSTextAlignmentRight;
    _labelContent.font=fontDefault(self.scale);
    _labelContent.textColor=colorBlackLine;
    [self addSubview:_labelContent];
    
    
    _tfContent=[UITextField new];
    _tfContent.font=fontDefault(self.scale);
    _tfContent.textColor=colorBlackText;
    _tfContent.size=CGSizeMake(Vwidth-30*self.scale-_labelTitle.width, 20*self.scale);
    [self addSubview:_tfContent];
    

}
-(void)showShortBottonLine{
    _bottonLine.left=10;
    _bottonLine.width=self.width-20;
}

-(void)layoutSubviews{
    _bottonLine.bottom=self.height;

    
    _labelTitle.centerY=self.height/2;
    _labelTitle.left=10*self.scale;
    
    _imgEnter.left=Vwidth-10*self.scale-25*self.scale;
    _imgEnter.centerY=self.height/2;
    
    
    _labelContent.centerY=self.height/2;
    _labelContent.left=_labelTitle.right+10*self.scale;
    _labelContent.width=Vwidth-40*self.scale-_labelTitle.width-_imgEnter.width;
    
    
    _tfContent.centerY=self.height/2;
    _tfContent.width=Vwidth-_labelTitle.width-30*self.scale;
    _tfContent.left=_labelTitle.right+10*self.scale;
    
    
    switch (_cellType){
        case 0://
            _tfContent.hidden=YES;
            break;
        case 1:
            _labelContent.hidden=YES;
            _imgEnter.hidden=YES;
            break;
        case 2:
            
            break;
        default:
            break;
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
