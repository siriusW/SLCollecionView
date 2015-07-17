//
//  SLCollectionViewController.m
//  SLCollectionView
//
//  Created by wenshl on 15/7/7.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import "SLCollectionViewController.h"
#import "SLCollectionViewFlowLayout.h"
#import "SLCollectionViewCell.h"
#import "ImageModel.h"
#import <UIImageView+AFNetworking.h>
@interface SLCollectionViewController ()

@property(nonatomic,copy)NSArray *imageArray;
@property(nonatomic,retain)NSMutableArray *imageHarray;
@property(nonatomic,strong)NSMutableArray *imageModelArray;
@property(nonatomic,strong)NSMutableArray *imageMoreArray;
//@property(nonatomic,assign)NSInteger index;

@end

CGFloat const Width = 375;

@implementation SLCollectionViewController

//static NSString * const reuseIdentifier = @"WSCell";

-(void)initData{
    self.imageModelArray = [NSMutableArray array];
    self.imageHarray = [NSMutableArray array];
    self.imageMoreArray = [NSMutableArray array];

    self.imageArray = @[@"http://pic8.nipic.com/20100701/5290458_114840036316_2.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037095_7515.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037094_8001.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037093_7168.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037091_4950.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949643_6410.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949642_6939.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949630_4505.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949630_4593.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949629_7309.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949629_8247.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949442_4553.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949441_8987.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949441_5454.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949454_6367.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949578_2770.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949578_8744.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949577_5210.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949577_1998.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949482_8813.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949481_6577.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949480_4490.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949455_6792.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949455_6345.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037235_7476.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037235_9280.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037234_3539.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037234_6318.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037194_2965.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037193_1687.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037193_1286.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037192_8379.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037178_9374.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037177_1254.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037094_8001.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037093_7168.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037091_4950.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949643_6410.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949642_6939.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949630_4505.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949630_4593.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949629_7309.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949629_8247.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949442_4553.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949441_8987.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949441_5454.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949454_6367.jpg",
                        @"http://pic8.nipic.com/20100701/5290458_114840036316_2.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037095_7515.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037094_8001.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037093_7168.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037091_4950.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949643_6410.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949642_6939.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949630_4505.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949630_4593.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949629_7309.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949629_8247.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949442_4553.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949441_8987.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949441_5454.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949454_6367.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949578_2770.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949578_8744.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949577_5210.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949577_1998.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949482_8813.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949481_6577.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949480_4490.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949455_6792.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949455_6345.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037235_7476.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037235_9280.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037234_3539.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037234_6318.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037194_2965.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037193_1687.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037193_1286.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037192_8379.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037178_9374.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037177_1254.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037094_8001.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037093_7168.jpg",
                        @"http://img.my.csdn.net/uploads/201309/01/1378037091_4950.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949643_6410.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949642_6939.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949630_4505.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949630_4593.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949629_7309.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949629_8247.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949442_4553.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949441_8987.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949441_5454.jpg",
                        @"http://img.my.csdn.net/uploads/201308/31/1377949454_6367.jpg",
                       
];
    
    
}

-(void)reloadData{
    NSInteger i = [self.imageMoreArray count];
    NSLog(@"i=%ld,self.imageArray count=%ld",i,[self.imageArray count]);
    int indexTemp = 0;
    for (i=[self.imageMoreArray count]; i<[self.imageArray count]; i++) {
        if (indexTemp>5) {
            break;
        }
        [self.imageMoreArray addObject:self.imageArray[i]];
         indexTemp++;
    }
    
    ImageModel *modelPre = [[ImageModel alloc] init];
    UIImage *imagePre = [UIImage imageNamed:@"cell04.jpg"];
    modelPre.image =imagePre;
    for (NSInteger i=self.imageModelArray.count; i<self.imageMoreArray.count; i++) {
        [self.imageModelArray addObject:modelPre];
    }
    [self loadData];
}


