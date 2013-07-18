//
//  MultiSelectGestureRecognizer.h
//  Selective Show
//
//  Created by Ray Tsaihong on 6/28/13.
//  Copyright (c) 2013 Andrew Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface ARMultiSelectGestureRecognizer : UIGestureRecognizer
- (ARMultiSelectGestureRecognizer *)initWithTarget:(id)target action:(SEL)action toggleSelectedHandler:(void (^)(UICollectionViewCell *cell))handler;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
@end
