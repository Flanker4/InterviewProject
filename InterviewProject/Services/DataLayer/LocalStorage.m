//
//  LocalStorage.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "LocalStorage.h"

@interface LocalStorage()
@property (nonatomic, strong) NSMutableArray<Shift*>* shifts;
@end

@implementation LocalStorage
@dynamic isEmpty;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.shifts = @[].mutableCopy;
    }
    return self;
}

- (BOOL)isEmpty {
    return self.allShifts.count == 0;
}

- (NSArray<Shift*>*)allShifts {
    return [_shifts copy];
}

- (void)updateShift:(Shift*)shift withId:(NSInteger)id_ {
    if (id_==NSNotFound) {
        [_shifts addObject:shift];
        return;
    }
    
    [_shifts replaceObjectAtIndex:id_ withObject:shift];
}

- (NSArray<Role*>*)allRoles {
    return @[@"Waiter",
             @"Prep",
             @"Front of House",
             @"Cook"];
}

- (NSArray<Person*>*)allPersones {
    return @[@"Anna",
             @"Anton",
             @"Eugene",
             @"Keyvan"];
    
}

- (NSArray<Color*>*)allColors {
    return @[@"red",
             @"blue",
             @"green"];
}

- (void)addShifts:(NSArray<Shift*>*)shifts {
    [self.shifts addObjectsFromArray:shifts];
}
@end
