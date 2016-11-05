//
//  CKMediator.h
//  CKMediatorDemo
//
//  Created by Clark on 2016/11/5.
//  Copyright © 2016年 CK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKMediator : NSObject

/**
 单例

 @return 返回CKMediator对象
 */
+ (instancetype)sharedInstance;

/**
 远程方法调用

 @param url        远程调用URL
 @param completion 回调

 @return 返回回调对象
 */
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;

/**
 本地组件调用

 @param targetName target name
 @param actionName actin name
 @param params    需要传入的字典数据

 @return 返回回调对象
 */
- (id)performTarget:(NSString  *)targetName action:(NSString *)actionName params:(NSDictionary *)params;
@end
