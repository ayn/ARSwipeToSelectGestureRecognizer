# ARMultiSelectGestureRecognizer

## Description

This is a UIGestureRecognizer subclass to enable Swipe-to-Select/Deselect with a UICollectionView.

## Adding to your project


The easiest way to add `ARMultiSelectGestureRecognizer` to your project is via CocoaPods:

`pod 'ARMultiSelectGestureRecognizer'`

Alternatively you could copy all the files in the `Classes/` directory into your project. Be sure 'Copy items to destination group's folder' is checked.

#### _We haven't submitted the pull request to CocoaPod Specs yet, in the meantime you can do:_

`pod 'ARMultiSelectGestureRecognizer', :git => 'https://github.com/ayn/ARMultiSelectGestureRecognizer.git'`

## Use

1. Import the header: `#import "ARMultiSelectGestureRecognizer.h"`
2. Create an instance of `ARMultiSelectGestureRecognizer`, pass in a block to handle toggling `UICollectionViewCell`

####Instatiation, in your UICollectionViewController:
```` objective-c

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.allowsSelection = self.collectionView.allowsMultipleSelection = YES;

    // Do any additional setup after loading the view.
    ARMultiSelectGestureRecognizer *gestureRecognizer = [[ARMultiSelectGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:) toggleSelectedHandler:^(UICollectionViewCell *cell) {
        // Punt toggling logic to our UICollectionViewCell subclass
        PhotoCell *photoCell = (PhotoCell *)cell;
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

