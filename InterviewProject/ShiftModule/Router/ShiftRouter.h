//
//  ShiftRouterImpl.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

@import UIKit;
#import "ShiftRouterInterface.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShiftRouter : NSObject <ShiftRouterInterface>
- (instancetype)initWithRootViewController:(UIViewController*)rootViewController;
@end

NS_ASSUME_NONNULL_END
