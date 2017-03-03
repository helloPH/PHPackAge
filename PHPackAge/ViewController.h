//
//  ViewController.h
//  PHPackAge
//
//  Created by wdx on 16/7/7.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "SuperViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JavaScriptDelegate <JSExport>
-(void)method1;
@end

@interface ViewController : SuperViewController<JavaScriptDelegate,UIWebViewDelegate>
@property (nonatomic,strong)UIWebView * webView;
@property (nonatomic,strong)id <JavaScriptDelegate> jsDelegate;
@property (nonatomic,strong)JSContext * jsContext;
//@property (nonatomic,assign)JSContextRef jsContext;
@end
