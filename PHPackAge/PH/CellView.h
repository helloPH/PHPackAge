//
//  PHCellView.h
//  PHJD
//
//  Created by wdx on 16/7/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHDefine.h"


typedef NS_ENUM(NSInteger, CellType) {
    CellTypeDefault = 0,//默认从0开始
    CellTypeTextField,
    CellType2,
    CellType3,
    CellType4,
};

@interface CellView : UIView
+(instancetype)instantWithFrame:(CGRect)frame cellType:(CellType)cellType;

@property (nonatomic,assign)CellType  cellType;

@property (nonatomic,strong)UIView * topLine;
@property (nonatomic,strong)UIView * bottonLine;
@property (nonatomic,assign)NSInteger index;


-(void)showShortBottonLine;



@property (nonatomic,strong)UILabel * labelTitle;
@property (nonatomic,strong)UIImageView * imgEnter;

@property (nonatomic,strong)UILabel * labelContent;
@property (nonatomic,strong)UITextField * tfContent;


@end
