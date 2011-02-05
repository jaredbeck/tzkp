//
//  Solid.h
//  tzkp
//
//  Created by Jared Beck on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Coord;

@interface Solid : NSObject {
  GLfloat vx; // velocity
  GLfloat vy;
  GLfloat vz;
	NSString *solidName;
  Coord *center;
}

- (id)init;
- (void)render;
- (void)setCenter:(Coord*) c;
- (void)addVelocityToCenter;
- (void)addGravityToVelocity;

@end
