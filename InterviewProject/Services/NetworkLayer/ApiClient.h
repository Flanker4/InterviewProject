//
//  ApiClient.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPShiftResponse.h"
NS_ASSUME_NONNULL_BEGIN

@interface ApiClient : NSObject
- (void)getShifts:(void (^)(IPShiftResponse* _Nullable, NSError* _Nullable))completion;
@end

NS_ASSUME_NONNULL_END
