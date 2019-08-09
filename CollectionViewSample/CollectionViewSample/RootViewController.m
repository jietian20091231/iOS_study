//
//  RootViewController.m
//  CollectionViewSample
//
//  Created by Jie on 2019/8/9.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"
#import "EventCollectionViewCell.h"

#define COL_NUM 3

@interface RootViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray * events;
@property (nonatomic, strong) UICollectionView * collectionView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"events" ofType: @"plist"];
    _events = [[NSArray alloc] initWithContentsOfFile: plistPath];

    [self setupCollectionView];
}


- (void) setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.sectionInset = UIEdgeInsetsMake(15, 15, 30, 15);
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    if (screenSize.height > 568) {
        layout.itemSize = CGSizeMake(100, 100);
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 20, 15);
    }
    
    layout.minimumInteritemSpacing = 10;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [_collectionView registerClass: [EventCollectionViewCell class] forCellWithReuseIdentifier: @"cellIdentifier"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [self.view addSubview: _collectionView];
}

#pragma mark

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    int num = [_events count] % COL_NUM;
    if ( num == 0 ) {
        return [_events count] % COL_NUM;
    } else {
        return [_events count] % COL_NUM + 1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return COL_NUM;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSInteger idx = indexPath.section * COL_NUM + indexPath.row;
    
    if (_events.count <= idx) {
        return cell;
    }
    
    NSDictionary* event = _events[idx];
    cell.label.text = [event objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed: event[@"image"]];
    
    return cell;
}

@end
