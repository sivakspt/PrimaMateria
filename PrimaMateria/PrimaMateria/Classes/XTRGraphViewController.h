//
//  XTRGraphViewController.h
//  PrimaMateria
//
//  Created by Jerry Porter on 11/21/11.
//  Copyright (c) 2016 xTrensa. All rights reserved.
//

@interface XTRGraphViewController : UIViewController <CPTPlotDataSource, CPTBarPlotDelegate>

@property (nonatomic, strong) IBOutlet CPTGraphHostingView *hostingView;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *button;

@property (nonatomic, strong) CPTXYGraph *barChart;
@property (strong) NSString *errorString;

- (IBAction)toolbarItemTapped : (id)sender;

@end
