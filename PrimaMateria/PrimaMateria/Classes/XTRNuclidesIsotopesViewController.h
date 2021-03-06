//
//  XTRNuclidesIsotopesViewController.h
//  PrimaMateria
//
//  Created by Jerry Porter on 11/21/11.
//  Copyright (c) 2016 xTrensa. All rights reserved.
//

@interface XTRNuclidesIsotopesViewController : XTRSwapableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet UIView *swapView;

@property (nonatomic, strong) NSArray *nuclidesAndIsotopesArray;
@property (nonatomic, strong) UITableView *tableView;

- (void)setupUI;

@end
