//
//  ViewController.m
//  NSLog
//
//  Created by WJ on 16/7/29.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ViewController.h"

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    DDLogInfo(@"calnlancl");

}


@end
