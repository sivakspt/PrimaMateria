//
//  XTRGraphViewController.m
//  PrimaMateria
//
//  Created by Jerry Porter on 11/21/11.
//  Copyright (c) 2016 xTrensa. All rights reserved.
//

static NSString *ATTRIBUTE_NAME   = @"attributeName";
static NSString *TITLE            = @"title";
static NSString *MAJOR_TICK_MARKS = @"majorTickMarks";
static NSString *MINOR_TICK_MARKS = @"minorTickMarks";
static NSString *MAXIMUM_VALUE    = @"maximumValue";
static NSString *MINIMUM_VALUE    = @"minimumValue";

@interface XTRGraphViewController ()
- (NSData *)dataForResource: (NSString *)aResourceName type: (NSString *)aType directory: (NSString *)aDirectory;
- (NSNumber *)element: (XTRElement *)anElement valueForIdentifier: (NSString *)anIdentifier;
- (void)creatBarChart;
- (void)createXAxis: (CPTXYAxisSet *)axisSet majorTickStyle: (CPTLineStyle *)majorTickStyle minorTickStyle: (CPTLineStyle *)minorTickStyle;
- (void)createYAxis: (CPTXYAxisSet *)axisSet minorTicks: (float)minorTicks majorTickStyle: (CPTLineStyle *)majorTickStyle minorTickStyle: (CPTLineStyle *)minorTickStyle majorTicks: (float)majorTicks dict: (NSDictionary *)dict maxValue: (float)maxValue minValue: (float)minValue;
- (void)graphSelected: (NSNotification *)notification;
- (void)showGraphForChoiceAtIndex: (NSUInteger)anIndex;
@end

@implementation XTRGraphViewController

#pragma mark Private Methods

- (void)creatBarChart {
    self.barChart = [[CPTXYGraph alloc] initWithFrame: CGRectZero];
    [self.barChart applyTheme: [CPTTheme themeNamed: kCPTSlateTheme]];
    
    self.hostingView.hostedGraph = self.barChart;
    
    self.barChart.plotAreaFrame.masksToBorder = NO;
    self.barChart.paddingLeft = 100.0;
    self.barChart.paddingTop = 10.0;
    self.barChart.paddingRight = 0.0;
    self.barChart.paddingBottom = 80.0;
    self.barChart.delegate = self;
}

- (void)createXAxis: (CPTXYAxisSet *)axisSet majorTickStyle: (CPTLineStyle *)majorTickStyle minorTickStyle: (CPTLineStyle *)minorTickStyle {
    CPTXYAxis *x = axisSet.xAxis;
    x.axisLineStyle = nil;
    x.minorTicksPerInterval = 10;
    x.majorTickLineStyle = majorTickStyle;
    x.minorTickLineStyle = minorTickStyle;
    x.majorIntervalLength = @1;
    x.majorGridLineStyle = minorTickStyle;
    x.orthogonalPosition = @0;
    x.title = @"Atomic Number";
    x.titleLocation = @([XTRDataSource sharedInstance].elementCount / 2);
    x.titleOffset = 35.0f;
    
    // Define some custom labels for the data elements
    x.labelRotation = (CGFloat)(M_PI / 4);
    x.labelingPolicy = CPTAxisLabelingPolicyNone;
    NSArray *customTickLocations = @[@1, @10, @20, @30,  @40, @50, @60, @70, @80, @90, @100, @110];
    NSArray *xAxisLabels = @[ @"1", @"10", @"20", @"30", @"40", @"50", @"60", @"70", @"80", @"90", @"100", @"110"];
    NSUInteger labelLocation = 0;
    NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:xAxisLabels.count];
    for (NSNumber *tickLocation in customTickLocations){
        CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText:xAxisLabels[labelLocation++] textStyle: x.labelTextStyle];
        newLabel.tickLocation = tickLocation;
        newLabel.offset = x.labelOffset + x.majorTickLength;
        newLabel.rotation = (CGFloat)(M_PI / 4);
        [customLabels addObject: newLabel];
    }
    x.axisLabels =  [NSSet setWithArray: customLabels];
}

- (void)createYAxis: (CPTXYAxisSet *)axisSet minorTicks: (float)minorTicks majorTickStyle: (CPTLineStyle *)majorTickStyle minorTickStyle: (CPTLineStyle *)minorTickStyle majorTicks: (float)majorTicks dict: (NSDictionary *)dict maxValue: (float)maxValue minValue: (float)minValue {
    CPTXYAxis *y = axisSet.yAxis;
    y.axisLineStyle = nil;
    y.minorTicksPerInterval = (NSUInteger)minorTicks;
    y.majorTickLineStyle = majorTickStyle;
    y.minorTickLineStyle = minorTickStyle;
    y.majorIntervalLength = @(majorTicks);
    y.majorGridLineStyle = minorTickStyle;
    y.orthogonalPosition = @0;
    y.title = dict[TITLE];
    y.titleOffset = 75.0f;
    y.titleLocation = @(maxValue / 2);
    y.labelingOrigin = @(minValue);
}

