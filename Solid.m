//
//  Solid.m
//  tzkp
//
//  Created by Jared Beck on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Solid.h"
#import "Coord.h"

@implementation Solid

- (id) init
{
    self = [super init];
    if (self) {
      solidName = @"Untitled Solid";
      center = [[Coord alloc] init];
      vx = 0.0f;
      vy = 0.0f;
      vz = 0.0f;
    } 
    return self;
}

- (void)render
{	
  @throw [NSException exceptionWithName:@"InvocationOfAbstractMethod" reason:@"Please implement in child"  userInfo:nil];
}

-(void) setCenter: (Coord*) c
{
  self->center = c;
}

- (void)addVelocityToCenter
{
  self->center->x += self->vx;
  self->center->y += self->vy;
  self->center->z += self->vz;
}

- (void)addGravityToVelocity
{
  self->vy += -0.0001; // gravity constant
}

@end
