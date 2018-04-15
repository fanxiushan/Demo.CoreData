//
//  FRDataManager.h
//  CoreDataDemo
//
//  Created by Fan's iMac  on 2018/4/15.
//  Copyright © 2018年 Fan's iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface FRDataManager : NSObject

+ (id)shareInstance;

- (NSManagedObjectContext *)frmanagedObjectContext;

@end
