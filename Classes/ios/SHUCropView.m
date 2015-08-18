//
//  SHUCropView.m
//  Pods
//
//  Created by Sergey Shulga on 5/8/14.
//
//

#import "SHUCropView.h"

typedef NS_ENUM(NSInteger, SHUCropViewEdgeType) {
    SHUCropViewEdgeTypeLeft = 0,
    SHUCropViewEdgeTypeBottom,
    SHUCropViewEdgeTypeRight,
    SHUCropViewEdgeTypeTop
};

@interface SHUCropView()

    @property(assign, nonatomic) CGSize cropSize;

@end

@implementation SHUCropView

- (id)initWithFrame:(CGRect)frame cropSize:(CGSize)cropSize {
    self = [super initWithFrame:frame];
    if (self) {
        self.cropSize = cropSize;
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];
        self.userInteractionEnabled = NO;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();

    [self _drawCenterRectInContext:context];
}

#pragma mark - Private

- (void) _drawCenterRectInContext:(CGContextRef)context {
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor whiteColor].CGColor);

    CGRect rectangle = [self _centerRect];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:rectangle];

    CGContextClearRect(context, rectangle);

    //// Variable Declarations
    CGFloat width = rectangle.size.width / 200.0;

    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, rectangle.origin.x, rectangle.origin.y);
    CGContextScaleCTM(context, width, width);

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(200, 0)];
    [bezierPath addCurveToPoint:CGPointMake(200, 100)
     controlPoint1:CGPointMake(200, 0)
     controlPoint2:CGPointMake(200, 50)];
    [bezierPath addCurveToPoint:CGPointMake(200, 200)
     controlPoint1:CGPointMake(200, 150)
     controlPoint2:CGPointMake(200, 200)];
    [bezierPath addLineToPoint:CGPointMake(100, 200)];
    [bezierPath addCurveToPoint:CGPointMake(200, 100)
     controlPoint1:CGPointMake(155.23, 200)
     controlPoint2:CGPointMake(200, 155.23)];
    [bezierPath addCurveToPoint:CGPointMake(100, 0)
     controlPoint1:CGPointMake(200, 44.77)
     controlPoint2:CGPointMake(155.23, 0)];
    [bezierPath addLineToPoint:CGPointMake(200, 0)];
    [bezierPath addLineToPoint:CGPointMake(200, 0)];
    [bezierPath closePath];
    [bezierPath moveToPoint:CGPointMake(39.79, 20.15)];
    [bezierPath addCurveToPoint:CGPointMake(0, 100)
     controlPoint1:CGPointMake(15.62, 38.41)
     controlPoint2:CGPointMake(0, 67.38)];
    [bezierPath addCurveToPoint:CGPointMake(100, 200)
     controlPoint1:CGPointMake(0, 155.23)
     controlPoint2:CGPointMake(44.77, 200)];
    [bezierPath addLineToPoint:CGPointMake(0, 200)];
    [bezierPath addCurveToPoint:CGPointMake(0, 100)
     controlPoint1:CGPointMake(0, 200)
     controlPoint2:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(0, 0)
     controlPoint1:CGPointMake(0, 50)
     controlPoint2:CGPointMake(0, 0)];
    [bezierPath addLineToPoint:CGPointMake(100, 0)];
    [bezierPath addCurveToPoint:CGPointMake(39.79, 20.15)
     controlPoint1:CGPointMake(77.39, 0)
     controlPoint2:CGPointMake(56.54, 7.5)];
    [bezierPath closePath];
    [self.backgroundColor setFill];
    [bezierPath fill];

    CGContextRestoreGState(context);

    CGContextAddPath(context, circlePath.CGPath);
    CGContextStrokePath(context);
}

- (CGRect) _centerRect {

    CGPoint origin;
    CGSize  size;
    origin = CGPointMake(self.center.x - self.cropSize.width / 2.f + 1.f,
                         self.center.y - self.cropSize.height / 2.f + 1.f);
    size = self.cropSize;

    return CGRectMake(origin.x , origin.y, size.width - 1.f, size.height - 1.f);
}

@end
