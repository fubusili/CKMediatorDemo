//
//  CKMediator+TargetActionA.h
//  CKMediatorDemo
//
//  Created by Clark on 2016/11/5.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "CKMediator.h"
#import <UIKit/UIKit.h>

@interface CKMediator (TargetActionA)
- (nullable UIViewController *)fetchViewController;
- (void)showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction;

- (void)presentViewControllerToShowInfo:(nullable NSString *)info;
- (void)presentViewCotrollerToShowImage:(nullable UIImage *)image;
@end
