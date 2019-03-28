/************************************************************
 Class    : YZRoundedBorderLabel.m
 Describe : 自定义可变的圆角和边框，某个角，多个角Label
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2019-03-28
 Version  : 1.0
 Declare  : Copyright © 2019 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZRoundedBorderLabel.h"

@implementation YZRoundedBorderLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];
}

-(instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithBtns:(NSArray *)btns vc:(UIViewController *)vc {
    self = [super init];
    if (self) {
        //[self Btns:btns vc:vc];
    }
    return self;
}

-(void)commonInit{
    self.BD = BorderDirectionLeft | BorderDirectionTop | BorderDirectionRight;
    self.corners = UIRectCornerTopLeft | UIRectCornerTopRight;
    self.radius = 5;
    self.borderColor = [UIColor blackColor];
    self.borderWidth = 2;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // Drawing code
    [YZRoundedBorderView setRoundedBorder:rect view:self
                                                     BD:self.BD
                                                corners:self.corners
                                                 radius:self.radius
                                            borderWidth:self.borderWidth
                                            borderColor:self.borderColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
