//
//  CBPViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPViewController.h"

#import "NSURLSessionDataTask+MarvelDeveloperAPI.h"
#import "UIImageView+AFNetworking.h"

#import "MDAComic.h"
#import "MDAComicDataWrapper.h"
#import "MDAComicDataContainer.h"
#import "MDAImage.h"
#import "MDASearchParameters.h"

@interface CBPViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@end

@implementation CBPViewController

- (void)loadView
{
    [super loadView];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self reload];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Reload", nil)
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(reload)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)reload
{
    MDASearchParameters *search = [MDASearchParameters new];
    
    __weak typeof(self) blockSelf = self;
    
    [NSURLSessionDataTask fetchComicsWithSearch:(MDASearchParameters *)search withhBlock:^(MDAComicDataWrapper *data, NSError *error) {
        if (!error) {
            blockSelf.items = data.data.results;
            
            [blockSelf.tableView reloadData];
        } else {
            NSLog(@"error: %@", error);
        }
    }];

}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComicCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ComicCell"];
    }
    
    MDAComic *comic = self.items[indexPath.row];
    cell.textLabel.text = comic.title;
    cell.detailTextLabel.text = comic.descriptionText;
    
    [cell.imageView setImageWithURL:comic.thumbnail.url
                   placeholderImage:nil];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
