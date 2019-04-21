//
//  DateUtils.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface DateUtils : NSObject
+ (NSDateFormatter*)apiDateFormatter;
+ (NSDateFormatter*)uiDateFormatter;
+ (NSDateIntervalFormatter*)uiTimeFormatter;
+ (NSString*)periodFrom:(NSDate*)from to:(NSDate*)to;
@end

NS_ASSUME_NONNULL_END
