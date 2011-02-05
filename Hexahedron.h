//
//  Hexahedron.h
//  tzkp
//
//  Created by Jared Beck on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Solid.h"

@interface Hexahedron : Solid {
	NSString *freeb;
}

- (void)render;

@end
