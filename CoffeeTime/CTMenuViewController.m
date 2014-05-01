//
//  CTMenuViewController.m
//  CoffeeTime
//
//  Created by David Canavan on 29/04/2014.
//  Copyright (c) 2014 Fliphouse. All rights reserved.
//

#import "CTMenuViewController.h"

@implementation CTMenuViewController
{
    NSArray *_menuStrings;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _menuStrings = [NSArray arrayWithObjects:@"Profile", @"Pick a Place", nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseId = @"MenuCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        cell.backgroundView.backgroundColor = [UIColor clearColor];
    }
    
    // Configure the cell and contents
    UILabel *label = (UILabel *) [cell viewWithTag:100];
    label.text = [_menuStrings objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menuStrings count];
}

// Hack to prevent blank table cells showing up at the bottom
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
