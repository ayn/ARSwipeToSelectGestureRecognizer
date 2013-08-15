# ARSwipeToSelectGestureRecognizer

![animatedgif](https://files.app.net/hjq6h7HO.gif)

## Description

This is a UIGestureRecognizer subclass to enable Swipe-to-Select/Deselect with a UICollectionView.

## Adding to your project


The easiest way to add `ARSwipeToSelectGestureRecognizer` to your project is via [CocoaPods](http://cocoapods.org):

`pod 'ARSwipeToSelectGestureRecognizer'`

Alternatively you could copy all the files in the `Classes/` directory into your project. Be sure 'Copy items to destination group's folder' is checked.

## Use

1. Import the header: `#import "ARSwipeToSelectGestureRecognizer.h"`
2. Create an instance of `ARSwipeToSelectGestureRecognizer`, pass in a block to handle toggling `NSIndexPath`

####Instatiation, in your UICollectionViewController:
```` objective-c

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.allowsSelection = self.collectionView.allowsMultipleSelection = YES;

    // Do any additional setup after loading the view.
    ARSwipeToSelectGestureRecognizer *gestureRecognizer = [[ARSwipeToSelectGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:) toggleSelectedHandler:^(NSIndexPath *indexPath) {
        if ([[self.collectionView indexPathsForSelectedItems] containsObject:indexPath]) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
            [self.collectionView cellForItemAtIndexPath:indexPath].alpha = 1.0;
        } else {
            [self.collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
            [self.collectionView cellForItemAtIndexPath:indexPath].alpha = 0.5;
        }
    }];
    [self.collectionView addGestureRecognizer:gestureRecognizer];


}
````

## Demo project

- A demo application that uses `ARSwipeToSelectGestureRecognizer` to select multiple photos to share with `UIActivityViewController` can be found in the [Demo](https://github.com/ayn/ARSwipeToSelectGestureRecognizer/tree/master/Demo) folder.
- [ARSwipeToSelectPickerController](https://github.com/ayn/ARSwipeToSelectPickerController) is a UIImagePickerController-like assets picker that utilizes ARMultiSelectGestureRecognizer for swipe-to-select.

## Co-Authors

- [Andrew Ng](http://github.com/ayn)
- [Ray Tsaihong](http://github.com/rmundo)



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/ayn/ARSwipeToSelectGestureRecognizer/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

