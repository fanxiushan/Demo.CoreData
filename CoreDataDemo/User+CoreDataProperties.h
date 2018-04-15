//
//  User+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by Fan's iMac  on 2018/4/15.
//  Copyright © 2018年 Fan's iMac. All rights reserved.
//
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t gender;

@end

NS_ASSUME_NONNULL_END
