//
//  SelectPhotoViewController.h
//  SwipeSelectDemo
//
//  Created by Ray Tsaihong on 8/5/13.
//  Copyright (c) 2013 Ray Tsaihong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface SelectPhotoViewController : UICollectionViewController

@property (nonatomic, strong) ALAssetsGroup *group;

@end
