//
//  GTDeleteCellView.m
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/10.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()
@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIButton *deleteButton;
@property (copy, nonatomic) dispatch_block_t deleteBlock;
@end

@implementation GTDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self addSubview:({
            self.backgroundView = [[UIView alloc]initWithFrame:self.bounds];
            self.backgroundView.backgroundColor = [UIColor lightGrayColor];
            self.backgroundView.alpha = 0.5;
            [self.backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                            action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            self.backgroundView;
        })];

        [self addSubview:({
            self.deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
            [self.deleteButton addTarget:self
                                  action:@selector(clickButton)
                        forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton.backgroundColor = [UIColor blueColor];

            self.deleteButton;
        })];
    }

    return self;
}

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock {
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    [UIApplication.sharedApplication.windows.lastObject addSubview:self];

    [UIView animateWithDuration:1.f
                          delay:0.f
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
    }
                     completion:^(BOOL finished) {
        NSLog(@"动画执行完毕");
    }];
}

- (void)dismissDeleteView {
    [self removeFromSuperview];
}

- (void)clickButton {
    [self dismissDeleteView];
    _deleteBlock();
}

@end
