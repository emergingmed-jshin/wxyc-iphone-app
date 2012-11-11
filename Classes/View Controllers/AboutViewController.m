//
//  Created by Jake Bromberg.
//  Copyright WXYC 2009-10. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSString* aboutTemplatePath = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"];
	NSURL* url = [NSURL fileURLWithPath:aboutTemplatePath];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	[(UIWebView *)self.view setDelegate:self];
	[(UIWebView *)self.view loadRequest:requestObj];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSLog(@"expected:%d, got:%d", UIWebViewNavigationTypeLinkClicked, navigationType);
	if (navigationType == UIWebViewNavigationTypeLinkClicked) {
		AboutViewController *webViewController = [[AboutViewController alloc] init];
		
		[[self navigationController] pushViewController:webViewController animated:YES];
		[((UIWebView *)webViewController.view) setScalesPageToFit:NO];
		[((UIWebView *)webViewController.view) loadRequest:request];
		
		return NO;
	}
	
	return YES;
}

@end