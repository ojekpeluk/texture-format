//
//  HelloWorldLayer.m
//  TextureMemoryTest
//
//  Created by Firman Wijaya on 2/11/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        // Load images. Ideally these should be asynchronously loaded. But we do this just to compare mem consumption
        [[CCTextureCache sharedTextureCache] addImage:@"original.png"];
        [[CCTextureCache sharedTextureCache] addImage:@"rgba4444.png"];
        [[CCTextureCache sharedTextureCache] addImage:@"rgba4444fsa.png"];
        [[CCTextureCache sharedTextureCache] addPVRImage:@"pvrtc2.pvr.ccz"];
        [[CCTextureCache sharedTextureCache] addPVRImage:@"pvrtc4.pvr.ccz"];
        [[CCTextureCache sharedTextureCache] addPVRImage:@"rgb565.pvr.ccz"];
        [[CCTextureCache sharedTextureCache] addPVRImage:@"rgb888.pvr.ccz"];
        [[CCTextureCache sharedTextureCache] addPVRImage:@"rgba4444fsa.pvr.ccz"];
        [[CCTextureCache sharedTextureCache] addPVRImage:@"rgba4444fs.pvr.ccz"];
        [[CCTextureCache sharedTextureCache] addPVRImage:@"rgba5551fs.pvr.ccz"];
        [[CCTextureCache sharedTextureCache] addPVRImage:@"rgba5551fsa.pvr.ccz"];
        
        [[CCTextureCache sharedTextureCache] dumpCachedTextureInfo];
	}
	return self;
}

-(void) onEnter{
    [[CCTouchDispatcher sharedDispatcher] addStandardDelegate:self priority:0];
    [super onEnter];
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    static int counter = 1;
    CGSize ws = [CCDirector sharedDirector].winSize;
    // Don't forget to set this...
    [CCTexture2D PVRImagesHavePremultipliedAlpha:TRUE];
    if(counter == 1){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"original.png"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"Original" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        ++counter;
    }else if(counter == 2){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"rgba4444.png"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"RGBA4444" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        ++counter;
    }else if(counter == 3){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"rgba4444fs.pvr.ccz"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"RGBA4444 FS" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        counter++;
    }else if(counter == 4){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"rgba4444fsa.png"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"RGBA4444 FSA" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        ++counter;
    }else if(counter == 5){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"rgba4444fsa.pvr.ccz"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"RGBA4444 FSA PVR Compressed" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        counter++;
    }else if(counter == 6){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_PVRTC4];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"pvrtc4.pvr.ccz"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"PVRTC4" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        ++counter;
    }else if(counter == 7){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_PVRTC2];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"pvrtc2.pvr.ccz"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"PVRTC2" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        ++counter;
    }else if(counter == 8){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB888];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"rgb888.pvr.ccz"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"RGB888" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        ++counter;
    }else if(counter == 9){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"rgb565.pvr.ccz"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"RGB 565" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        counter++;
    }else if(counter == 10){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"rgba5551fs.pvr.ccz"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"RGB 5551 FS" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        counter++;
    }else if(counter == 11){
        [self removeAllChildrenWithCleanup:TRUE];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *sprite = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"rgba5551fsa.pvr.ccz"]];
        sprite.position = ccp(sprite.contentSize.width/2, sprite.contentSize.height/2);
        [self addChild:sprite];
        CCLabelTTF *lbl = [CCLabelTTF labelWithString:@"RGB 5551 FSA" fontName:@"Arial" fontSize:15];
        lbl.position = ccp(ws.width/2, ws.height - lbl.contentSize.height/2);
        [self addChild:lbl];
        counter = 1;
    }
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
