//
//  LocalStorage.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//


#import "Shift.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DataProvider <NSObject>
- (NSArray<Shift*>*)allShifts;
- (NSArray<Role*>*)allRoles;
- (NSArray<Person*>*)allPersones;
- (NSArray<Color*>*)allColors;
@end

@interface LocalStorage : NSObject <DataProvider>
@property (nonatomic, readonly) BOOL isEmpty;
- (void)updateShift:(Shift*)shift withId:(NSInteger)id_;
- (void)addShifts:(NSArray<Shift*>*)shifts;
@end


NS_ASSUME_NONNULL_END
