//
//  DateUtils.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils

+ (NSDateFormatter*)apiDateFormatter {
    static NSDateFormatter *apiDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        apiDateFormatter = [NSDateFormatter new];
        apiDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss ZZZZZ";
    });
    return apiDateFormatter;
}

+ (NSDateFormatter*)uiDateFormatter {
    static NSDateFormatter *uiDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        uiDateFormatter = [NSDateFormatter new];
        uiDateFormatter.dateFormat = @"E, MMM d";
    });
    return uiDateFormatter;
}

+ (NSDateIntervalFormatter*)uiTimeFormatter {
    static NSDateIntervalFormatter *uiTimeFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        uiTimeFormatter = [NSDateIntervalFormatter new];
        uiTimeFormatter.dateTemplate = @"h";
    });
    return uiTimeFormatter;
}

+ (NSDateFormatter*)fromTimeFormatter {
    static NSDateFormatter *fromTimeFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fromTimeFormatter = [NSDateFormatter new];
        fromTimeFormatter.dateFormat = @"h";
    });
    return fromTimeFormatter;
}

+ (NSDateFormatter*)toTimeFormatter {
    static NSDateFormatter *toTimeFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toTimeFormatter = [NSDateFormatter new];
        toTimeFormatter.dateFormat = @"h a";
    });
    return toTimeFormatter;
}

+ (NSString*)periodFrom:(NSDate*)from to:(NSDate*)to {
    //actually NSDateIntervalFormatter is better but it not working for our case
    return [NSString stringWithFormat:@"%@ - %@",
            [self.fromTimeFormatter stringFromDate:from] ?: @"*",
            [self.toTimeFormatter stringFromDate:to] ?: @"*"];
    
}
@end
