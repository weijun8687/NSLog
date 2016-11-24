//
//  AppDelegate.m
//  NSLog
//
//  Created by WJ on 16/7/29.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "AppDelegate.h"
#import "MyLogFormatter.h"
#import "ViewController.h"

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //1> 开启使用 XcodeColors
//    setenv("XcodeColors", "YES", 0);
    //2 >检测是否开启 XcodeColors
    char *xcode_colors = getenv("XcodeColors");
    
    if (xcode_colors && (strcmp(xcode_colors, "YES")) == 0){
        // XcodeColors is installed and enabled!
        NSLog(@"XcodeColors is installed and enabled");
    }
    
    //3 >开启DDLog 颜色  需要安装 XcodeColors 插件
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor purpleColor] backgroundColor:[UIColor whiteColor] forFlag:DDLogFlagVerbose];
    
    MyLogFormatter *formatter = [MyLogFormatter new];
    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];
    
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    
    NSLog(@"bkdb");
    
    DDLogInfo(@"info");

    DDLogError(@"ckd");
    
    DDLogWarn(@"jcvjaa");
    
    DDLogDebug(@"bbbbbbbb");
    
    DDLogVerbose(@"cvajsaclancacacbak");
    
    // 只要创建
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 一个LogFile的有效期长，有效期内Log都会写入该LogFile
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;//最多LogFile的数量
    [fileLogger setLogFormatter:formatter];
    [DDLog addLogger:fileLogger];
    

    // 向
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    
    DDLogError(NSHomeDirectory());// 沙盒路径
    

    DDLogInfo(@"wertyuio");
    
    DDAbstractLogger *dbLogger = [[DDAbstractLogger alloc] init];
    [fileLogger setLogFormatter:formatter];
    [DDLog addLogger:dbLogger];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];

    return YES;
}


@end
