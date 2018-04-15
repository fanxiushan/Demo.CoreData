//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Fan's iMac  on 2018/4/15.
//  Copyright © 2018年 Fan's iMac. All rights reserved.
//

#import "ViewController.h"
#import "FRDataManager.h"
#import "User+CoreDataClass.h"
#import "User+CoreDataProperties.h"

@interface ViewController () {
    FRDataManager *dataManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataManager = [FRDataManager shareInstance];
    NSManagedObjectContext *context = [dataManager frmanagedObjectContext];
    User *user = [NSEntityDescription insertNewObjectForEntityForName:[User entityName] inManagedObjectContext:context];
    user.name = @"fan";
    user.gender = kGenderUnknown;
    NSError *err = nil;
    if (![context save:&err]) {
        NSLog(@"err = %@",err);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
