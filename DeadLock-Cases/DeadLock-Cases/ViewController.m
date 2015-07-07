//
//  ViewController.m
//  DeadLock-Cases
//
//  Created by MacPro on 7/7/15.
//  Copyright (c) 2015 MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self issueCase1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// http://stackoverflow.com/questions/15381209/how-do-i-create-a-deadlock-in-grand-central-dispatch
- (void)issueCase1 {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //do some intensive task
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            //update ui
//            NSLog(@"EXECUTED");
//        });
//    });
    
    NSLog(@"1");
    dispatch_queue_t sharedQueue = dispatch_queue_create("working", 0);
    dispatch_async(sharedQueue, ^{
        NSLog(@"2");
        dispatch_sync(sharedQueue, ^{
            NSLog(@"3 NEVER EXECUTED");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
    // 1 2 5, 1 5 2
}

- (void)issueCase2 {
    
}

@end
