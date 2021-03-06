//
//  Created by Jake Bromberg.
//  Copyright WXYC 2009-10. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SimpleWebBrowser : UIViewController <UIWebViewDelegate, UIActionSheetDelegate>

- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

@property (nonatomic, copy) NSURL *url;

@end
