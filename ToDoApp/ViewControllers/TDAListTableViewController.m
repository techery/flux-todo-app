//
//  TDAListTableViewController.m
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/13/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import <libextobjc/EXTScope.h>
#import <libextobjc/EXTKeyPathCoding.h>

#import "TDAListTableViewController.h"
#import "TDADomain.h"
#import "TDAToDoStore.h"
#import "TDAToDoItem.h"
#import "TDAToDoStoreActions.h"

#import "NSArray+Functional.h"

#import "TDADetailsViewController.h"

#import <FBKVOController.h>

static NSString *const kTDAListTableViewControllerCellIdentifier = @"TDACellIdentifier";

typedef NS_ENUM(NSInteger, TDAListTableViewControllerMode){
    TDAListTableViewControllerModeToDo,
    TDAListTableViewControllerModeDone
};

@interface TDAListTableViewController ()

@property (nonatomic, strong) FBKVOController *storeObserver;

@property (nonatomic, strong) TDADomain *ioc_domain;
@property (nonatomic, strong) TDAToDoStore *store;

@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic, assign) TDAListTableViewControllerMode currentMode;
@property (nonatomic, strong) TDAToDoItem *selectedItem;

@end

@implementation TDAListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentMode = TDAListTableViewControllerModeToDo;
    self.tableView.tableFooterView = [UIView new];
    [self setupStoreObserving];
}

#pragma mark - Setup store observing

- (void)setupStoreObserving {
    self.store = [self.ioc_domain toDoStore];
    self.storeObserver = [[FBKVOController alloc] initWithObserver:self];
    
    @weakify(self);
    [self.storeObserver observe:self.store keyPath:@"state" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @strongify(self);
             [self.tableView reloadData];
        });
    }];
}

#pragma mark - Segmented control

- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            self.currentMode = TDAListTableViewControllerModeToDo;
            break;
        }
        case 1: {
            self.currentMode = TDAListTableViewControllerModeDone;
            break;
        }
        default:
            break;
    }
    [self.tableView reloadData];
}

#pragma mark - Filter items

- (NSArray *)filteredItems {
    NSArray *itemsArray = self.ioc_domain.toDoStore.state.items;
    return [itemsArray filter:^BOOL(TDAToDoItem *item) {
        BOOL filterValue = (self.currentMode == TDAListTableViewControllerModeDone);
        return item.isDone == filterValue;
    }];
}

#pragma mark - Teble View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self filteredItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTDAListTableViewControllerCellIdentifier];
    TDAToDoItem *item = [[self filteredItems] objectAtIndex:indexPath.row];
    cell.accessoryType = item.isDone ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = item.text;
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedItem = [[self filteredItems] objectAtIndex:indexPath.row];
    return indexPath;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        TDAToDoItem *item = [[self filteredItems] objectAtIndex:indexPath.row];
        TDAOnToDoItemDelete *deleteAction = [TDAOnToDoItemDelete create:^(TDAOnToDoItemDeleteBuilder *builder) {
            builder.item = item;
        }];
        [self.ioc_domain dispatchAction:deleteAction];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    TDAToDoItem *item = [[self filteredItems] objectAtIndex:indexPath.row];
    TDAOnToDoItemMarkAsDone *markDoneAction = [TDAOnToDoItemMarkAsDone create:^(TDAOnToDoItemMarkAsDoneBuilder *builder) {
        builder.item = item;
    }];
    [self.ioc_domain dispatchAction:markDoneAction];
}

#pragma mark - Prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TDADetailsViewController *detailsViewController = (TDADetailsViewController *)segue.destinationViewController;
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        detailsViewController.item = self.selectedItem;
    } else {
        detailsViewController.item = nil;
    }
}

@end
