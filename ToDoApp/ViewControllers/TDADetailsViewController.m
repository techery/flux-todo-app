//
//  TDADetailsViewController.m
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/8/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import <libextobjc/EXTScope.h>
#import <libextobjc/EXTKeyPathCoding.h>

#import "TDADetailsViewController.h"
#import "TDADomain.h"
#import "TDAToDoStoreActions.h"

@interface TDADetailsViewController ()

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, strong) TDADomain *ioc_domain;

@end

@implementation TDADetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.item) {
        self.title = @"Update";
        self.textField.text = self.item.text;
    } else {
        self.title = @"Create";
    }
    [self.textField becomeFirstResponder];
}

- (IBAction)save:(UIBarButtonItem *)saveBarButton {
    if (self.textField.text.length > 0) {
        if (self.item) {
            [self updateItem];
        } else {
            [self createItem];
        }
    }
}

- (void)updateItem {
    TDAToDoItem *newItem = [TDAToDoItem create:^(TDAToDoItemBuilder *builder) {
        builder.uuid = self.item.uuid;
        builder.isDone = self.item.isDone;
        builder.createdAt = self.item.createdAt;
        builder.text = self.textField.text;
    }];
    TDAOnToDoItemUpdate *updateAction = [TDAOnToDoItemUpdate create:^(TDAOnToDoItemUpdateBuilder *builder) {
        builder.item = newItem;
    }];
    [self.ioc_domain dispatchAction:updateAction];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)createItem {
    TDAOnToDoItemInsert *createItemAction = [TDAOnToDoItemInsert create:^(TDAOnToDoItemInsertBuilder *builder) {
        builder.text = self.textField.text;
    }];
    [self.ioc_domain dispatchAction:createItemAction];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
