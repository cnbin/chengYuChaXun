//
//  ViewController.h
//  成语查询
//
//  Created by Apple on 10/13/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *content;
@property (strong, nonatomic) NSString *data;
@property (strong, nonatomic) NSMutableArray * array;
@property (strong,nonatomic) NSMutableData * receiveData;
@end

