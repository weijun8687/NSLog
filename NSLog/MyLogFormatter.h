//
//  MyLogFormatter.h
//  NSLog
//
//  Created by WJ on 16/7/29.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <CocoaLumberjack.h>
//#import <CocoaLumberjack/CocoaLumberjack.h>
//#import <CocoaLumberjack/DDTTYLogger.h>

// 一定要遵循 DDLogFormatter 协议,并且重写 formatLogMessage 方法


@interface MyLogFormatter : NSObject <DDLogFormatter>


@end
