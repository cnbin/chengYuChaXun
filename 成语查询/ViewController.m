//
//  ViewController.m
//  成语查询
//
//  Created by Apple on 10/13/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewController.h"
#import "GlobalResource.h"
#import "DKCircleButton.h"
@interface ViewController () {
      DKCircleButton *button1;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"成语查询";
    self.view.backgroundColor = [UIColor colorWithRed:0.29 green:0.59 blue:0.81 alpha:1];
    button1 = [[DKCircleButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    
    button1.center = CGPointMake(self.view.frame.size.width/2, 200);
    button1.titleLabel.font = [UIFont systemFontOfSize:22];
    
    [button1 setTitleColor:[UIColor colorWithWhite:1 alpha:1.0] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor colorWithWhite:1 alpha:1.0] forState:UIControlStateSelected];
    [button1 setTitleColor:[UIColor colorWithWhite:1 alpha:1.0] forState:UIControlStateHighlighted];
    
    [button1 setTitle:NSLocalizedString(@"查询", nil) forState:UIControlStateNormal];
    [button1 setTitle:NSLocalizedString(@"查询", nil) forState:UIControlStateSelected];
    [button1 setTitle:NSLocalizedString(@"查询", nil) forState:UIControlStateHighlighted];
    
    [button1 addTarget:self action:@selector(tapOnButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
}

- (void)tapOnButton {
    _data = _content.text;
    NSString *dataUTF8 = [_data stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *httpUrl = @"http://apis.baidu.com/netpopo/idiom/chengyu";
    NSString *httpArg  = [[NSString alloc]initWithFormat: @"keyword=%@&appkey=1307ee261de8bbcf83830de89caae73f",dataUTF8];
    [self request: httpUrl withHttpArg: httpArg];
    [GlobalResource sharedInstance].array = [[NSMutableArray alloc]init];
    [GlobalResource sharedInstance].contentArray = [[NSMutableArray alloc]init];
    [GlobalResource sharedInstance].pronounceArray = [[NSMutableArray alloc]init];
}


- (void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
    
    self.receiveData =nil;
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"c33bdd6ad06c082a12a171edc323cc9a" forHTTPHeaderField: @"apikey"];
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:request delegate:self];
    
    if (connection) {
        
    }
}

#pragma mark 接受到响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    if (!self.receiveData) {
        self.receiveData = [NSMutableData data];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {

    [self.receiveData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError: (NSError *)error {
    
    NSLog(@"%@",[error localizedDescription]);
}

- (void)connectionDidFinishLoading: (NSURLConnection*) connection {
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.receiveData  options:NSJSONReadingMutableLeaves error:nil];
    NSArray * dicArray = [dic objectForKey:@"data"];
    for (int i =0 ; i<dicArray.count; i++) {
       [[GlobalResource sharedInstance].array addObject:[[dicArray objectAtIndex:i]objectForKey:@"name"]];
       [[GlobalResource sharedInstance].contentArray addObject:[[dicArray objectAtIndex:i]objectForKey:@"content"]];
       [[GlobalResource sharedInstance].pronounceArray addObject:[[dicArray objectAtIndex:i]objectForKey:@"pronounce"]];
    
    }
    MainTableViewController * main = [[MainTableViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
