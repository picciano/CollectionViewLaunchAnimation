//
//  DetailViewController.m
//  CollectionViewLaunchAnimation
//
//  Created by Anthony Picciano on 8/22/14.
//  Copyright (c) 2014 Anthony Picciano. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)close:(id)sender;

@end

@implementation DetailViewController

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
    self.label.text = self.labelString;
}

- (IBAction)close:(id)sender
{
    [self.view removeFromSuperview];
}

@end
