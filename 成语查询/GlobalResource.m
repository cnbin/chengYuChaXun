//
//  GlobalResource.m
//  成语查询
//
//  Created by Apple on 10/13/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "GlobalResource.h"

@implementation GlobalResource
__strong static GlobalResource *share = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        share = [[super allocWithZone:NULL] init];
    });
    return share;
}
@end