- (NSNumber *)element: (XTRElement *)anElement valueForIdentifier: (NSString *)anIdentifier {
    NSNumber *aValue = [anElement valueForKey: anIdentifier];
    return (aValue != nil)? aValue : @0;
}

- (void)showElementPanelForElementAtIndex: (int)anIndex {
    [XTRPropertiesStore storeViewTitle: self.title];
    [XTRPropertiesStore storeAtomicNumber:@(anIndex)];
    [self performSegueWithIdentifier: SHOW_INSPECTOR_FROM_GRAPH_VIEW sender: self];
}

- (void)showGraphForChoiceAtIndex: (NSUInteger)anIndex {
    NSDictionary *dict = [XTRDataSource sharedInstance].graphPropertyList[anIndex];
    float minValue = [dict[MINIMUM_VALUE] floatValue];
    float maxValue = [dict[MAXIMUM_VALUE] floatValue];
    float majorTicks = [dict[MAJOR_TICK_MARKS] floatValue];
    float minorTicks = [dict[MINOR_TICK_MARKS] floatValue];
    [self creatBarChart];
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)self.barChart.defaultPlotSpace;
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation: @(minValue)length: @(maxValue)];
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation: @(0.0)length: @([XTRDataSource sharedInstance].elementCount + 1)];
    CPTMutableLineStyle *majorTickStyle = [CPTMutableLineStyle lineStyle];
    majorTickStyle.lineWidth = 2.0f;
    majorTickStyle.lineColor = [CPTColor darkGrayColor];
    
    CPTMutableLineStyle *minorTickStyle = [CPTMutableLineStyle lineStyle];
    minorTickStyle.lineWidth = 1.0f;
    minorTickStyle.lineColor = [CPTColor darkGrayColor];
    
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.barChart.axisSet;
    [self createXAxis: axisSet majorTickStyle: majorTickStyle minorTickStyle: minorTickStyle];
    [self createYAxis: axisSet minorTicks: minorTicks majorTickStyle: majorTickStyle minorTickStyle: minorTickStyle majorTicks: majorTicks dict: dict maxValue: maxValue minValue: minValue];
    
    XTRBarPlot *barPlot = [XTRBarPlot tubularBarPlotWithColor: [CPTColor whiteColor] horizontalBars: NO];
    barPlot.element = [[XTRDataSource sharedInstance] elementAtIndex: anIndex];
    barPlot.delegate = self;
    barPlot.barWidth = @1.0f;
    barPlot.baseValue = @0;
    barPlot.dataSource = self;
    barPlot.barOffset = @0.0f;
    barPlot.identifier = dict[ATTRIBUTE_NAME];
    barPlot.barCornerRadius = 0.0;
    
    [self.barChart addPlot: barPlot toPlotSpace: plotSpace];
}

- (void)graphSelected: (NSNotification *)notification {
    NSNumber *object = notification.object;
    
    [self dismissViewControllerAnimated: YES completion: nil];
    [self showGraphForChoiceAtIndex:(NSUInteger)object.intValue];
}

- (NSData *)dataForResource: (NSString *)aResourceName type: (NSString *)aType directory: (NSString *)aDirectory {
    return [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource: aResourceName ofType: aType inDirectory: aDirectory]];
}

#pragma mark - Action Methods

- (IBAction)toolbarItemTapped: (id)sender {
    XTRGraphChoiceViewController *content = [[XTRAppDelegate storyboard] instantiateViewControllerWithIdentifier: NSStringFromClass([XTRGraphChoiceViewController class])];
    CGSize contentSize = CGSizeMake(294, 664);
    
    content.modalPresentationStyle = UIModalPresentationPopover;
    content.popoverPresentationController.barButtonItem = sender;
    content.preferredContentSize = contentSize;
    
   [self presentViewController:content animated:YES completion:nil];
}

#pragma mark - Plot Data Source Methods

- (NSUInteger)numberOfRecordsForPlot: (CPTPlot *)plot {
    return [XTRDataSource sharedInstance].elementCount;
}

