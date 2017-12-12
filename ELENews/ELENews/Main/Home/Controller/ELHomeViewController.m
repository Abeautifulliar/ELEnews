//
//  ELHomeViewController.m
//  ELENews
//
//  Created by EL on 2017/12/6.
//  Copyright © 2017年 ElegantLiar. All rights reserved.
//

#import "ELHomeViewController.h"
#import "ELHomeChannelViewModel.h"
#import "ELNewsCommonViewController.h"

@interface ELHomeViewController ()


@end

@implementation ELHomeViewController{
    ELHomeChannelViewModel *_channleViewModel;

}

#pragma mark – LifeCycle
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self showNavImageWithImageName:@"home_nav_logo_91x26_" size:CGSizeMake(91, 26)];

    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        *norColor = [UIColor hexChangeFloat:@"9A9A9A"];
        *selColor = [UIColor hexChangeFloat:@"FF3D3D"];
        *titleWidth = [UIScreen mainScreen].bounds.size.width / 6;
        *titleHeight = 32;
        *titleFont = [UIFont systemFontOfSize:15];
    }];
    
    // 标题渐变
    // *推荐方式(设置标题渐变)
    [self setUpTitleGradient:^(YZTitleColorGradientStyle *titleColorGradientStyle, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor) {
        
    }];
    
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor,BOOL *isUnderLineEqualTitleWidth) {
        *isUnderLineEqualTitleWidth = YES;
        *underLineColor = [UIColor hexChangeFloat:@"FF3D3D"];
    }];
    
    [self initData];

}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
}

#pragma mark - Intial Methods
- (void)initData{
    _channleViewModel = [[ELHomeChannelViewModel alloc] init];
    
    [_channleViewModel loadDataFromNetwork];
    
    @weakify(self);
    [[_channleViewModel.requestCommand execute:nil] subscribeNext:^(id x) {
        @strongify(self);
        [self setUpAllViewController];
    } error:^(NSError *error) {
        
    }];
}

#pragma mark – Target Methods

#pragma mark - Private Methods
// 添加所有子控制器
- (void)setUpAllViewController{
    for (NSInteger i = 0; i < _channleViewModel.channelBean.home.count; i++) {
        ELSingleChannelBean *bean = [_channleViewModel.channelBean.home safeObjectAtIndex:i];
        ELNewsCommonViewController *commonVc = [[ELNewsCommonViewController alloc] init];
        commonVc.title = bean.name;
        commonVc.singleChannelBean = bean;
        [self addChildViewController:commonVc];
    }
    
    [self refreshDisplay];
    
}

#pragma mark - Setter Getter Methods

#pragma mark - External Delegate





@end