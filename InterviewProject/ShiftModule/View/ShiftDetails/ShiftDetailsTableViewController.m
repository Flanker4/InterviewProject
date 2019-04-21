//
//  ShiftDetailsTableViewController.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "ShiftDetailsTableViewController.h"
#import "Shift.h"
#import "DateUtils.h"
@interface ShiftDetailsTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *startDateCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *endDateCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *employeeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *roleCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *colorCell;

@end

@implementation ShiftDetailsTableViewController
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.delegate userWantsDetails];
}

- (void)displayShift:(Shift*)shift {
    NSString* startDate = shift.startDate ? [DateUtils.uiDateFormatter stringFromDate:shift.startDate] : nil;
    
    NSString* endDate = shift.endDate ? [DateUtils.uiDateFormatter stringFromDate:shift.endDate] : nil;
    
    [self setValue:shift.person to:self.employeeCell];
    [self setValue:startDate    to:self.startDateCell];
    [self setValue:endDate      to:self.endDateCell];
    [self setValue:shift.role   to:self.roleCell];
    [self setValue:shift.color.capitalizedString  to:self.colorCell];
}

- (void)setValue:(nullable NSString*)value to:(UITableViewCell*)cell {
    if (value == nil) {
        return;
    }
    
    cell.detailTextLabel.text = value;
    cell.detailTextLabel.textColor = UIColor.blackColor;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSIndexPath *selectedIndexPath = tableView.indexPathForSelectedRow;
    if (selectedIndexPath) {
        [self.tableView deselectRowAtIndexPath:selectedIndexPath animated:true];
    }
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //In such cases I'm missing about swift pattern matching
    if (cell == self.roleCell) {
        [self.delegate userWantsSelectRole];
        return;
    }
    if (cell == self.employeeCell) {
        [self.delegate userWantsSelectEmployee];
        return;
    }
    if (cell == self.startDateCell) {
        [self.delegate userWantsSelectStartDate];
        return;
    }
    if (cell == self.endDateCell) {
        [self.delegate userWantsSelectEndDate];
        return;
    }
    if (cell == self.colorCell) {
        [self.delegate userWantsSelectColor];
        return;
    }
}

- (IBAction)savePressed:(id)sender {
    [self.delegate userWantsSaveShift];
}
@end
