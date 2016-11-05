//
//  TargetAcitonA.h
//  CKMediatorDemo
//
//  Created by Clark on 2016/11/5.
//  Copyright © 2016年 CK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TargetActionA : NSObject
- (UIViewController *)fetchViewController:(NSDictionary *)params;
- (id)showAlertView:(NSDictionary *)params;
- (id)showInfomation:(NSDictionary *)params;
- (id)notActionFound:(id)sender;
@end
