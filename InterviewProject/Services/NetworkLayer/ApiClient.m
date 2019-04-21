//
//  ApiClient.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "ApiClient.h"

@implementation ApiClient
- (void)getShifts:(void (^)(IPShiftResponse*, NSError*))completion {
    
    [self performRequest:@"shifts" method:@"GET" completion:^(NSString *jsonString, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        IPShiftResponse* response = [IPShiftResponse fromJSON:jsonString encoding:NSUTF8StringEncoding error:&error];
        completion(response, error);
    }];
}


- (void)performRequest:(NSString*)path
                method:(NSString*)method
            completion:(void (^)(NSString* jsonString, NSError* error))completion
{
//  ACTUALLY HERE SHOULD BE SOMETHING LIKE
//    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
//                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                              // 4: Handle response here
//                                          }];
//
//    // 3
//    [downloadTask resume];
    
    NSError *error = nil;
    NSString* filePath = [NSBundle.mainBundle pathForResource:path ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    completion(jsonString, error);
}
@end
