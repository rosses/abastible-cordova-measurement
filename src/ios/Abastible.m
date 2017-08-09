/********* Abastible.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <AbastibleFramework/Abastible_SDK.h>
@interface Abastible : CDVPlugin
// Member variables go here.

- (void)startMeasurement:(CDVInvokedUrlCommand*)command;
- (void)startMeasurementMultiple:(CDVInvokedUrlCommand*)command;
@end


@implementation Abastible {
    CDVInvokedUrlCommand* resultCommand;
    CDVPluginResult* pluginResult;
}
//@implementation Abastible_SDK

- (void)startMeasurement:(CDVInvokedUrlCommand*)command {
    
    resultCommand = command;
    pluginResult = nil;
    
    NSString* weight;
    NSObject *obj0 = [command.arguments objectAtIndex:0];
    if([obj0 isKindOfClass:NSString.class]) {
        weight = (NSString*)obj0;
    } else if ([obj0 isKindOfClass:NSNumber.class]) {
        weight = [(NSNumber *)obj0 stringValue];
    }
    
    NSString* tarra;
    NSObject *obj1 = [command.arguments objectAtIndex:1];
    if([obj1 isKindOfClass:NSString.class]) {
        tarra = (NSString*)obj1;
    } else if ([obj1 isKindOfClass:NSNumber.class]) {
        tarra = [(NSNumber *)obj1 stringValue];
    }
    
    NSString* type = [command.arguments objectAtIndex:2];
    
    NSString* cylinderId;
    NSObject* obj3 = [command.arguments objectAtIndex:3];
    if([obj3 isKindOfClass:NSString.class]) {
        cylinderId = (NSString*)obj3;
    } else if ([obj3 isKindOfClass:NSNumber.class]) {
        cylinderId = [(NSNumber *)obj3 stringValue];
    }
    
    NSString* full = [command.arguments objectAtIndex:4];
    
    CRCilinderType ct;
    CRFillingType ft;
    
    //check weight
    if([weight integerValue] == 5) {
        ct = CRCilinderType_5kg;
    }
    else if([weight integerValue] == 11) {
        ct = CRCilinderType_11kg;
    }
    else if([weight integerValue] == 15) {
        ct = CRCilinderType_15kg;
    }
    else if([weight integerValue] == 45) {
        ct = CRCilinderType_45kg;
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Wrong weight input!"];
    }
    
    //check tarra
    if([tarra integerValue] <= 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Wrong tarra. Should be higher than 0!"];
    }
    
    //check type
    if([type isEqualToString:@"butane"]) {
        ft = CRFillingType_Butane;
    }
    else if([type isEqualToString:@"propane"]) {
        ft = CRFillingType_Propane;
    }
    else {
        ft = CRFillingType_Unknown;
    }
    
    //check id
    if(cylinderId < 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"The id should NOT be negative!"];
    }
    
    if(pluginResult != nil) {
        [self.commandDelegate sendPluginResult:pluginResult callbackId:resultCommand.callbackId];
    }
    else {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(measurementResult:) name:@"ABASTIBLE_MEASUREMENT_RESULT" object:nil];
        [Abastible_SDK.sharedInstance startMeasurement:ct tarra:[tarra intValue] fillingType:ft cilinderId:cylinderId cilinderIsFull:[full boolValue]];
    }
    
}

- (void)startMeasurementMultiple:(CDVInvokedUrlCommand*)command {
    
    resultCommand = command;
    pluginResult = nil;
    
    NSString* weight;
    NSObject *obj0 = [command.arguments objectAtIndex:0];
    if([obj0 isKindOfClass:NSString.class]) {
        weight = (NSString*)obj0;
    } else if ([obj0 isKindOfClass:NSNumber.class]) {
        weight = [(NSNumber *)obj0 stringValue];
    }
    
    NSString* tarra;
    NSObject *obj1 = [command.arguments objectAtIndex:1];
    if([obj1 isKindOfClass:NSString.class]) {
        tarra = (NSString*)obj1;
    } else if ([obj1 isKindOfClass:NSNumber.class]) {
        tarra = [(NSNumber *)obj1 stringValue];
    }
    
    NSString* type = [command.arguments objectAtIndex:2];
    
    NSString* cylinderId;
    NSObject* obj3 = [command.arguments objectAtIndex:3];
    if([obj3 isKindOfClass:NSString.class]) {
        cylinderId = (NSString*)obj3;
    } else if ([obj3 isKindOfClass:NSNumber.class]) {
        cylinderId = [(NSNumber *)obj3 stringValue];
    }
    
    NSString* full = [command.arguments objectAtIndex:4];
    
    NSString* nrOfMeasurements;
    NSObject* obj5 = [command.arguments objectAtIndex:5];
    if([obj5 isKindOfClass:NSString.class]) {
        nrOfMeasurements = (NSString*)obj5;
    } else if ([obj5 isKindOfClass:NSNumber.class]) {
        nrOfMeasurements = [(NSNumber *)obj5 stringValue];
    }
    
    CRCilinderType ct;
    CRFillingType ft;
    
    //check weight
    if([weight integerValue] == 5) {
        ct = CRCilinderType_5kg;
    }
    else if([weight integerValue] == 11) {
        ct = CRCilinderType_11kg;
    }
    else if([weight integerValue] == 15) {
        ct = CRCilinderType_15kg;
    }
    else if([weight integerValue] == 45) {
        ct = CRCilinderType_45kg;
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Wrong weight input!"];
    }
    
    //check tarra
    if([tarra integerValue] <= 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Wrong tarra. Should be higher than 0!"];
    }
    
    //check type
    if([type isEqualToString:@"butane"]) {
        ft = CRFillingType_Butane;
    }
    else if([type isEqualToString:@"propane"]) {
        ft = CRFillingType_Propane;
    }
    else {
        ft = CRFillingType_Unknown;
    }
    
    //check id
    if(cylinderId < 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"The id should NOT be negative!"];
    }
    
    if(pluginResult != nil) {
        [self.commandDelegate sendPluginResult:pluginResult callbackId:resultCommand.callbackId];
    }
    else {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(measurementResult:) name:@"ABASTIBLE_MEASUREMENT_RESULT" object:nil];
        [Abastible_SDK.sharedInstance startMeasurement:ct tarra:[tarra intValue] fillingType:ft cilinderId:cylinderId cilinderIsFull:[full boolValue] nrOfValidMeasurements: [nrOfMeasurements intValue]];
    }
    
}

-(void)measurementResult:(NSNotification *)notification {
    
    NSDictionary *measurementInfo = notification.userInfo;
    NSNumber* measurementResult = [measurementInfo objectForKey:@"measurementInfo"];
    NSString* result = [NSString stringWithFormat:@"%d", (int)measurementResult.integerValue];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:resultCommand.callbackId];
}

@end