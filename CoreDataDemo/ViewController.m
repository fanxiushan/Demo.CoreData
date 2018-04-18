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
#import <Masonry.h>

@interface ViewController () {
    FRDataManager *dataManager;
    NSManagedObjectContext *context;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataManager = [FRDataManager shareInstance];
    context = [dataManager frmanagedObjectContext];

    NSMutableArray *btnArr = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor purpleColor]];
        [self.view addSubview:btn];
        [btnArr addObject:btn];
    }

    [(UIButton *)[btnArr objectAtIndex:0] setTitle:@"INSERT" forState:UIControlStateNormal];
    [(UIButton *)[btnArr objectAtIndex:0] addTarget:self action:@selector(insert:) forControlEvents:UIControlEventTouchUpInside];

    [(UIButton *)[btnArr objectAtIndex:1] setTitle:@"DELETE" forState:UIControlStateNormal];
    [(UIButton *)[btnArr objectAtIndex:1] addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];

    [(UIButton *)[btnArr objectAtIndex:2] setTitle:@"UPDATE" forState:UIControlStateNormal];
    [(UIButton *)[btnArr objectAtIndex:2] addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpInside];

    [(UIButton *)[btnArr objectAtIndex:3] setTitle:@"SELECT" forState:UIControlStateNormal];
    [(UIButton *)[btnArr objectAtIndex:3] addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];

    [btnArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.top.equalTo(@50);
    }];
    [btnArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:30 tailSpacing:30];

}

static int user_id = 0;

- (void)insert:(UIButton *)sender {
    User *user = [NSEntityDescription insertNewObjectForEntityForName:[User entityName] inManagedObjectContext:context];
    user.name = [NSString stringWithFormat:@"user%d",user_id];
    user.gender = kGenderUnknown;
    NSError *err = nil;
    if (![context save:&err]) {
        NSLog(@"err = %@",err);
    }
    user_id++;
}

- (void)delete:(UIButton *)sender {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[User entityName]];
    NSError *fetchError = nil;
    NSArray *results = [context executeFetchRequest:request error:&fetchError];
    for (User *user in results) {
        [context deleteObject:user];
    }
    NSSet *deletedObjects = [context deletedObjects];
    NSLog(@"before save deletedObjects = %@",deletedObjects);
    NSError *saveErr = nil;
    if (![context save:&saveErr]) {
        NSLog(@"saveErr = %@",saveErr);
    }
    NSLog(@"after save deletedObjects = %@",deletedObjects);
}

- (void)update:(UIButton *)sender {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[User entityName]];
    NSError *fetchError = nil;
    NSArray *results = [context executeFetchRequest:request error:&fetchError];
    NSLog(@"results = %@",results);
    for (User *user in results) {
        user.name = [NSString stringWithFormat:@"%@_update",user.name];
    }
    NSError *updateErr = nil;
    while ([context save:&updateErr] == NO) {
        NSLog(@"error = %@",updateErr);
    }
}

- (void)select:(UIButton *)sender {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[User entityName]];
    NSError *fetchError = nil;
    NSArray *results = [context executeFetchRequest:request error:&fetchError];
    NSLog(@"results = %@",results);
    for (User *user in results) {
        NSLog(@"user.name = %@",user.name);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