- (NSNumber *)numberForPlot: (CPTPlot *)plot field: (NSUInteger)fieldEnum recordIndex: (NSUInteger)index  {
    NSNumber *num = nil;
    if ([plot isKindOfClass:[CPTBarPlot class]]){
        XTRElement *element = [[XTRDataSource sharedInstance] elementAtIndex: index];

        NSString *identifier = (NSString *)plot.identifier;
        switch (fieldEnum){
            case 0:
                num = @((int)index + 1);
                break;
                
            case 1:
                if ([identifier isEqualToString: ELEMENT_ATOMIC_MASS])
                    num = element.atomicMass;
                else if ([identifier isEqualToString: ELEMENT_ATOMIC_RADIUS])
                    num = element.atomicRadius;
                else if ([identifier isEqualToString: ELEMENT_BOILING_POINT])
                    num = element.boilingPoint;
                else if ([identifier isEqualToString: ELEMENT_COEFFICIENT_OF_LINEAL_THERMAL_EXPANSION])
                    num = element.coefficientOfLinealThermalExpansionScaled;
                else if ([identifier isEqualToString: ELEMENT_COVALENT_RADIUS])
                    num = element.covalentRadius;
                else if ([identifier isEqualToString: ELEMENT_CROSS_SECTION])
                    num = element.crossSection;
                else if ([identifier isEqualToString: ELEMENT_DENSITY])
                    num = [element valueForKey: ELEMENT_DENSITY];
                else if ([identifier isEqualToString: ELEMENT_ELASTIC_MODULUS_BULK])
                    num = element.elasticModulusBulk;
                else if ([identifier isEqualToString: ELEMENT_ELASTIC_MODULUS_RIGIDITY])
                    num = element.elasticModulusRigidity;
                else if ([identifier isEqualToString: ELEMENT_ELASTIC_MODULUS_YOUNGS])
                    num = element.elasticModulusYoungs;
                else if ([identifier isEqualToString: ELEMENT_ELECTRO_CHEMICAL_EQUIVALENT])
                    num = element.electroChemicalEquivalent;
                else if ([identifier isEqualToString: ELEMENT_ELECTRO_NEGATIVITY])
                    num = element.electroNegativity;
                else if ([identifier isEqualToString: ELEMENT_ELECTRON_WORK_FUNCTION])
                    num = element.electronWorkFunction;
                else if ([identifier isEqualToString: ELEMENT_MELTING_POINT])
                    num = element.meltingPoint;
                else if ([identifier isEqualToString: ELEMENT_ENTHALPY_OF_ATOMIZATION])
                    num = element.enthalpyOfAutomization;
                else if ([identifier isEqualToString: ELEMENT_ENTHALPY_OF_FUSION])
                    num = element.enthalpyOfFusion;
                else if ([identifier isEqualToString: ELEMENT_ENTHALPY_OF_VAPORIZATION])
                    num = element.enthalpyOfVaporization;
                else if ([identifier isEqualToString: ELEMENT_IONIC_RADIUS])
                    num = element.ionicRadius;
                else if ([identifier isEqualToString: ELEMENT_HARDNESS_SCALE_BRINELL])
                    num = element.hardnessScaleBrinell;
                else if ([identifier isEqualToString: ELEMENT_HARDNESS_SCALE_MOHS])
                    num = element.hardnessScaleMohs;
                else if ([identifier isEqualToString: ELEMENT_HARDNESS_SCALE_VICKERS])
                    num = element.hardnessScaleVickers;
                else if ([identifier isEqualToString: ELEMENT_HEAT_OF_FUSION])
                    num = element.heatOfFusion;
                else if ([identifier isEqualToString: ELEMENT_HEAT_OF_VAPORIZATION])
                    num = element.heatOfVaporization;
                else if ([identifier isEqualToString: ELEMENT_IONIZATION_POTENTIAL_FIRST])
                    num = element.ionizationPotentialFirst;
                else if ([identifier isEqualToString: ELEMENT_IONIZATION_POTENTIAL_SECOND])
                    num = element.ionizationPotentialSecond;
                else if ([identifier isEqualToString: ELEMENT_IONIZATION_POTENTIAL_THIRD])
                    num = element.ionizationPotentialThird;
                else if ([identifier isEqualToString: ELEMENT_MOLAR_HEAT_CAPACITY])
                    num = element.molarHeatCapacity;
                else if ([identifier isEqualToString: ELEMENT_MOLAR_VOLUME])
                    num = element.molarVolume;
                else if ([identifier isEqualToString: ELEMENT_SPECIFIC_HEAT_CAPACITY])
                    num = element.specificHeatCapacity;
                else if ([identifier isEqualToString: ELEMENT_VALENCE_ELECTRON_POTENTIAL])
                    num = element.valenceElectronPotential;
                else
                    num = @0;
                break;
            default:
                num = @0;
                break;

        }
    }
    return num;
}

-(void)barPlot: (CPTBarPlot *)plot barWasSelectedAtRecordIndex: (NSUInteger)index {
    [self showElementPanelForElementAtIndex: index];
}

- (CPTFill *)barFillForBarPlot: (CPTBarPlot *)barPlot recordIndex: (NSUInteger)index {
    XTRElement *element = [[XTRDataSource sharedInstance] elementAtIndex: index];
    return [CPTFill fillWithColor: [CPTColor colorWithCGColor: element.seriesColor.CGColor]];
}

#pragma mark - View Management Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(graphSelected:)name: NOTIFICATION_GRAPH_SELECTED object: nil];
    self.title = @"Graphs";
    [self showGraphForChoiceAtIndex: 0];
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark - Memory Management Methods

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    self.button = nil;
    self.hostingView = nil;
}

@end
