//
//  YeYingKit.h
//  YeYingKit
//
//  Created by baidu on 16/1/26.
//  Copyright (c) 2016年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <AVFoundation/AVFoundation.h>

@interface YeYingManager : NSObject
+ (id) sharedYYSDK;
- (void) initWithToken:(NSString *)token domainName:(NSString *) domain;
- (void) initWithToken:(NSString *)token domainName:(NSString *)domain urlParameters:(NSString *)parameters;

// url为导流页面地址（需要https）
- (void) initWithProductUrl:(NSString *) url;
// 设置用户信息，即将BDUSS传递过来
- (void) setUserInfo:(NSString *) bduss;
// 调起页面
- (void) show:(UIViewController *)parentViewController completion:(void (^)(void))completion runEnv:(NSString *)mode withError:(NSError **) error;
@end

@interface YYControllerView : UIViewController
- (instancetype) initWithRemotePage: (NSString *) url runEnv: (NSString *) mode;
- (instancetype) initWithProductToken: (NSString *) token runEnv: (NSString *) mode urlParameters: (NSString *) parameters;
- (void) loadKefuPage;
@end

