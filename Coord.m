//
//  Coord.m
//  tzkp
//
//  Created by Jared Beck on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Coord.h"


@implementation Coord

- (id) init 
{
  self = [super init];
  if (self != nil) {
    x = 0.0f;
    y = 0.0f;
    z = 0.0f;
  }
  return self;
}

@end
