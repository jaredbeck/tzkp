//
//  Cube.m
//  tzkp
//
//  Created by Jared Beck on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Cube.h"

@implementation Cube

- (void)render
{	
	// sides of cube
	glBegin(GL_QUAD_STRIP);
	{
		glColor3f(0.0f,1.0f,0.0f); // green
		glVertex3f( 1.0f, 1.0f, 1.0f);
		glVertex3f( 1.0f, 0.0f, 1.0f);
		glColor3f(0.0f,0.0f,1.0f); // blue
		glVertex3f( 1.0f, 1.0f, 0.0f);
		glVertex3f( 1.0f, 0.0f, 0.0f);
		glColor3f(1.0f,1.0f,0.0f); // yellow
		glVertex3f( 0.0f, 1.0f, 0.0f);
		glVertex3f( 0.0f, 0.0f, 0.0f);
		glColor3f(0.0f,1.0f,0.0f); // green
		glVertex3f( 0.0f, 1.0f, 1.0f);
		glVertex3f( 0.0f, 0.0f, 1.0f);
		glColor3f(0.0f,0.0f,0.0f); // white
		glVertex3f( 1.0f, 1.0f, 1.0f);
		glVertex3f( 1.0f, 0.0f, 1.0f);
	}
	glEnd();
	
	// bottom of cube
	glBegin(GL_QUADS);
	{
		glColor3f(1.0f,0.0f,0.0f);                	// set color to red
		glVertex3f( 0.0f, 0.0f, 0.0f); // 5
		glVertex3f( 1.0f, 0.0f, 0.0f); // 3
		glVertex3f( 1.0f, 0.0f, 1.0f); // 1
		glVertex3f( 0.0f, 0.0f, 1.0f); // 7
	}
	glEnd();
}

@end
