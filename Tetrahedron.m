//
//  Tetrahedron.m
//  tzkp
//
//  Created by Jared Beck on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Tetrahedron.h"
#import "Coord.h"

@implementation Tetrahedron

- (id) init
{
  self = [super init];
  if (self) {
    solidName = @"Untitled Tetrahedron";
  } 
  return self;
}

- (void)render
{	
  Coord *c = self->center;
  GLfloat cx = c->x;
  GLfloat cy = c->y;
  GLfloat cz = c->z;
  
  // Draw a pyramid
  glBegin(GL_TRIANGLE_FAN);
  {
    glColor3f(1.0f,0.0f,0.0f);                	// set color to red
    glVertex3f( cx + 0.0f, cy + 0.3f, cz + 0.0f);
    glColor3f(0.0f,1.0f,0.0f);                	// set color to green
    glVertex3f( cx + -0.5f, cy + -0.5f, cz + 0.5f);
    glColor3f(1.0f,1.0f,0.0f);                	// set color to yellow
    glVertex3f( cx +  0.5f, cy + -0.5f, cz + 0.5f);
    glColor3f(0.0f,0.0f,1.0f);                	// set color to blue
    glVertex3f( cx +  0.5f, cy + -0.5f, cz + -0.5f);
    glColor3f(1.0f,1.0f,1.0f);                	// set color to white
    glVertex3f( cx +  -0.5f, cy + -0.5f, cz + -0.5f);
    glColor3f(0.0f,1.0f,0.0f);                	// set color to green
    glVertex3f( cx + -0.5f, cy + -0.5f, cz + 0.5f);
    
  }
  glEnd();
}

@end
