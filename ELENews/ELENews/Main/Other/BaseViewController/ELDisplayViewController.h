//
//  ELDisplayViewController.h
//  ELENews
//
//  Created by EL on 2017/12/6.
//  Copyright © 2017年 ElegantLiar. All rights reserved.
//

#import "YZDisplayViewController.h"

@interface ELDisplayViewController : YZDisplayViewController

@property (nonatomic, strong) UIView *baseNavigationView;
@property (nonatomic, strong) NSString *baseTitle;

- (void)showNavImageWithImageName:(NSString *)imageName
                             size:(CGSize)size;

@end