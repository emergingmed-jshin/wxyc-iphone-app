//
//  PlaycutCell.m
//  WXYCapp
//
//  Created by Jake Bromberg on 3/6/12.
//  Copyright (c) 2012 WXYC. All rights reserved.
//

#import "PlaycutCell.h"
#import "Playcut.h"
#import "PlaycutViewController.h"

@implementation PlaycutCell

- (void) setEntity:(NSManagedObject *)entity {
	[super setEntity:entity];
	
	Playcut* playcut = (Playcut*)entity;
	self.textLabel.text = [playcut valueForKey:@"artist"];
	self.detailTextLabel.text = [playcut valueForKey:@"song"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	if (selected) {
		PlaycutViewController *detail = [[PlaycutViewController alloc] initWithPlaycut:(Playcut*)self.entity];
		detail.hidesBottomBarWhenPushed = YES;
		[[self.delegate navigationController] pushViewController:detail animated:YES];
	}
}

- (id)initWithEntity:(NSManagedObject *)entity {
	if (!(self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[[self class] description]]))
		return nil;
	[self setEntity:entity];

	return self;
}

@end