//
//  UIAlertMessage.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 11/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "UIAlertMessage.h"

@implementation UIAlertMessage

-(void)displayMessage{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"Please Internet Connection. Please try again later..." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil ];
    
    [alert show];
    
    
}

@end

