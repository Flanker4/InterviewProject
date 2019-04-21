//
//  ShiftModuleConfigurator.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

@import UIKit;
#import "ShiftViewInterface.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShiftModuleConfigurator : NSObject
+ (void)configurateModuleWithViewController:(id<ShiftListViewInterface>)vc rootVC:(UINavigationController*)rootVC;
@end

NS_ASSUME_NONNULL_END
