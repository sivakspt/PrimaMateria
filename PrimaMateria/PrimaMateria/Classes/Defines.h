//
// Defines.h
// PrimaMateria
//
//  Created by Jerry Porter on 3/22/2010.
//  Copyright 2014 xTrensa. All rights reserved.
//

#define degreesToRadians(x) (M_PI * x / 180.0)

typedef enum SeriesColors {
    kSERIES_ACTINIDE = 0,
    kSERIES_ALKALI_EARTH_METAL = 1,
    kSERIES_ALKALI_METAL = 2,
    kSERIES_HALOGEN = 3,
    kSERIES_LANTHANIDE = 4,
    kSERIES_METAL = 5,
    kSERIES_NOBLE_GAS = 6,
    kSERIES_NON_METAL = 7,
    kSERIES_TRANSACTINIDES = 8,
    kSERIES_TRANSITION_METAL = 9
} SeriesColors;

extern float RGB_CONSTANT;
extern float HSB_CONSTANT;

#pragma mark - Element Attributes

extern NSString *ELEMENT_ABUNDANCE_CRUST;
extern NSString *ELEMENT_ABUNDANCE_SEA;
extern NSString *ELEMENT_AIR_WAVELENGTH;
extern NSString *ELEMENT_ATOMIC_MASS;
extern NSString *ELEMENT_ATOMIC_MASS_AGGREGATE;
extern NSString *ELEMENT_ATOMIC_MASS_FOOTNOTE;
extern NSString *ELEMENT_ATOMIC_MASS_KNOWN_ACCURATELY;
extern NSString *ELEMENT_ATOMIC_MASS_UNCERTAINTY;
extern NSString *ELEMENT_ATOMIC_NUMBER;
extern NSString *ELEMENT_ATOMIC_RADIUS;
extern NSString *ELEMENT_ATOMIC_VOLUME;
extern NSString *ELEMENT_BOILING_POINT;
extern NSString *ELEMENT_BOILING_POINT_FOOTNOTE;
extern NSString *ELEMENT_CAS_REGISTRY_NUMBER;
extern NSString *ELEMENT_COEFFICIENT_OF_LINEAL_THERMAL_EXPANSION;
extern NSString *ELEMENT_CONDUCTIVITY_ELECTRICAL;
extern NSString *ELEMENT_CONDUCTIVITY_THERMAL;
extern NSString *ELEMENT_COVALENT_RADIUS;
extern NSString *ELEMENT_CRITICAL_TEMPERATURE;
extern NSString *ELEMENT_CROSS_SECTION;
extern NSString *ELEMENT_CRYSTAL_STRUCTURE;
extern NSString *ELEMENT_DENSITY;
extern NSString *ELEMENT_DESCR;
extern NSString *ELEMENT_DISCOVERER;
extern NSString *ELEMENT_DISCOVERY_LOCATION;
extern NSString *ELEMENT_DISCOVERY_YEAR;
extern NSString *ELEMENT_ELASTIC_MODULUS_BULK;
extern NSString *ELEMENT_ELASTIC_MODULUS_RIGIDITY;
extern NSString *ELEMENT_ELASTIC_MODULUS_YOUNGS;
extern NSString *ELEMENT_ELECTRONS_RER_ENERGY_LEVEL;
extern NSString *ELEMENT_ELECTRON_CONFIGURATION;
extern NSString *ELEMENT_ELECTRON_WORK_FUNCTION;
extern NSString *ELEMENT_ELECTRO_CHEMICAL_EQUIVALENT;
extern NSString *ELEMENT_ELECTRO_NEGATIVITY;
extern NSString *ELEMENT_ENTHALPY_OF_ATOMIZATION;
extern NSString *ELEMENT_ENTHALPY_OF_FUSION;
extern NSString *ELEMENT_ENTHALPY_OF_VAPORIZATION;
extern NSString *ELEMENT_FILLING_ORBITAL;
extern NSString *ELEMENT_FLAMMABILITY_CLASS;
extern NSString *ELEMENT_GROUP;
extern NSString *ELEMENT_HARDNESS_SCALE_BRINELL;
extern NSString *ELEMENT_HARDNESS_SCALE_BRINELL_SCALED;
extern NSString *ELEMENT_HARDNESS_SCALE_MOHS;
extern NSString *ELEMENT_HARDNESS_SCALE_VICKERS;
extern NSString *ELEMENT_HARDNESS_SCALE_VICKERS_SCALED;
extern NSString *ELEMENT_HEAT_OF_FUSION;
extern NSString *ELEMENT_HEAT_OF_VAPORIZATION;
extern NSString *ELEMENT_INCOMPATIBILITIES;
extern NSString *ELEMENT_INTENSITY;
extern NSString *ELEMENT_IONIC_RADIUS;
extern NSString *ELEMENT_IONIZATION_POTENTIAL_FIRST;
extern NSString *ELEMENT_IONIZATION_POTENTIAL_SECOND;
extern NSString *ELEMENT_IONIZATION_POTENTIAL_THIRD;
extern NSString *ELEMENT_KSHELL_ELECTRONS;
extern NSString *ELEMENT_LINE_SPECTRA;
extern NSString *ELEMENT_LSHELL_ELECTRONS;
extern NSString *ELEMENT_MAGNETIC_SUSCEPTIBILITY;
extern NSString *ELEMENT_MELTING_POINT;
extern NSString *ELEMENT_MELTING_POINT_FOOTNOTE;
extern NSString *ELEMENT_MOLAR_HEAT_CAPACITY;
extern NSString *ELEMENT_MOLAR_VOLUME;
extern NSString *ELEMENT_MSHELL_ELECTRONS;
extern NSString *ELEMENT_NAME;
extern NSString *ELEMENT_NSHELL_ELECTRONS;
extern NSString *ELEMENT_NUCLIDESANDISOTOPES;
extern NSString *ELEMENT_NUMBER_OF_ELECTRONS;
extern NSString *ELEMENT_NUMBER_OF_NEUTRONS;
extern NSString *ELEMENT_NUMBER_OF_PROTONS;
extern NSString *ELEMENT_OPTICAL_REFLECTIVITY;
extern NSString *ELEMENT_OPTICAL_REFRACTIVE_INDEX;
extern NSString *ELEMENT_OSHELL_ELECTRONS;
extern NSString *ELEMENT_OXIDATION_STATES;
extern NSString *ELEMENT_PERIOD;
extern NSString *ELEMENT_PSHELL_ELECTRONS;
extern NSString *ELEMENT_QSHELL_ELECTRONS;
extern NSString *ELEMENT_QUALITATIVE_SOLUBILITY;
extern NSString *ELEMENT_RELATIVE_GAS_DENSITY;
extern NSString *ELEMENT_SERIES;
extern NSString *ELEMENT_SPECIFIC_HEAT_CAPACITY;
extern NSString *ELEMENT_SPECTRUM;
extern NSString *ELEMENT_STANDARD_CONDITION;
extern NSString *ELEMENT_SYMBOL;
extern NSString *ELEMENT_VALENCE_ELECTRONS;
extern NSString *ELEMENT_VALENCE_ELECTRON_POTENTIAL;
extern NSString *ELEMENT_VAPOR_PRESSURE;

