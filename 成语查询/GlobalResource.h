//
//  GlobalResource.h
//  成语查询
//
//  Created by Apple on 10/13/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalResource : NSObject

+ (instancetype)sharedInstance;
@property (nonatomic, strong) NSMutableArray * array;
@property (strong, nonatomic) NSMutableArray * contentArray;
@property (strong, nonatomic) NSMutableArray * pronounceArray;
@property (assign, nonatomic) NSInteger detailRow;

@end
