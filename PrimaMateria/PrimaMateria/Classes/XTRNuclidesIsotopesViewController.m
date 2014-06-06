//
//  XTRNuclidesIsotopesViewController.m
//  PrimaMateria
//
//  Created by Jerry Porter on 3/5/2010.
//  Copyright 2014 xTrensa. All rights reserved.
//

#import "PrimaMateria.h"

@interface XTRNuclidesIsotopesViewController ()
- (UILabel *) tableCellLabelWithXPos: (float) xPos YPos: (float) yPos width: (float) aWidth height: (float) aHeight property: (NSObject *) aProperty columnPosition: (int) aColumnPosition modulus: (int) aModulus forCell: (DynoTableCell *) cell;
@end

@implementation XTRNuclidesIsotopesViewController
@synthesize headerView;
@synthesize nuclidesAndIsotopesArray;
@synthesize swapView;
@synthesize tableView;

#pragma mark Private Methods

- (UILabel *) tableCellLabelWithXPos: (float) xPos YPos: (float) yPos width: (float) aWidth height: (float) aHeight property: (NSObject *) aProperty columnPosition: (int) aColumnPosition modulus: (int) aModulus forCell: (DynoTableCell *) cell {
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(xPos, yPos, aWidth, aHeight)];
    if (aModulus == 0)
        label.backgroundColor = [UIColor whiteColor];
    else
        label.backgroundColor = [UIColor colorWithHue: 219 / HSB_CONSTANT saturation: 0.1f brightness: 1.0f alpha: 1.0f];
    [cell addColumn: aColumnPosition];
    label.font = [UIFont fontWithName: @"Helvetica Neue" size:20.0];
    label.textAlignment =  NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.text = [NSString stringWithFormat: @" %@", aProperty];
    [cell.contentView addSubview: label];
    return label;
}

#pragma mark - Misc Methods

- (void) setupUI {
    if (self.element != nil) {
        if (tableView != nil) {
            [tableView removeFromSuperview];
            tableView = nil;
        }
        tableView = [[UITableView alloc] initWithFrame:[[self swapView] frame] style: UITableViewStylePlain];
        tableView.alwaysBounceVertical = NO;
        tableView.alwaysBounceHorizontal = NO;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = [UIColor blackColor];
        self.tableView.rowHeight = 34.0f;
        [self.view addSubview: tableView];
        nuclidesAndIsotopesArray = self.element.nuclidesAndIsotopes;
        [tableView reloadData];
    }
}

#pragma mark - UITableView DataSource Methods

- (UITableViewCell *) tableView: (UITableView *) aTableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
    NSInteger row = [indexPath row];
    NSString *MyIdentifier = [NSString stringWithFormat: @"Column %i", row];
    DynoTableCell *cell = (DynoTableCell *)[aTableView dequeueReusableCellWithIdentifier: MyIdentifier];
    if (cell == nil) {
        NSInteger modulus = row % 2;
        NSDictionary *dict = nuclidesAndIsotopesArray[row];
        cell = [[DynoTableCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: MyIdentifier];
        [self tableCellLabelWithXPos: 0.0f   YPos: 0.0f width: 103.0f  height: 32.0f property:[dict valueForKey: @"nuclide"] columnPosition: 1 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 104.0f  YPos: 0.0f width: 103.0f height: 32.0f property:[dict valueForKey: ELEMENT_ATOMIC_MASS] columnPosition: 2 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 208.0f YPos: 0.0f width: 101.0f height: 32.0f property:[dict valueForKey: @"nn"] columnPosition: 3 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 310.0f YPos: 0.0f width: 101.0f height: 32.0f property:[dict valueForKey: @"abun"] columnPosition: 4 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 412.0f YPos: 0.0f width: 101.0f height: 32.0f property:[dict valueForKey: @"spin"] columnPosition: 5 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 514.0f YPos: 0.0f width: 101.0f height: 32.0f property:[dict valueForKey: @"halfLife"] columnPosition: 6 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 616.0f YPos: 0.0f width: 101.0f height: 32.0f property:[dict valueForKey: @"dm"] columnPosition: 7 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 718.0f YPos: 0.0f width: 101.0f height: 32.0f property:[dict valueForKey: @"dt"] columnPosition: 8 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 820.0f YPos: 0.0f width: 101.0f height: 32.0f property:[dict valueForKey: @"br"] columnPosition: 9 modulus: modulus forCell: cell];
        [self tableCellLabelWithXPos: 922.0f YPos: 0.0f width: 101.0f height: 32.0f property:[dict valueForKey: @"decayEnergy"] columnPosition: 10 modulus: modulus forCell: cell];
    }
    return cell;
}

- (NSInteger) numberOfSectionsInTableView: (UITableView *) aTableView {
    return 1;
}

- (NSInteger) tableView: (UITableView *) aTableView numberOfRowsInSection: (NSInteger) section {
    return self.element.nuclidesAndIsotopes.count;
}

#pragma mark - View Management Methods

- (void) viewDidLoad {
    [super viewDidLoad];
    [swapView removeFromSuperview];
}

#pragma mark - Memory Management Methods

- (void) dealloc {
    tableView.delegate = nil;
    tableView = nil;
    headerView = nil;
    swapView = nil;
}

@end
