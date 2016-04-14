//
//  XTRElementListViewController.h
//  PrimaMateria
//
//  Created by Jerry Porter on 11/21/11.
//  Copyright (c) 2016 xTrensa. All rights reserved.
//

@class DynoTableHeaderButton;

@interface XTRElementListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet DynoTableHeaderButton *atomicNumberButton;
@property (nonatomic, strong) IBOutlet UIView *swapView;

@end
