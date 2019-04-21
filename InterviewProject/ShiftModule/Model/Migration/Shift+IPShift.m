//
//  Shift+IPShift.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "Shift+IPShift.h"
#import "IPShiftResponse.h"
#import "DateUtils.h"

@implementation Shift (IPShift)
- (instancetype)initWithShiftEntity:(IPShift*)shift {
    self = [super init];
    if (self) {
        self.role = shift.role;
        self.person = shift.name;
        self.color = shift.color;
        self.endDate = [DateUtils.apiDateFormatter dateFromString:shift.endDate];
        self.startDate = [DateUtils.apiDateFormatter dateFromString:shift.startDate];
    }
    return self;
}
@end
