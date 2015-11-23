//
//  RemoteLogin.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/16/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemoteLogin : NSObject
-(int) getConnection:(NSArray*)keys forobjects:(NSArray*)objects forurl:(NSString*) getUrl;

@property(strong,nonatomic) NSString *errorMsg;
@property(strong,nonatomic) NSMutableArray *jsonData;

@end