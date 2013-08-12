//
//  PhotoCell.h
//  Selective Show
//
//  Created by Andrew Ng on 6/29/13.
//  Copyright (c) 2013 Andrew Ng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UICollectionViewCell

- (void)toggleSelected;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
