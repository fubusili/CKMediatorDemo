//
//  TargetAcitonA.m
//  CKMediatorDemo
//
//  Created by Clark on 2016/11/5.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "TargetActionA.h"
#import "DetailViewController.h"

typedef void (^CKUrlRouterCallbackBlock)(NSDictionary *info);

@implementation TargetActionA
- (UIViewController *)fetchViewController:(NSDictionary *)params {
    // 因为action是从属于ModuleA的，所以action直接可以使用ModuleA里的所有声明
    DetailViewController *viewController = [[DetailViewController alloc] init];
    viewController.title = params[@"key"];
    return viewController;

}
- (id)showAlertView:(NSDictionary *)params {
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        CKUrlRouterCallbackBlock callback = params[@"cancelAction"];
        if (callback) {
            callback(@{@"alertAction":action});
        }
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        CKUrlRouterCallbackBlock callback = params[@"confirmAction"];
        if (callback) {
            callback(@{@"alertAction":action});
        }
    }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"alert" message:params[@"message"] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    return nil;
}

- (id)showInfomation:(NSDictionary *)params {
    DetailViewController *viewController = [[DetailViewController alloc] init];
    viewController.info = params[@"info"];
    viewController.image = params[@"image"];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
    return nil;
}

- (id)notActionFound:(id)sender {
    return [self showAlertView:@{@"message":@"not action found"}];
}
@end
