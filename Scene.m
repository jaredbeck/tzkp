/*
     File: Scene.m
 Abstract:  A delegate object used by MyOpenGLView and MainController to 
 render a simple scene.
 
  Version: 1.1
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2010 Apple Inc. All Rights Reserved.
 
*/

#import "Scene.h"
#import "Texture.h"
#import <OpenGL/glu.h>
#import "Tetrahedron.h"
#import "Cube.h"

static double dtor( double degrees )
{
    return degrees * M_PI / 180.0;
}

@implementation Scene

- (id) init
{
    self = [super init];
    if (self) {
		textureName = 0;
        animationPhase = 0.0;
        rollAngle = 0.0;
        sunAngle = 135.0;
        wireframe = NO;
    } 
    return self;
}

- (void)dealloc
{
	[texture release];
    [super dealloc];
}

- (float)rollAngle
{
    return rollAngle;
}

- (void)setRollAngle:(float)newRollAngle
{
    rollAngle = newRollAngle;
}

- (float)sunAngle
{
    return sunAngle;
}

- (void)setSunAngle:(float)newSunAngle
{
    sunAngle = newSunAngle;
}

- (void)advanceTimeBy:(float)seconds
{
    float phaseDelta = seconds - floor(seconds);
    float newAnimationPhase = animationPhase + 0.015625 * phaseDelta;
    newAnimationPhase = newAnimationPhase - floor(newAnimationPhase);
    [self setAnimationPhase:newAnimationPhase];
}

- (void)setAnimationPhase:(float)newAnimationPhase
{
    animationPhase = newAnimationPhase;
}

- (void)toggleWireframe
{
    wireframe = !wireframe;
}

- (void)setViewportRect:(NSRect)bounds
{
	glViewport(0, 0, bounds.size.width, bounds.size.height);
	
	glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(30, bounds.size.width / bounds.size.height, 1.0, 1000.0);
	glMatrixMode(GL_MODELVIEW);
}

/* This method renders our scene. The main thing to note is that we've 
 factored the drawing code out of the NSView subclass so that the full-screen 
 and non-fullscreen views share the same states for rendering (and MainController 
 can use it when rendering in full-screen mode on pre-10.6 systems). */
- (void)render
{	
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);

  glClearColor(0.5, 0.5, 0.5, 0.5);
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  
  glPushMatrix();
	
	// Back the camera off a bit
	glTranslatef(0.0, 0.0, -7.0);

  
  glPushMatrix();
  glRotatef(animationPhase * 360.0 * 5, 0.0, 1.0, 0.0);
  //glTranslatef(0.0f, animationPhase * -10.0, 0.0f);
  
  Tetrahedron *t = [[Tetrahedron alloc] init];
  [t render];
  
  glPushMatrix();
  
  glTranslatef(-0.5f, 0.5f, -0.5f); // center the cube over the pyramid
  
  Cube *c = [[Cube alloc] init];
  [c render];
  
  glPopMatrix(); // centering
  
  glPopMatrix(); // rotation
  
  glPopMatrix(); // back the camera off
}

@end
