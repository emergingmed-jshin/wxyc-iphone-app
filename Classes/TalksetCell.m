//
//  Talkset.m
//  WXYCapp
//
//  Created by Jake Bromberg on 3/6/12.
//  Copyright (c) 2012 WXYC. All rights reserved.
//

#import "TalksetCell.h"

@implementation TalksetCell

- (id)initWithEntity:(NSManagedObject *)entity {
	self = [super initWithEntity:entity];
	[self addText:@"TALKSET"];
	
	return self;
}

@end