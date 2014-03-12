//
//  CBPComicViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "UIImageView+AFNetworking.h"

#import "CBPComicViewController.h"

#import "MDAComic.h"
#import "MDAComicSummary.h"
#import "MDAImage.h"

@interface CBPComicViewController ()
@property (strong, nonatomic) MDAComic *comic;
@property (strong, nonatomic) MDAComicSummary *comicSummary;
@property (strong, nonatomic) UITextView *description;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIView *tableHeaderView;
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

- (id)initWithComicSummary:(MDAComicSummary *)comicSummary
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _comicSummary = comicSummary;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.tableHeaderView = [UIView new];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default"]];
    self.imageView.frame = CGRectMake(23.0f, 10.0f, 270.0f, 200.0f);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.tableHeaderView addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 220.0f, 290.0f, 0)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tableView.frame) - 30.0f;
    
    [self.tableHeaderView addSubview:self.titleLabel];
    
    self.description = [[UITextView alloc] initWithFrame:CGRectMake(15.0f, 242.0f, 290.0f, 0)];
    self.description.editable = NO;
    self.description.scrollEnabled = NO;
    self.description.contentInset = UIEdgeInsetsMake(0, 15.0f, 0, 15.0f);
    
    [self.tableHeaderView addSubview:self.description];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (self.comic) {
        [self loadComicView];
    }
    
    [self loadComic];
}

- (void)loadComicView
{
    [self setupHeaderView];
    
    [self loadSections:self.comic];
    
    [self.tableView reloadData];
}

- (void)loadComic
{
    __weak typeof(self) blockSelf = self;
    
    NSInteger comicId = (self.comic) ? self.comic.comicId : [self.comicSummary resourceId];
    
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", nil)];
    
    [NSURLSessionDataTask fetchComicWithId:comicId
                                withBlock:^(MDAComic *comic, NSError *error) {
                                    [SVProgressHUD dismiss];
                                    
                                    if (!error) {
                                        blockSelf.comic = comic;
                                        
                                        [blockSelf loadComicView];
                                    } else {
                                        [CRToastManager showNotificationWithOptions:@{kCRToastTextKey: [error localizedDescription],
                                                                                      kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                                                                                      kCRToastBackgroundColorKey : [UIColor redColor]}
                                                                    completionBlock:nil];
                                    }
        
    }];
}

#pragma mark -
- (void)setupHeaderView
{
    [self.imageView setImageWithURL:[self.comic.thumbnail imageForResolution:MDAImageResolutionLandscapeXlarge]
                   placeholderImage:[UIImage imageNamed:@"comic-detail-default"]];
    
    self.titleLabel.text = self.comic.title;
    
    [self.titleLabel sizeToFit];

    self.description.attributedText = [[NSAttributedString alloc] initWithData:[self.comic.descriptionText dataUsingEncoding:NSUnicodeStringEncoding]
                                                                       options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType}
                                                            documentAttributes:nil
                                                                         error:nil];
    
    self.description.frame = CGRectMake(0, 10 + 200 + 10 + CGRectGetHeight(self.titleLabel.frame) + 10, CGRectGetWidth(self.tableView.frame), 0);
    
    [self.description sizeToFit];
    
    self.tableHeaderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 10 + 200 + 10 + CGRectGetHeight(self.titleLabel.frame) + 10 + CGRectGetHeight(self.description.frame) + 10);
    
    self.tableView.tableHeaderView = self.tableHeaderView;
}


@end
