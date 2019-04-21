//
//  Shift.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "Shift.h"

@implementation Shift
- (id)copyWithZone:(NSZone *)zone {
    Shift* copy = [[[self class] alloc] init];
    
    if (copy) {
        copy.role = self.role;
        copy.endDate = self.endDate;
        copy.startDate = self.startDate;
        copy.person = self.person;
        copy.color = self.color;
    }
    
    return copy;
}
@end
