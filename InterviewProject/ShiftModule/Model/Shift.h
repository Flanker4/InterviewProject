//
//  Shift.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

@import UIKit;

typedef NSString Role;
typedef NSString Person;
typedef NSString Color;

NS_ASSUME_NONNULL_BEGIN
@interface Shift : NSObject <NSCopying>
@property (nonatomic, nullable, copy) Role *role;
@property (nonatomic, nullable, copy) Person *person;
@property (nonatomic, nullable, copy) NSDate *startDate;
@property (nonatomic, nullable, copy) NSDate *endDate;
@property (nonatomic, nullable, copy) Color* color;
@end

NS_ASSUME_NONNULL_END
