//
//  TDAListTableViewController.m
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/13/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import "TDAListTableViewController.h"
#import "TDADomain.h"

@interface TDAListTableViewController ()

@property (nonatomic, strong) TDADomain *ioc_domain;

@end

@implementation TDAListTableViewController

#pragma mark- Teble View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
