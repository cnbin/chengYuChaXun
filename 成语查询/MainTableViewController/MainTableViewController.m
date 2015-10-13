//
//  MainTableViewController.m
//  成语查询
//
//  Created by Apple on 10/13/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "MainTableViewController.h"
#import "GlobalResource.h"
#import "DetailViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"成语";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[GlobalResource sharedInstance].array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.textLabel.text = [[GlobalResource sharedInstance].array objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [[GlobalResource sharedInstance].pronounceArray objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController * detail = [[DetailViewController alloc]init];
    [GlobalResource sharedInstance].detailRow = indexPath.row;
    [self.navigationController pushViewController:detail animated:YES];
    
}

@end
