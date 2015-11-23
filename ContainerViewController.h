//
//  ContainerViewController.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr) on 11/14/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TableSelectionProtocol <NSObject>


- (void)rowSelectedWithAddin:(NSDictionary *)addin;


@end



@interface ContainerViewController : UITableViewController{
    
    NSMutableArray *arryList;
    NSMutableArray *arryListCost;
    }
@property(strong,nonatomic) NSString *leftText;
@property(strong,nonatomic) NSString *rightText;

@property(strong,nonatomic) NSString *categoryValue;

@property (nonatomic, weak) id <TableSelectionProtocol> delegate;

@end
