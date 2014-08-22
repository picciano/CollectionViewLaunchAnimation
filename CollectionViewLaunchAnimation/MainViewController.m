//
//  MainViewController.m
//  CollectionViewLaunchAnimation
//
//  Created by Anthony Picciano on 8/22/14.
//  Copyright (c) 2014 Anthony Picciano. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "MyCellView.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) DetailViewController *detailViewController;

@end

@implementation MainViewController

NSString * const kMyCellView = @"myCellView";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCellView" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kMyCellView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 52;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMyCellView forIndexPath:indexPath];
    
    [cell.label setText:[NSString stringWithFormat:@"%i", indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCellView *cell = (MyCellView *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    self.detailViewController = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
    self.detailViewController.labelString = [NSString stringWithFormat:@"%i", indexPath.row];
    [self.view.superview addSubview:self.detailViewController.view];
    
    // tap position relative to collection view
    float screenX = self.collectionView.frame.origin.x + cell.center.x;
    float screenY = self.collectionView.frame.origin.y + cell.center.y - self.collectionView.contentOffset.y;
    
    // tap position relative to view frame
    float translateX = (self.view.frame.size.width / -2.0) + screenX;
    float translateY = (self.view.frame.size.height / -2.0) + screenY;
    
    CATransform3D transform_detail = CATransform3DScale(CATransform3DMakeTranslation(translateX, translateY, 0.0), 0.0, 0.0, 0.0);
    CATransform3D transform_main = CATransform3DScale(CATransform3DMakeTranslation(-translateX * 5.0, -translateY * 5.0, 0.0), 5.0, 5.0, 5.0);
    
    self.detailViewController.view.layer.transform = transform_detail;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.detailViewController.view.layer.transform = CATransform3DIdentity;
        self.view.layer.transform = transform_main;
    } completion:^(BOOL finished) {
        self.view.layer.transform = CATransform3DIdentity;
    }];
}

@end