#pragma mark - Notifications

extern NSString *NOTIFICATION_ELEMENT_HELP_SELECTED;
extern NSString *NOTIFICATION_GRAPH_SELECTED;
extern NSString *NOTIFICATION_TABLE_HEADER_SELECTED;
extern NSString *NOTIFICATION_COLOR_SELECTED;

#pragma mark - Series Text

extern NSString *SERIES_ACTINIDE;
extern NSString *SERIES_ALKALI_EARTH_METAL;
extern NSString *SERIES_ALKALI_METAL;
extern NSString *SERIES_HALOGEN;
extern NSString *SERIES_LANTHANIDE;
extern NSString *SERIES_METAL;
extern NSString *SERIES_NOBLE_GAS;
extern NSString *SERIES_NON_METAL;
extern NSString *SERIES_TRANSACTINIDES;
extern NSString *SERIES_TRANSITION_METAL;

#pragma mark - Standard Condition Text

extern NSString *STANDARD_CONDITION_GAS;
extern NSString *STANDARD_CONDITION_LIQUID;
extern NSString *STANDARD_CONDITION_SOLID;
extern NSString *STANDARD_CONDITION_SYNTHETIC;

#pragma mark - Miscellaneous

extern NSString *ELEMENT_BUBBLE_DEFAULT;
extern NSString *SHOW_TRANSITIONS_DEFAULT;
extern NSString *SPLASH_SCREEN_DEFAULT;
extern NSString *STRING_EMPTY;
extern NSString *STRING_UNKNOWN;
extern NSString *SUPPORTING_FILES;
extern NSString *PERIODIC_VIEW_TITLE;

#pragma mark - Color Constants

extern NSString *BRIGHTNESS_COLOR_COMPONENT;
extern NSString *HUE_COLOR_COMPONENT;
extern NSString *SATURATION_COLOR_COMPONENT;
extern NSString *RED_COLOR_COMPONENT;
extern NSString *GREEN_COLOR_COMPONENT;
extern NSString *BLUE_COLOR_COMPONENT;

#pragma mark - Storyboard

extern NSString *SHOW_INSPECTOR_FROM_PERIODIC_TABLE;
extern NSString *SHOW_INSPECTOR_FROM_GRAPH_VIEW;
extern NSString *SHOW_INSPECTOR_FROM_ELEMENT_LIST;
extern NSString *SHOW_INSPECTOR_FROM_ELEMENT_BALLOON;
extern NSString *SHOW_WIKIPEDIA_VIEW_CONTROLLER_FROM_GENERAL_VIEW_CONTROLLER;
extern NSString *MAIN_STORY_BOARD;
