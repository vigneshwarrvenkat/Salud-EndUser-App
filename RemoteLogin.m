//
//  RemoteLogin.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/16/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "RemoteLogin.h"

@implementation RemoteLogin
-(int) getConnection:(NSArray*)keys forobjects:(NSArray*)values forurl:(NSString*) getUrl
{
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    NSData *jsonData ;
    NSString *jsonString;
    
    if([NSJSONSerialization isValidJSONObject:jsonDictionary])
    {
        jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary options:0 error:nil];
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSURL *url = [NSURL URLWithString:getUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: jsonData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    
    //If login is failed
    
    
    if (errorReturned) {
        NSLog(@"Error %@",errorReturned.description);
        _errorMsg = errorReturned.description;
        return 1;
    }
    else
    {
        NSError *jsonParsingError = nil;
        NSMutableArray *arrDoctorInfo  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&jsonParsingError];
        _jsonData = arrDoctorInfo;
       
        return 2;
    }
}
@end
