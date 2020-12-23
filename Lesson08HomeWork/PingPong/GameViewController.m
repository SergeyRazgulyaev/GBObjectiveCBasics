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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self becomeFirstResponder];
    [self newGame];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self resignFirstResponder];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (self.touchBottom == nil && point.y > HALF_SCREEN_HEIGHT) {
            self.touchBottom = touch;
            self.paddleBottom.center = point;
        } else if (self.touchTop == nil && point.y < HALF_SCREEN_HEIGHT) {
            self.touchTop = touch;
            self.paddleTop.center = point;
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (touch == self.touchTop) {
            if (point.y > HALF_SCREEN_HEIGHT) {
                self.paddleTop.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
                return;
            }
            self.paddleTop.center = point;
        } else if (touch == self.touchBottom) {
            if (point.y < HALF_SCREEN_HEIGHT) {
                self.paddleBottom.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
                return;
            }
            self.paddleBottom.center = point;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (touch == self.touchTop) {
            self.touchTop = nil;
        } else if (touch == self.touchBottom) {
            self.touchBottom = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}


- (void)displayMessage:(NSString *)message {
    [self stop];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ping Pong" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([self gameOver]) {
            [self newGame];
            return;
        }
        [self reset];
        [self start];
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)newGame {
    [self reset];
    self.scoreTop.text = @"0";
    self.scoreBottom.text = @"0";

    [self displayMessage:@"Are you ready?"];
}

- (int)gameOver {
    if ([self.scoreTop.text intValue] >= MAX_SCORE) {
        return 1;
    }
    if ([self.scoreBottom.text intValue] >= MAX_SCORE) {
        return 2;
    }
    return 0;
}

- (void)start {
    self.ballView.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(animate) userInfo:nil repeats:YES];
    }
    self.ballView.hidden = NO;
}

- (void)reset {
    if ((arc4random() % 2) == 0) {
        self.dx = -1;
    } else {
        self.dx = 1;
    }
    if (self.dy != 0) {
        self.dy = -self.dy;
    } else if ((arc4random() % 2) == 0) {
        self.dy = -1;
    } else {
        self.dy = 1;
    }
    self.ballView.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    self.speed = 2;
}

- (void)stop {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.ballView.hidden = YES;
}

- (void)animate {
    self.ballView.center = CGPointMake(self.ballView.center.x + self.dx * self.speed, self.ballView.center.y + self.dy * self.speed);
    [self checkCollision:CGRectMake(0.0, 0.0, 0.0, SCREEN_HEIGHT) X:fabs(self.dx) Y:0.0];
    [self checkCollision:CGRectMake(SCREEN_WIDTH, 0.0, 20.0, SCREEN_HEIGHT) X:-fabs(self.dx) Y:0.0];
    if ([self checkCollision:self.paddleTop.frame X:(self.ballView.center.x - self.paddleTop.center.x) / 32.0 Y: 1]) {
        [self increaseSpeed];
    }
    if ([self checkCollision:self.paddleBottom.frame X:(self.ballView.center.x - self.paddleBottom.center.x) / 32.0 Y: -1]) {
        [self increaseSpeed];
    }
    [self goal];
}

- (void)increaseSpeed {
    self.speed += 0.5;
    if (self.speed > 10) {
        self.speed = 10;
    }
}

-(BOOL)checkCollision: (CGRect)rect X:(float)x Y:(float)y {
    if (CGRectIntersectsRect(self.ballView.frame, rect)) {
        if (x != 0) {
            self.dx = x;
        }
        if (y != 0) {
            self.dy = y;
        }
        return YES;
    }
    return NO;
}

-(BOOL)goal {
    if (self.ballView.center.y < 0 || self.ballView.center.y >= SCREEN_HEIGHT) {
        int s1 = [self.scoreTop.text intValue];
        int s2 = [self.scoreBottom.text intValue];
        
        if (self.ballView.center.y < 0) {
            s2 +=1;
        } else {
            s1 += 1;
        }
        self.scoreTop.text = [NSString stringWithFormat:@"%u", s1];
        self.scoreBottom.text = [NSString stringWithFormat:@"%u", s2];
        
        int gameOver = [self gameOver];
        if (gameOver != 0) {
            [self displayMessage:[NSString stringWithFormat:@"Player %i won", gameOver]];
        } else {
            [self reset];
        }
        return YES;
    }
    return NO;
}

@end
