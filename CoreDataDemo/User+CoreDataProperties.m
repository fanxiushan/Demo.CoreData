//
//  User+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by Fan's iMac  on 2018/4/15.
//  Copyright © 2018年 Fan's iMac. All rights reserved.
//
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"User"];
}

@dynamic name;
@dynamic gender;

@end
