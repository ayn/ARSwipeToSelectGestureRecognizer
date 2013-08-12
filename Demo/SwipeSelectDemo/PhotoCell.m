//
//  PhotoCell.m
//  Selective Show
//
//  Created by Andrew Ng on 6/29/13.
//  Copyright (c) 2013 Andrew Ng. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.selected = NO;
    }
    return self;
}

- (void)toggleSelected
{
    NSLog(@"selected 1=%d", self.selected);
    self.selected = !self.selected;
    NSLog(@"selected 2=%d", self.selected);
    self.alpha = self.selected ? 0.5 : 1.0;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
