//
//  MREntitiesConverter.h
//  WXYCapp
//
//  Created by Jake on 2/28/10.
//  Copyright 2010 WXYC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MREntitiesConverter : NSObject <NSXMLParserDelegate> {
    NSMutableString* resultString;
}

@property (nonatomic, retain) NSMutableString* resultString;
- (NSString*)convertEntiesInString:(NSString*)s;

@end
