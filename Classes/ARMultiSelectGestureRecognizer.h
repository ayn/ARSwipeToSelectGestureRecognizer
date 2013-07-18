//
//  ARMultiSelectGestureRecognizer.h
//
//  Created by Ray Tsaihong on 6/28/13.
//  Copyright (c) 2013 Andrew Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface ARMultiSelectGestureRecognizer : UIGestureRecognizer
- (ARMultiSelectGestureRecognizer *)initWithTarget:(id)target action:(SEL)action toggleSelectedHandler:(void (^)(UICollectionViewCell *cell))handler;
@end