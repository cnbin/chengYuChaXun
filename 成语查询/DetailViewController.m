//
//  DetailViewController.m
//  成语查询
//
//  Created by Apple on 10/13/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "DetailViewController.h"
#import "GlobalResource.h"
#import <QuartzCore/QuartzCore.h>
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"成语解释";
    self.view.backgroundColor = [UIColor whiteColor];

    _textView = [[UITextView alloc]initWithFrame:CGRectMake(20,80,self.view.frame.size.width-40,60)];
    _textView.layer.borderColor = [UIColor grayColor].CGColor;
    _textView.layer.borderWidth =1.0;
    _textView.layer.cornerRadius =5.0;
    _textView.editable = NO;
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.view addSubview:_textView];
    _textView.text = [[GlobalResource sharedInstance].contentArray objectAtIndex:[GlobalResource sharedInstance].detailRow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
