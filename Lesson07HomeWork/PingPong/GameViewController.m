//
//  GameViewController.m
//  PingPong
//
//  Created by Sergey Razgulyaev on 21.12.2020.
//

#import "GameViewController.h"

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define HALF_SCREEN_WIDTH   SCREEN_WIDTH/2
#define HALF_SCREEN_HEIGHT  SCREEN_HEIGHT/2
#define MAX_SCORE           6

@interface GameViewController ()

@property (nonatomic, weak) UIImageView *paddleTop;
@property (nonatomic, weak) UIImageView *paddleBottom;
@property (nonatomic, weak) UIView *gridView;
@property (nonatomic, weak) UIView *ballView;
@property (nonatomic, weak) UILabel *scoreTop;
@property (nonatomic, weak) UILabel *scoreBottom;

@property (nonatomic, strong) UITouch *touchTop;
@property (nonatomic, strong) UITouch *touchBottom;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) float dx;
@property (nonatomic, assign) float dy;
@property (nonatomic, assign) float speed;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)configure {
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:180.0/255.0 blue:191.0/255.0 alpha:1.0];
    
    self.paddleTop = [self configurePaddleWithImageNamed:@"paddleTop" andFrameWithX:30.0 Y:40.0 Width:90.0 Heigh:60.0];
    self.paddleBottom = [self configurePaddleWithImageNamed:@"paddleBottom" andFrameWithX:30.0 Y:SCREEN_HEIGHT - 90.0 Width:90.0 Heigh:60.0];
    
    self.scoreTop = [self configureScoreLabelWithX: SCREEN_WIDTH - 70.0 Y: HALF_SCREEN_HEIGHT - 70.0 Width: 50.0 Heigh: 50.0];
    self.scoreBottom = [self configureScoreLabelWithX: SCREEN_WIDTH - 70.0 Y: HALF_SCREEN_HEIGHT + 20.0 Width: 50.0 Heigh: 50.0];
    
    UIView *grid = [[UIView alloc] initWithFrame:CGRectMake(0.0, HALF_SCREEN_HEIGHT - 2.0, SCREEN_WIDTH, 4.0)];
    grid.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:grid];
    self.gridView = grid;
    
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10.0, self.view.center.y - 10.0, 20.0, 20.0)];
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10;
    ball.hidden = YES;
    [self.view addSubview:ball];
    self.ballView = ball;
}

- (UILabel *)configureScoreLabelWithX: (double)x
                                    Y: (double)y
                                Width: (double)w
                                Heigh: (double)h {
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    score.textColor = [UIColor whiteColor];
    score.text = @"0";
    score.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    score.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:score];
    return score;
}

- (UIImageView *)configurePaddleWithImageNamed: (NSString *) imageName
                                 andFrameWithX: (double)x
                                             Y: (double)y
                                         Width: (double)w
                                         Heigh: (double)h {
    UIImageView *paddle = [[UIImageView alloc] initWithImage: [UIImage imageNamed:imageName]];
    paddle.frame = CGRectMake(x, y, w, h);
    paddle.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:paddle];
    return paddle;
}

@end
