//
//  FRDataManager.m
//  CoreDataDemo
//
//  Created by Fan's iMac  on 2018/4/15.
//  Copyright © 2018年 Fan's iMac. All rights reserved.
//

#import "FRDataManager.h"

static FRDataManager *dataManager = nil;

@interface FRDataManager () {
    NSManagedObjectContext *context;
    NSPersistentStoreCoordinator *storeCoordinator;
    NSManagedObjectModel *managedObjectModel;
}

@end

@implementation FRDataManager

+ (id)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataManager = [[FRDataManager alloc] init];
    });
    return dataManager;
}

- (NSManagedObjectContext *)frmanagedObjectContext {
    if (nil ==  context) {
        context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    }
    [context setPersistentStoreCoordinator:[self persistentStoreCoordinator]];
    return context;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (nil == storeCoordinator) {
        storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    }
    NSString *sqlitePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    sqlitePath = [NSString stringWithFormat:@"%@/%@",sqlitePath,@"mysqlite.sqlite"];
    NSLog(@"sqlite path = %@",sqlitePath);
    NSURL *sqliteURL = [NSURL fileURLWithPath:sqlitePath isDirectory:NO];
    NSError *error = nil;
    [storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteURL options:nil error:&error];
    return storeCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (nil == managedObjectModel) {
        NSString *momdURLStr = [[NSBundle mainBundle] pathForResource:@"FRModel" ofType:@"momd"];
        managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:[NSURL URLWithString:momdURLStr]];
    }
    return managedObjectModel;
}




@end
