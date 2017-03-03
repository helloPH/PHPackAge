//
//  WholeImg.m
//  PHPackAge
//
//  Created by wdx on 2016/11/30.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "PHCarouselFigure.h"
@interface PHCarouselFigure()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView  * headScroll;
@property (nonatomic,strong)UIPageControl * pageControl;
@property (nonatomic,strong)NSTimer * timer;
@end
@implementation PHCarouselFigure
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initData];
        [self newView];
        [self reshView];
    }
    return self;
}
-(instancetype)init{
    if (self=[super init]) {
        [self initData];
        [self newView];
        [self reshView];
    }
    return self;
}
+(instancetype)insWithFrame:(CGRect )frame imgs:(NSArray *)imgs block:(void (^)(NSInteger))block{
    PHCarouselFigure * view=[[PHCarouselFigure alloc]initWithFrame:frame];
    view.frame=frame;
    view.imgs=imgs;
    view.block=block;

    [view reshView];
    return view;
}
-(void)setImgs:(NSArray *)imgs{
    _imgs=imgs;
    
    [self reshView];
}
-(void)initData{
    _index=0;
}
-(void)newView{
    _headScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _headScroll.showsHorizontalScrollIndicator=NO;
    _headScroll.pagingEnabled=YES;
    _headScroll.delegate=self;
    _headScroll.centerX=self.width/2;
    _headScroll.contentSize=CGSizeMake(_headScroll.width*3, _headScroll.height);
    [self addSubview:_headScroll];
    
    _headScroll.contentOffset=CGPointMake(_headScroll.width, 0);
    for (int i =0;  i < 3; i ++) {
        UIImageView * imgView=[[UIImageView alloc]initWithFrame:CGRectMake(i * _headScroll.width, 0, _headScroll.width, _headScroll.height-0*self.scale)];
//        imgView.backgroundColor=[UIColor colorWithRed:1.0/i green:1.0/i blue:1/i alpha:1];
        
        imgView.tag=100+i;
        imgView.layer.masksToBounds=YES;
        imgView.userInteractionEnabled=YES;
        
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [imgView addGestureRecognizer:tap];
        
        UILongPressGestureRecognizer * press=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
        [imgView addGestureRecognizer:press];
        
        
        [_headScroll addSubview:imgView];
    }
    

    
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, self.width, 20*self.scale)];
    [self addSubview:_pageControl];
    _pageControl.tintColor=[UIColor redColor];
    _pageControl.bottom=_headScroll.height;
}
-(void)tap:(UITapGestureRecognizer *)tap{
    if (_block){
        _block(_index);
    }
}
-(void)longPress:(UILongPressGestureRecognizer *)longPress{
    switch (longPress.state) {
        case 1:
        {
            [_timer invalidate];
            _timer = nil;
        }
            break;
        case 3:
        {
            _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(offsetEnent) userInfo:nil repeats:YES];
        }
            break;
            
        default:
            break;
    }
    
    
}




-(void)reshView{
    if (!_imgs || _imgs.count==0) {
        [_timer invalidate];
        _headScroll.scrollEnabled=NO;
        
        return;
    }

    
    _headScroll.scrollEnabled=YES;
    if (!_timer) {
    _timer =[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(offsetEnent) userInfo:nil repeats:YES];
    }
 
    
    
    if (_index<0) {
        _index=_imgs.count-1;
    }
    if (_index>_imgs.count-1) {
        _index=0;
    }
    _pageControl.numberOfPages=_imgs.count;
    _pageControl.currentPage=_index;
    
    
    NSInteger currentIndex;
    
    
    for (int i = 0; i < 3; i ++) {
        currentIndex=_index;
        UIImageView * imgView=[_headScroll viewWithTag:100+i];

        if ([imgView isKindOfClass:[UIImageView class]]) {
            imgView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",_imgs[currentIndex]]];
        }

    }

}
-(void)offsetEnent{
    [UIView animateWithDuration:0.3 animations:^{
        _headScroll.contentOffset=CGPointMake(_headScroll.width*2, 0);
    } completion:^(BOOL finished) {
        _headScroll.contentOffset=CGPointMake(_headScroll.width, 0);
        _index++;
        [self reshView];
    }];
}





-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(_headScroll.contentOffset.x==0){
        _index--;
    }
    if (_headScroll.contentOffset.x==_headScroll.width*2) {
        _index++;
    }
    _headScroll.contentOffset=CGPointMake(_headScroll.width, 0);
    
    
    
    [self reshView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
