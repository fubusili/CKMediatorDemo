//
//  DetailViewController.m
//  CKMediatorDemo
//
//  Created by Clark on 2016/11/5.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic, strong) UIButton *returnButton;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.infoLabel];
    [self.view addSubview:self.returnButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response
- (void)didTappedReturnButton:(UIButton *)button
{
    if (self.navigationController == nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark - setter and getter
- (UIButton *)returnButton
{
    if (_returnButton == nil) {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnButton addTarget:self action:@selector(didTappedReturnButton:) forControlEvents:UIControlEventTouchUpInside];
        [_returnButton setTitle:@"返回" forState:UIControlStateNormal];
        [_returnButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _returnButton.backgroundColor = [UIColor cyanColor];
        _returnButton.frame = CGRectMake(0, 0, 100, 100);
        _returnButton.center = self.view.center;
        _returnButton.layer.cornerRadius = 50;
        _returnButton.layer.masksToBounds = YES;
    }
    return _returnButton;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = _image;
    }
    return _imageView;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
        _infoLabel.backgroundColor = [UIColor whiteColor];
        _infoLabel.font = [UIFont systemFontOfSize:20];
        _infoLabel.text = _info;
    }
    return _infoLabel;
}

- (void)setInfo:(NSString *)info {
    _info = info;
    self.infoLabel.text = info;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

@end
