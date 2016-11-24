//
//  MyLogFormatter.m
//  NSLog
//
//  Created by WJ on 16/7/29.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "MyLogFormatter.h"


@implementation MyLogFormatter


// 自定义输出的格式及内容

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage{
    
    NSString *logLevel = nil;
    switch (logMessage->_flag)
    {
        case DDLogFlagError:
            logLevel = @"[ERROR] >  ";
            break;
        case DDLogFlagWarning:
            logLevel = @"[WARN]  >  ";
            break;
        case DDLogFlagInfo:
            logLevel = @"[INFO]  >  ";
            break;
        case DDLogFlagDebug:
            logLevel = @"[DEBUG] >  ";
            break;
        default:
            logLevel = @"[VBOSE] >  ";
            break;
    }
    
    NSString *formatStr = [NSString stringWithFormat:@"%@[%@ %@][line %ld] %@",
                           logLevel, logMessage.fileName, logMessage->_function,
                           logMessage->_line, logMessage->_message];
    return formatStr;

}

@end
