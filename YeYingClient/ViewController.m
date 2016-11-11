//
//  ViewController.m
//  YeYingClient
//
//  Created by baidu on 16/11/9.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MD5.h"
#import "YeYingKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connectCustomerService:(UIButton *)sender {
    NSLog(@"%@", @"初始化夜莺客服");
    
    NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:0 diskPath:nil];
    [NSURLCache setSharedURLCache:sharedCache];
    
    // 获取夜莺客服SDK实例
    YeYingManager *yyManager = [YeYingManager sharedYYSDK];
    
    // 以系统标识方式初始化SDK
    [yyManager initWithToken:@"yeyinghelp" domainName:@".baidu.com"];
 
    /*
     
    // 以系统标识方式初始化SDK，并且传入参数，用户信息对接请用这个方式
    // 1.准备相关参数
    NSString *userId = @"20142071";
    NSString *userName = @"测试用户1";
    long timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    // 替换成自己系统的通讯密钥
    NSString *secureKey = @"4845b36abca8438eaeaef1759cb7b042";
    // 2.按参数名升序排列后，拼接参数值
    NSString *sortedString = [secureKey stringByAppendingString:[NSString stringWithFormat:@"%ld", timestamp]];
    sortedString = [sortedString stringByAppendingString:userId];
    sortedString = [sortedString stringByAppendingString:userName];
    // 此处sortedString值为：4845b36abca8438eaeaef1759cb7b042147852585324820142071测试用户1
    // 3.计算md5
    NSString *signature = [sortedString MD5] ;
    // 此处signature值为：4783e056a833b6a5fb0b13ea951c0182
    // 4.拼接初始化参数，参数顺序随意
    NSString *parameters = [NSString stringWithFormat:@"userId=%@&userName=%@&timestamp=%ld&signature=%@",
                            userId, userName, timestamp, signature];
    parameters = [parameters stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // 5.初始化sdk
    [yyManager initWithToken:@"xxxx" domainName:@".baidu.com" urlParameters:parameters];
    
    */
    
    // 调起客服页面
    NSError *error = nil;
    [yyManager show:self completion:^{} runEnv:@"online" withError:&error];
    
    if (error != nil) {
        NSString *errInof = [[error userInfo]valueForKey:@"YYErrorDesc"];
        UIAlertView* alert =[[UIAlertView alloc] initWithTitle:@"调起夜莺客服页面失败" message:errInof delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
}
@end
