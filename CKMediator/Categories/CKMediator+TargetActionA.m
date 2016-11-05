//
//  CKMediator+TargetActionA.m
//  CKMediatorDemo
//
//  Created by Clark on 2016/11/5.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "CKMediator+TargetActionA.h"
NSString * const kCKMediatorTargetActionA = @"TargetActionA";
NSString * const kCKMediatorActionFetchViewController = @"fetchViewController";
NSString * const kCKMediatorActionShowAlert = @"showAlertView";
@implementation CKMediator (TargetActionA)
- (UIViewController *)fetchViewController {
    UIViewController *viewController = [self performTarget:kCKMediatorTargetActionA
                                                    action:kCKMediatorActionFetchViewController
                                                    params:@{@"key":@"hello"}];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
 
}
- (void)showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction {
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
        paramsToSend[@"cancelAction"] = cancelAction;
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kCKMediatorTargetActionA
                 action:kCKMediatorActionShowAlert
                 params:paramsToSend];
}

- (void)presentViewControllerToShowInfo:(nullable NSString *)info {

    if (info) {
        [self performTarget:kCKMediatorTargetActionA
                     action:@"showInfomationm"
                     params:@{@"info":info}];
    } else {
        // 这里处理image为nil的场景，如何处理取决于产品
        [self performTarget:kCKMediatorTargetActionA
                     action:@"showInfomationm"
                     params:@{@"info":@"no infomation"}];
    }

}

- (void)presentViewCotrollerToShowImage:(nullable UIImage *)image{
    if (image) {
        [self performTarget:kCKMediatorTargetActionA
                     action:@"showInfomation"
                     params:@{@"image":image,@"info":@"show image"}];
    } else {
        // 这里处理image为nil的场景，如何处理取决于产品
        [self performTarget:kCKMediatorTargetActionA
                     action:@"showInfomation"
                     params:@{@"image":@"no image",@"info":@"no image"}];
    }

}

@end
