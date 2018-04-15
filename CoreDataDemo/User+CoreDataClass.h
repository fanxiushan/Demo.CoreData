//
//  User+CoreDataClass.h
//  CoreDataDemo
//
//  Created by Fan's iMac  on 2018/4/15.
//  Copyright © 2018年 Fan's iMac. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, UserGender) {
    kGenderUnknown,
    kGenderMen,
    kGenderWomen,
};

@interface User : NSManagedObject

+ (NSString *)entityName;

@end

NS_ASSUME_NONNULL_END

#import "User+CoreDataProperties.h"
