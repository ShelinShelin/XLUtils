//
//  UIView+XLCurrentViewController.h
//  XLUtils
//
//  Created by Shelin on 17/3/1.
//  Copyright © 2017年 StarUnion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XLAdd)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat maxX;

@property (nonatomic, assign) CGFloat maxY;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint orign;

- (void)addCornerMaskLayerWithRadius:(CGFloat)radius;

- (UIViewController *)viewController;

- (UINavigationController *)navigationController;

- (UITabBarController *)tabBarController;

@end
