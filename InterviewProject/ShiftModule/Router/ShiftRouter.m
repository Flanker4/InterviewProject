//
//  ShiftRouterImpl.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "ShiftRouter.h"

@interface ShiftRouter()
@property (nonatomic, weak) UINavigationController *rootVC;
@end

@implementation ShiftRouter
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super init];
    if (self) {
        self.rootVC = (UINavigationController*)rootViewController;
    }
    return self;
}

- (void)presentPicker:(NSArray<NSString*>*)options
           completion:(void(^)(NSString* selectedOption))completionBlock
{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString *option in options) {
        [ac addAction:[UIAlertAction actionWithTitle:option
                                               style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction * _Nonnull action)
        {
            completionBlock(option);
        }]];
    }
    
    [ac addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"") style:UIAlertActionStyleCancel handler:NULL]];
    [self.rootVC presentViewController:ac animated:YES completion:NULL];
}

- (void)presentDatePicker:(NSDate*)startDate completion:(void(^)(NSDate* selectedDate))completionBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:@"\n\n\n\n\n\n\n\n\n"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.minimumDate = startDate;
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    [alertController.view addSubview:datePicker];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"")
                                                        style:UIAlertActionStyleCancel
                                                      handler:NULL]];
   
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Done", @"")
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          completionBlock(datePicker.date);
                                                      }]];
        
    [self.rootVC presentViewController:alertController animated:YES completion:NULL];
}

- (void)presentShiftDetails {
    [self.rootVC.topViewController performSegueWithIdentifier:@"ShiftDetailsSegueID" sender:self];
}

- (void)moveBack {
    [self.rootVC popViewControllerAnimated:YES];
}
@end
