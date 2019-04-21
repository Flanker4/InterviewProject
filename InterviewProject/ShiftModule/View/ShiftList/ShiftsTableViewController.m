//
//  ShiftsTableViewController.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "ShiftsTableViewController.h"
#import "Shift.h"
#import "ShiftTableViewCell.h"
#import "DateUtils.h"
@interface ShiftsTableViewController ()
@property (nonatomic, strong) NSArray<Shift*>* shifts;
@end

@implementation ShiftsTableViewController
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.delegate userWantsLatestContent];
}

- (void)displayShifts:(NSArray<Shift *> *)shifts {
    self.shifts = shifts;
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shifts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShiftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(ShiftTableViewCell.class) forIndexPath:indexPath];
    [self populateCell:cell with:self.shifts[indexPath.row]];
    return cell;
}

- (void)populateCell:(ShiftTableViewCell*)cell with:(Shift*)shift {
    cell.nameLabel.text = [NSString stringWithFormat:@"%@ (%@)",
                           shift.person ?:@"*",
                           shift.role ?:@"*"];
    cell.colorView.backgroundColor = [UIColor colorNamed:shift.color];
    cell.dateLabel.text = [NSString stringWithFormat:@"%@, %@",
                           [DateUtils.uiDateFormatter stringFromDate:shift.startDate] ?:@"*",
                           [DateUtils periodFrom:shift.startDate to:shift.endDate]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate userWantsDetailsAboutShiftAt:indexPath.row];
    
    NSIndexPath *selectedIndexPath = tableView.indexPathForSelectedRow;
    if (selectedIndexPath) {
        [self.tableView deselectRowAtIndexPath:selectedIndexPath animated:true];
    }
}

- (IBAction)addShiftPressed:(id)sender {
    [self.delegate userWantsAddShift];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self.delegate prepareDetailView:segue.destinationViewController];
}
@end
