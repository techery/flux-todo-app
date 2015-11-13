//
//  TDADetailsViewController.h
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/8/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDAToDoItem.h"

@interface TDADetailsViewController : UIViewController

@property (nonatomic, strong) TDAToDoItem *item;

@end
