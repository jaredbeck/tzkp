//
//  Tetrahedron.m
//  tzkp
//
//  Created by Jared Beck on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tetrahedron.h"


@implementation Tetrahedron

- (void)render
{	
  // Draw a pyramid
  glBegin(GL_TRIANGLE_FAN);
  {
    glColor3f(1.0f,0.0f,0.0f);                	// set color to red
    glVertex3f(  0.0f,  0.3f, 0.0f);
    glColor3f(0.0f,1.0f,0.0f);                	// set color to green
    glVertex3f(-0.5f, -0.5f, 0.5f);
    glColor3f(1.0f,1.0f,0.0f);                	// set color to yellow
    glVertex3f( 0.5f, -0.5f, 0.5f);
    glColor3f(0.0f,0.0f,1.0f);                	// set color to blue
    glVertex3f( 0.5f, -0.5f, -0.5f);
    glColor3f(1.0f,1.0f,1.0f);                	// set color to white
    glVertex3f( -0.5f, -0.5f, -0.5f);
    glColor3f(0.0f,1.0f,0.0f);                	// set color to green
    glVertex3f(-0.5f, -0.5f, 0.5f);
    
  }
  glEnd();
}

@end
