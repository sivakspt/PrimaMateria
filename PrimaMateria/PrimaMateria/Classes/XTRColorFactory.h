//
// XTRColorFactory.h
// PrimaMateria
//
//  Created by Jerry Porter on 3/22/2010.
//  Copyright (c) 2016 xTrensa. All rights reserved.
//

@interface XTRColorFactory : NSObject

#pragma mark General Methods

+ (UIColor *)colorFromDefaultsForKey : (NSString *)aColorKey;
+ (UIColor *)colorForString : (NSString *)aString;

#pragma mark - Series Colors

+ (UIColor *)actinideColor;
+ (UIColor *)alkaliEarthMetalColor;
+ (UIColor *)alkaliMetalColor;
+ (UIColor *)halogenColor;
+ (UIColor *)lanthanideColor;
+ (UIColor *)metalColor;
+ (UIColor *)nonMetalColor;
+ (UIColor *)nobleGasColor;
+ (UIColor *)transactinideColor;
+ (UIColor *)transitionMetalColor;

+ (UIColor *)defaultActinideColor;
+ (UIColor *)defaultAlkaliEarthMetalColor;
+ (UIColor *)defaultAlkaliMetalColor;
+ (UIColor *)defaultHalogenColor;
+ (UIColor *)defaultLanthanideColor;
+ (UIColor *)defaultMetalColor;
+ (UIColor *)defaultNonMetalColor;
+ (UIColor *)defaultNobleGasColor;
+ (UIColor *)defaultTransactinideColor;
+ (UIColor *)defaultTransitionMetalColor;

#pragma mark - Standard Condition Colors

+ (UIColor *)gasConditionColor;
+ (UIColor *)solidConditionColor;
+ (UIColor *)liquidConditionColor;
+ (UIColor *)syntheticConditionColor;

+ (UIColor *)defaultGasConditionColor;
+ (UIColor *)defaultSolidConditionColor;
+ (UIColor *)defaultLiquidConditionColor;
+ (UIColor *)defaultSyntheticConditionColor;

#pragma mark - UI Colors

+ (UIColor *)navigationBarColor;
+ (UIColor *)toolBarColor;
+ (UIColor *)alternateRowColor;
+ (UIColor *)rowColor;
+ (UIColor *)alternateRowTableCellTextLabelColor;
+ (UIColor *)rowTableCellTextLabelColor;
+ (UIColor *)labelColor;
+ (UIColor *)tableBackgroundColor;
+ (UIColor *)viewBackgroundColor;
+ (UIColor *)tableViewCellDetailLabelColor;
+ (UIColor *)tableViewCellBorderColor;

@end
