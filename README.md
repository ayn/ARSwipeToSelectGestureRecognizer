# ARSwipeToSelectGestureRecognizer

## Description

This is a UIGestureRecognizer subclass to enable Swipe-to-Select/Deselect with a UICollectionView.

## Adding to your project


The easiest way to add `ARSwipeToSelectGestureRecognizer` to your project is via CocoaPods:

`pod 'ARSwipeToSelectGestureRecognizer'`

Alternatively you could copy all the files in the `Classes/` directory into your project. Be sure 'Copy items to destination group's folder' is checked.

#### _We haven't submitted the pull request to CocoaPod Specs yet, in the meantime you can do:_

`pod 'ARSwipeToSelectGestureRecognizer', :git => 'https://github.com/ayn/ARSwipeToSelectGestureRecognizer.git'`

## Use

1. Import the header: `#import "ARSwipeToSelectGestureRecognizer.h"`
2. Create an instance of `ARSwipeToSelectGestureRecognizer`, pass in a block to handle toggling `UICollectionViewCell`

####Instatiation, in your UICollectionViewController:
```` objective-c

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.allowsSelection = self.collectionView.allowsMultipleSelection = YES;

    // Do any additional setup after loading the view.
    ARSwipeToSelectGestureRecognizer *gestureRecognizer = [[ARSwipeToSelectGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:) toggleSelectedHandler:^(NSIndexPath *indexPath) {
        ARPhotoCell *photoCell = (ARPhotoCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        [photoCell toggleSelected];
    }];
    [self.collectionView addGestureRecognizer:gestureRecognizer];

}
````

## Demo project

_TBD_

## Co-Authors

- [Andrew Ng](http://github.com/ayn)
- [Ray Tsaihong](http://github.com/rmundo)

