//
//  SiftInteractor.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "ShiftInteractor.h"
#import "ApiClient.h"
#import "LocalStorage.h"
#import "Shift+IPShift.h"
#import "ArrayUtils.h"

@interface ShiftInteractor()
@property (nonatomic, strong) ApiClient *apiClient;
@property (nonatomic, strong) LocalStorage *localStorage;
@end

@implementation ShiftInteractor

@synthesize delegate;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.apiClient = [ApiClient new];
        self.localStorage = [LocalStorage new];
    }
    return self;
}

- (void)requestNewContent {
    if (!self.localStorage.isEmpty) {
        [self notifyDelegateAboutNewData];
        return;
    }
    
    [self.apiClient getShifts:^(IPShiftResponse * _Nullable response, NSError * _Nullable errors) {
        //TODO: process error
        NSMutableArray* arr = @[].mutableCopy;
        for (IPShift *apiShift in response.shifts) {
            [arr addObject:[[Shift alloc] initWithShiftEntity:apiShift]];
        }
        [self.localStorage addShifts:arr];
        [self notifyDelegateAboutNewData];
    }];
   
}

- (void)notifyDelegateAboutNewData {
    [self.delegate onNewContentReceived:self.allShifts];
}

- (nonnull Shift *)shiftAt:(NSInteger)index {
    return self.allShifts[index];
}

- (void)updateShift:(Shift*)shift withId:(NSInteger)id_ {
    [self.localStorage updateShift:shift withId:id_];
    
    [self notifyDelegateAboutNewData];
}

- (nonnull NSArray<Color *> *)allColors {
    return [self.localStorage.allColors map:^Color* (Color*  obj, NSUInteger idx) {
        return obj.capitalizedString;
    }];
}

- (nonnull NSArray<Person *> *)allPersones {
    return self.localStorage.allPersones;
}

- (nonnull NSArray<Role *> *)allRoles {
    return self.localStorage.allRoles;
}

- (nonnull NSArray<Shift *> *)allShifts {
    //TODO: add cache
    return [self.localStorage.allShifts sortedArrayUsingComparator:^NSComparisonResult(Shift*  _Nonnull obj1, Shift*  _Nonnull obj2) {
        return [obj2.startDate compare:obj1.startDate];
    }];
}

@end
