#import <UIKit/UIKit.h>

static BOOL AMTarget(void) {
    NSString *bid = NSBundle.mainBundle.bundleIdentifier ?: @"";
    return [bid isEqualToString:@"com.autonavi.amap"];
}

static BOOL AMTextMatches(NSString *s) {
    if (!s.length) return NO;
    NSString *x = s.lowercaseString;
    return [x containsString:@"跳过"] ||
           [x containsString:@"skip"] ||
           [x containsString:@"关闭"] ||
           [x containsString:@"close"];
}

static void AMScan(UIView *v, NSInteger depth) {
    if (!v || depth > 10) return;
    if ([v isKindOfClass:UIButton.class]) {
        UIButton *b = (UIButton *)v;
        if (AMTextMatches([b titleForState:UIControlStateNormal])) {
            b.hidden = YES;
        }
    }
    for (UIView *sub in v.subviews) AMScan(sub, depth + 1);
}

static void AMRun(void) {
    if (!AMTarget()) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIWindow *w in UIApplication.sharedApplication.windows) {
            if (!w.hidden && w.alpha > 0.01) AMScan(w, 0);
        }
    });
}

%hook UIApplication
- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig;
    if (!AMTarget()) return;
    for (double t = 0.3; t <= 5.0; t += 0.3) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(t * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{ AMRun(); });
    }
}
%end
