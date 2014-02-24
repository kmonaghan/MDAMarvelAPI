//
//  CBPTableViewController.h
//  Marvel API
//
//  Created by Karl Monaghan on 13/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@class MDAObject;

@interface CBPTableViewController : UIViewController
@property (strong, nonatomic) UITableView *tableView;

- (void)loadSections:(MDAObject *)object;
@end
