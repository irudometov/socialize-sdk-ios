//
//  ButtonExampleViewController.m
//  Socialize
//
//  Created by Nathaniel Griswold on 6/24/12.
//  Copyright (c) 2012 Socialize. All rights reserved.
//

#import "ButtonExampleViewController.h"
#import <BlocksKit/BlocksKit.h>

static CGRect likeFrame = { { 240.f, 120.f }, { 0.f, 0.f } };

@implementation ButtonExampleViewController
@synthesize likeButton = _likeButton;
@synthesize entity = _entity;

- (id)initWithEntity:(id)entity {
    if (self = [super init]) {
        self.entity = entity;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __unsafe_unretained id weakSelf = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc ] initWithTitle:@"Done" style:UIBarButtonItemStyleDone handler:^(id sender) {
        [weakSelf dismissModalViewControllerAnimated:YES];
    }];
        
    self.likeButton = [[SZLikeButton alloc] initWithFrame:likeFrame entity:self.entity viewController:self];
    [self.view addSubview:self.likeButton];
}

@end
