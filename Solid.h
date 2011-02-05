//
//  Solid.h
//  tzkp
//
//  Created by Jared Beck on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Solid : NSObject {
	NSString *solidName;
}

- (id)init;
- (void)render;

@end
