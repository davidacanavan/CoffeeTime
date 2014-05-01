//
//  CTMenuViewController.h
//  CoffeeTime
//
//  Created by David Canavan on 29/04/2014.
//  Copyright (c) 2014 Fliphouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
