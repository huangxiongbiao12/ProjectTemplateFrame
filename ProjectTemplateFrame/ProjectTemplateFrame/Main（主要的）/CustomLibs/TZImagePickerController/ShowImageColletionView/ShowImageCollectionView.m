//
//  ShowImageCollectionView.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/26.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "ShowImageCollectionView.h"
#import "TZImagePickerController.h"
#import "UIView+Layout.h"
#import "TZTestCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "LxGridViewFlowLayout.h"
#import "TZImageManager.h"

@interface ShowImageCollectionView ()<TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate> {
    BOOL _isSelectOriginalPhoto;
    
    CGFloat _itemWH;
    CGFloat _margin;
    LxGridViewFlowLayout *_layout;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic,weak)UIViewController *viewController;
@property(nonatomic,weak) id<ShowImageCollectionViewDelegate> delegate;
@end

@implementation ShowImageCollectionView

+(ShowImageCollectionView *)viewWithFrame:(CGRect)frame viewController:(UIViewController *)viewController delegate:(id<ShowImageCollectionViewDelegate>)delegate
{
    ShowImageCollectionView *view = [[ShowImageCollectionView alloc] initWithFrame:frame];
    view.viewController = viewController;
    view.delegate = delegate;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _selectedPhotos = [NSMutableArray array];
        _selectedAssets = [NSMutableArray array];
        [self configCollectionView];
    }
    return self;
}

- (void)configCollectionView {
    _layout = [[LxGridViewFlowLayout alloc] init];
    _margin = 10;
    _itemWH = (self.width-50)/4;
    _layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    _layout.minimumInteritemSpacing = _margin;
    _layout.minimumLineSpacing = _margin;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.tz_width, self.height) collectionViewLayout:_layout];
//    CGFloat rgb = 244 / 255.0;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.contentInset = UIEdgeInsetsMake(5, 10, 0, 10);
    _collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, -2);
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];
}

#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _selectedPhotos.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
    if (_imageNumLabel) {
        [_imageNumLabel removeFromSuperview];
    }
    if (indexPath.row == _selectedPhotos.count) {
        cell.imageView.image = [UIImage imageNamed:@"btn_tz_tjtp"];
        cell.deleteBtn.hidden = YES;
//        if (!_imageNumLabel) {
//            _imageNumLabel = [UILabel new];
//            _imageNumLabel.font = [UIFont systemFontOfSize:12];
//            _imageNumLabel.textColor = SHColor(153, 153, 153);
//            _imageNumLabel.textAlignment = NSTextAlignmentCenter;
//            _imageNumLabel.text = @"添加图片";
//        }
//        _imageNumLabel.frame = CGRectMake(0, cell.height-20, cell.width, 20);
//        [cell addSubview:_imageNumLabel];
    } else {
        cell.imageView.image = _selectedPhotos[indexPath.row];
        cell.deleteBtn.hidden = NO;
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _selectedPhotos.count) {
        [self pickPhotoButtonClick:nil];
    } else { // preview photos / 预览照片
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.row];
        imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
        // imagePickerVc.allowPickingOriginalPhoto = NO;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            
            _selectedPhotos = [NSMutableArray arrayWithArray:photos];
            _selectedAssets = [NSMutableArray arrayWithArray:assets];
            _isSelectOriginalPhoto = isSelectOriginalPhoto;
            _layout.itemCount = _selectedPhotos.count;
            [_collectionView reloadData];
            _collectionView.contentSize = CGSizeMake(0, (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH));
            _collectionView.height = (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH);
            self.height = (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH);
            if (self.delegate&&[self.delegate respondsToSelector:@selector(showImageViewdidSelectPhotos:)]) {
                [self.delegate showImageViewdidSelectPhotos:_selectedPhotos];
            }
        }];
        [self.viewController presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    if (sourceIndexPath.item >= _selectedPhotos.count || destinationIndexPath.item >= _selectedPhotos.count) return;
    UIImage *image = _selectedPhotos[sourceIndexPath.item];
    if (image) {
        [_selectedPhotos exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
        [_selectedAssets exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
        [_collectionView reloadData];
    }
}

#pragma mark Click Event

- (void)deleteBtnClik:(UIButton *)sender {
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    _layout.itemCount = _selectedPhotos.count;
    
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_collectionView reloadData];
        _imageNumLabel.text = [NSString stringWithFormat:@"%ld/9",_selectedPhotos.count];
        if (_selectedPhotos.count==0) {
            _imageNumLabel.text = @"添加照片";
        }
        _collectionView.contentSize = CGSizeMake(0, (_selectedPhotos.count  / 4 +1 ) * (_margin + _itemWH));
        _collectionView.height = (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH);
        self.height = (_selectedPhotos.count  / 4 +1 ) * (_margin + _itemWH);
        if (self.delegate&&[self.delegate respondsToSelector:@selector(showImageViewdidSelectPhotos:)]) {
            [self.delegate showImageViewdidSelectPhotos:_selectedPhotos];
        }
    }];
}

- (void)pickPhotoButtonClick:(UIButton *)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    imagePickerVc.selectedAssets = _selectedAssets; // optional, 可选的
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    // Set the appearance
    // 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    
    // Set allow picking video & photo & originalPhoto or not
    // 设置是否可以选择视频/图片/原图
    // imagePickerVc.allowPickingVideo = NO;
    // imagePickerVc.allowPickingImage = NO;
    // imagePickerVc.allowPickingOriginalPhoto = NO;
    [self.viewController presentViewController:imagePickerVc animated:YES completion:nil];
}

#pragma mark TZImagePickerControllerDelegate

/// User click cancel button
/// 用户点击了取消
- (void)imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}

/// User finish picking photo，if assets are not empty, user picking original photo.
/// 用户选择好了图片，如果assets非空，则用户选择了原图。
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    _layout.itemCount = _selectedPhotos.count;
    [_collectionView reloadData];
    _collectionView.contentSize = CGSizeMake(0, (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH));
    _collectionView.height = (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH);
    self.height = (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH);
    _imageNumLabel.text = [NSString stringWithFormat:@"%ld/9",_selectedPhotos.count];
    if (self.delegate&&[self.delegate respondsToSelector:@selector(showImageViewdidSelectPhotos:)]) {
        [self.delegate showImageViewdidSelectPhotos:_selectedPhotos];
    }
}

/// User finish picking video,
/// 用户选择好了视频
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset {
    _selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    _layout.itemCount = _selectedPhotos.count;
    // open this code to send video / 打开这段代码发送视频
    // [[TZImageManager manager] getVideoOutputPathWithAsset:asset completion:^(NSString *outputPath) {
    // NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
    // Export completed, send video here, send by outputPath or NSData
    // 导出完成，在这里写上传代码，通过路径或者通过NSData上传
    
    // }];
    [_collectionView reloadData];
    _collectionView.contentSize = CGSizeMake(0, (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH));
    _collectionView.height = (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH);
    self.height = (_selectedPhotos.count / 4 +1 ) * (_margin + _itemWH);
    if (self.delegate&&[self.delegate respondsToSelector:@selector(showImageViewdidSelectPhotos:)]) {
        [self.delegate showImageViewdidSelectPhotos:_selectedPhotos];
    }
}

@end