-(void)loadData{
//    self.index = self.imageMoreArray.count;

    
    int index = 0;
    for (NSString *url in self.imageMoreArray) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        
//        NSString *filename = [NSString stringWithFormat:@"%ld", indexPath.row];
//        NSString *cachefile = [NSTemporaryDirectory() stringByAppendingPathComponent: filename];
//        UIImage *image = [UIImage imageWithContentsOfFile:cachefile];
        UIImage *image;
        
        __block UIImage *weakImage = image;
        if (!image&&index<self.imageMoreArray.count){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
//                NSString *cachefile = [NSTemporaryDirectory() stringByAppendingPathComponent: @"image"];
//                [data writeToFile:cachefile atomically:YES];
                if (data&&data!=0) {
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        ImageModel *model = [[ImageModel alloc] init];
                        weakImage = [UIImage imageWithData:data];
                        model.image = weakImage;
                        self.imageModelArray[index] = model;
//                        [self.collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
                        
                        [self.collectionView reloadData];
                    });
                    
                }
            });
        }else{
            ImageModel *model = [[ImageModel alloc] init];
            model.image = image;
            self.imageModelArray[index] = model;
        }
        
        
        index++;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self reloadData];
    
    UIButton *morebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    morebtn.frame = CGRectMake(0, 600, 375, 75);
    morebtn.backgroundColor =[UIColor redColor];
    
    [morebtn setTitle:@"加载更多" forState:UIControlStateNormal];
    [self.view addSubview:morebtn];
    [morebtn addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
    // Register cell classes
    
    self.flowLayout.ColumnCount = 2.0;
    self.flowLayout.delegate = self;
    
    
//    [self addObserver:self forKeyPath:@"imageHarray" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

-(void)moreAction:(UIButton *)btn{
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidDisappear:(BOOL)animated{
//    [self.imageHarray removeObserver:self forKeyPath:@"ArrayChange" context:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.imageModelArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WSCell" forIndexPath:indexPath];
    
    // Configure the cell
    cell.titleLabel.text = @"好漂亮，是滴哦撒";
    cell.priceLabel.text = @"¥ 100";
//    NSString *str = self.imageArray[indexPath.row];
    ImageModel *model = self.imageModelArray[indexPath.row];
    cell.imageTitle.image = model.image;
//    [cell setImage:self.imageArray[indexPath.row]];
    
    return cell;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    NSLog(@"Change");
}

-(NSUInteger)countOfImageHarray{
    return [self.imageHarray count];
    
}

-(id)objectInImageHarrayAtIndex:(NSUInteger)index{
    
    return self.imageHarray[index];
}

-(void)insertObject:(NSString *)object inImageHarrayAtIndex:(NSUInteger)index{
    [self.imageHarray insertObject:object atIndex:index];
}

-(void)removeObjectFromImageHarrayAtIndex:(NSUInteger)index{
    [self.imageHarray removeObjectAtIndex:index];
}


#pragma mark <UICollectionViewDelegate>

/*
 Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
#pragma mark <UICollectionViewLayoutDelegate>

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageModel *imageModel = self.imageModelArray[indexPath.row];
    
    CGFloat itemW = 375/2;
    CGFloat itemH = imageModel.image.size.height * itemW / imageModel.image.size.width;

    
    return CGSizeMake(itemW, itemH+70);
}

-(CGSize) collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    return CGSizeZero;
}
//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 4.0;
}
//元素边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets edge = UIEdgeInsetsMake(10, 8, 0, 8);
    return edge;
}

//#pragma mark <UISCrollViewDelegate>
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat offsetY = scrollView.contentOffset.y;
//    NSLog(@"offsetY= %f",offsetY);
//    NSLog(@"self.collectionView.bounds.size.height=%f",self.collectionView.bounds.size.height);
//    if (offsetY>self.collectionView.bounds.size.height) {
//        [self reloadData];
//    }
//}


@end
