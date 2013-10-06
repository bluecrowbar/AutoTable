//
//  BCBViewController.m
//  AutoTable
//
//  Created by Steven Vandeweghe on 10/5/13.
//  Copyright (c) 2013 Blue Crowbar. All rights reserved.
//

#import "BCBViewController.h"
#import "BCBCell.h"

#define ROWS 1000

@interface BCBViewController ()

@property NSArray *content;

@end

@implementation BCBViewController {
	id _token;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSMutableArray *content = [NSMutableArray array];
	for (NSInteger i = 0; i < ROWS; i++) {
		if (i % 2 == 0) {
			[content addObject:@"Something short"];
		} else {
			[content addObject:@"Something long something long something long something long something long something long something long something long something long something long something long"];
		}
	}
	self.content = [content copy];
	
	self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
	
	__weak BCBViewController *weakSelf = self;
	_token = [[NSNotificationCenter defaultCenter] addObserverForName:UIContentSizeCategoryDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
		[weakSelf.tableView reloadData];
	}];
}


- (void)dealloc
{
	if (_token) {
		[[NSNotificationCenter defaultCenter] removeObserver:_token];
	}
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return ROWS;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	BCBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	cell.label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
	cell.label.text = self.content[indexPath.row];
	[cell.contentView setNeedsLayout];
	[cell.contentView layoutIfNeeded];
	CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
	return height + 1;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	BCBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	cell.label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
	cell.label.text = self.content[indexPath.row];
	return cell;
}

@end
