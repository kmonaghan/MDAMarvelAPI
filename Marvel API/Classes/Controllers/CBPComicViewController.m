//
//  CBPComicViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "NSURLSessionDataTask+MarvelDeveloperAPI.h"
#import "UIImageView+AFNetworking.h"

#import "CBPComicViewController.h"

#import "MDAComic.h"
#import "MDAImage.h"

@interface CBPComicViewController ()
@property (strong, nonatomic) MDAComic *comic;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation CBPComicViewController

- (id)initWithComic:(MDAComic *)comic
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _comic = comic;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:scrollView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|"
                                                                       options:0
                                                                       metrics:nil
                                                                        views:@{@"scrollView": scrollView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[scrollView]|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:@{@"scrollView": scrollView}]];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default"]];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [scrollView addSubview:self.imageView];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [scrollView addSubview:self.titleLabel];
    
    NSDictionary *views = @{@"imageView": self.imageView,
                            @"titleLabel": self.titleLabel};
    
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView(150)][titleLabel]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[imageView]|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:views]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[titleLabel]|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:views]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self loadComicView];
    
    [self loadComic];
}

- (void)loadComicView
{
    [self.imageView setImageWithURL:self.comic.thumbnail.url
                   placeholderImage:[UIImage imageNamed:@"default"]];
    
    self.titleLabel.text = self.comic.title;
    
}

- (void)loadComic
{
    __weak typeof(self) blockSelf = self;
    
    [NSURLSessionDataTask fetchComicWithId:self.comic.comicId
                                withhBlock:^(MDAComic *comic, NSError *error) {
                                    blockSelf.comic = comic;
                                    
                                    [blockSelf loadComicView];
        
    }];
}
@end
