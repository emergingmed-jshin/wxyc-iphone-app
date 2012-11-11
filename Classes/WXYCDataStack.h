//
//  WXYCDataStack.h
//  WXYCapp
//
//  Created by Jake on 10/27/10.
//  Copyright 2010 WXYC. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface WXYCDataStack : NSObject {
	NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
	
	NSURL *storeURL;
}

@property (nonatomic, strong) NSURL *storeURL;

- (NSManagedObjectContext *) managedObjectContext;
- (NSManagedObjectModel *) managedObjectModel;
- (NSPersistentStoreCoordinator *) persistentStoreCoordinator;

+ (WXYCDataStack*)sharedInstance;

@end