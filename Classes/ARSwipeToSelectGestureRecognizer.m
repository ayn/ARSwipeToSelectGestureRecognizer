//
//  ARSwipeToSelectGestureRecognizer.m
//
//  Created by Andrew Ng on 6/29/13.
//  Copyright (c) 2013 Andrew Ng. All rights reserved.
//

#import "ARSwipeToSelectGestureRecognizer.h"

@interface ARSwipeToSelectGestureRecognizer ()
@property (copy, nonatomic) void (^toggleSelectedHandler)(NSIndexPath *);
@property (nonatomic, assign) UIGestureRecognizerState state;
@property (nonatomic, strong) NSIndexPath *lastIndexPath;
@property (nonatomic, strong) NSIndexPath *initialIndexPath;
@property (nonatomic, assign) CGPoint initialPoint;
@end

@implementation ARSwipeToSelectGestureRecognizer

- (ARSwipeToSelectGestureRecognizer *)initWithTarget:(id)target action:(SEL)action toggleSelectedHandler:(void (^)(NSIndexPath *))handler
{
    if (self = [super initWithTarget:target action:action]) {
        self.toggleSelectedHandler = handler;
    }
    return self;
}

// Touch began on view so save the start point
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if ([touches count] != 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    } else if (!self.lastIndexPath) {
        self.state = UIGestureRecognizerStatePossible;
        UICollectionView *cv = (UICollectionView *) self.view;
        self.initialPoint = [[touches anyObject] locationInView:self.view];
        self.initialIndexPath = [cv indexPathForItemAtPoint:self.initialPoint];
    }
}

// Track the move of the current gesture
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];

    UICollectionView *cv = (UICollectionView *) self.view;
    NSIndexPath *currentPath = [cv indexPathForItemAtPoint:[[touches anyObject] locationInView:self.view]];
    
    if (self.state == UIGestureRecognizerStateBegan || self.state == UIGestureRecognizerStateChanged) {
        self.state = UIGestureRecognizerStateChanged;
        if ([self.lastIndexPath compare:currentPath] != NSOrderedSame) {
            // toggle cell when we enter a different cell
            self.lastIndexPath = currentPath;
            [self toggleCellAtIndexPath:self.lastIndexPath];
        } else {
            // we need to set lastIndexPath if currentPath became null for some unknown reason
            if (self.lastIndexPath == nil) self.lastIndexPath = currentPath;
        }
    } else if (self.state == UIGestureRecognizerStatePossible){
        CGPoint currentPoint = [[touches anyObject] locationInView:self.view];
        if (fabsf(currentPoint.y - self.initialPoint.y) > 2.0 * fabsf(currentPoint.x - self.initialPoint.x)) {
            self.state = UIGestureRecognizerStateFailed;
            return;
        }
        // moved within initial cell
        self.state = UIGestureRecognizerStateBegan;
        [self toggleCellAtIndexPath:self.initialIndexPath];
    }
}

// Track the end of the gesture
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if (self.state == UIGestureRecognizerStatePossible) {
        // handle taps
        [self toggleCellAtIndexPath:self.initialIndexPath];

        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    
    if (self.state == UIGestureRecognizerStateFailed)
        return;

    self.state = UIGestureRecognizerStateRecognized;
    self.lastIndexPath = nil;
}

// The gesture will fail if touche was cancelled
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
}

- (void)reset
{
    [super reset];
    self.initialIndexPath = nil;
    self.lastIndexPath = nil;
    self.initialPoint = CGPointMake(0.0, 0.0);
}

# pragma mark - Private methods

- (void)toggleCellAtIndexPath:(NSIndexPath *)indexPath
{
    self.toggleSelectedHandler(indexPath);
}
@end
